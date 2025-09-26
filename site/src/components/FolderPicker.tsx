import { useState, useRef } from 'react';
import { ChunkFile, BinType, readFileAsText, readFileAsBinary } from '@gaialabs/shared';
import './FolderPicker.css';

interface FolderPickerProps {
  onFilesLoaded: (files: ChunkFile[]) => void;
  onError: (error: string) => void;
}

export function FolderPicker({ onFilesLoaded, onError }: FolderPickerProps) {
  const [selectedFolder, setSelectedFolder] = useState<string | null>(null);
  const [asmFiles, setAsmFiles] = useState<ChunkFile[]>([]);
  const [isScanning, setIsScanning] = useState(false);
  const [scanError, setScanError] = useState<string | null>(null);
  const folderInputRef = useRef<HTMLInputElement>(null);

  const handleFolderSelect = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const files = event.target.files;
    if (!files || files.length === 0) {
      setSelectedFolder(null);
      setAsmFiles([]);
      setScanError(null);
      onFilesLoaded([]);
      return;
    }

    setIsScanning(true);
    setScanError(null);

    try {
      // Get the base folder name from the first file
      const firstFile = files[0];
      const baseFolderName = firstFile.webkitRelativePath?.split('/')[0] || 'selected-folder';
      setSelectedFolder(baseFolderName);

      // Filter for .asm files (case-insensitive)
      const chunkFiles = await Promise.all(Array.from(files).map(async (file) => {
        //Pull out name and extension using regex
        const matches = file.name.match(/([^\\/]+)\.([^\\/.]+)$/);

        if(!matches || matches.length < 3) return null;
        const [name, extension] = matches.slice(1, 3);
        
        const chunkFile: ChunkFile = {
          name,
          type: BinType.Assembly,
          size: file.size,
          location: 0,
          mnemonics: []
        };

        switch(extension.toLowerCase()) {
          case 'asm':
            chunkFile.type = BinType.Assembly;
            chunkFile.textData = await readFileAsText(file.name);
            return chunkFile;

          case 'txt':
          case 'patch':
            chunkFile.type = BinType.Patch;
            chunkFile.textData = await readFileAsText(file.name);
            return chunkFile;

          case 'bmp': chunkFile.type = BinType.Bitmap; break;
          case 'set': chunkFile.type = BinType.Tileset; break;
          case 'map': chunkFile.type = BinType.Tilemap; break;
          case 'pal': chunkFile.type = BinType.Palette; break;
          case 'spm': chunkFile.type = BinType.Spritemap; break;
          case 'bgm': chunkFile.type = BinType.Music; break;
          case 'sfx': chunkFile.type = BinType.Sound; break;
          case 'bin': chunkFile.type = BinType.Unknown; break;
          default: return null;
        }

        chunkFile.rawData = await readFileAsBinary(file.name);
        return chunkFile;
      }));

      const resolvedChunkFiles = chunkFiles.filter(file => !!file);

      if (resolvedChunkFiles.length === 0) {
        setScanError('No valid files found in the selected folder');
        setAsmFiles([]);
        onFilesLoaded([]);
        return;
      }

      setAsmFiles(resolvedChunkFiles);
      onFilesLoaded(resolvedChunkFiles);

      if (resolvedChunkFiles.length < chunkFiles.length) {
        setScanError(`Warning: ${chunkFiles.length - resolvedChunkFiles.length} files could not be read`);
      }

    } catch (error) {
      const errorMessage = error instanceof Error ? error.message : 'Unknown error occurred while scanning folder';
      setScanError(errorMessage);
      onError(errorMessage);
      setAsmFiles([]);
      onFilesLoaded([]);
    } finally {
      setIsScanning(false);
    }
  };

  const handleClearFolder = () => {
    setSelectedFolder(null);
    setAsmFiles([]);
    setScanError(null);
    onFilesLoaded([]);
    
    // Reset the file input
    if (folderInputRef.current) {
      folderInputRef.current.value = '';
    }
  };

  const handleButtonClick = () => {
    folderInputRef.current?.click();
  };

  return (
    <div className="folder-picker">
      <h3>📁 Folder Selection</h3>
      <p className="picker-description">
        Select a folder containing .asm files to include in your ROM build. 
        All .asm files found in the folder and its subdirectories will be processed.
      </p>

      <div className="folder-input-container">
        <input
          ref={folderInputRef}
          type="file"
          webkitdirectory=""
          directory=""
          multiple
          onChange={handleFolderSelect}
          className="folder-input"
          id="folder-input"
        />
        <button onClick={handleButtonClick} className="folder-input-label">
          {selectedFolder ? `📁 ${selectedFolder}` : 'Choose Folder...'}
        </button>
        {selectedFolder && (
          <button onClick={handleClearFolder} className="clear-button">
            Clear
          </button>
        )}
      </div>

      {isScanning && (
        <div className="scanning-status">
          <div className="loading-spinner"></div>
          <span>Scanning folder for .asm files...</span>
        </div>
      )}

      {scanError && (
        <div className="scan-error">
          <span className="error-icon">⚠️</span>
          <span>{scanError}</span>
        </div>
      )}

      {selectedFolder && !isScanning && (
        <div className="folder-status">
          <div className="status-info">
            <span className={`status-indicator ${asmFiles.length > 0 ? 'ready' : 'empty'}`}>
              {asmFiles.length > 0 ? '✅' : '📄'}
            </span>
            <span>
              Found {asmFiles.length} .asm file{asmFiles.length !== 1 ? 's' : ''}
              {selectedFolder && ` in "${selectedFolder}"`}
            </span>
          </div>

          {asmFiles.length > 0 && (
            <div className="file-list">
              <details>
                <summary>View discovered files ({asmFiles.length})</summary>
                <ul className="file-list-items">
                  {asmFiles.map((file, index) => (
                    <li key={index} className="file-item">
                      <span className="file-name">{file.name}</span>
                      <span className="file-type">{file.type}</span>
                      <span className="file-size">
                        {file.textData ? `${file.textData.length} chars` : 'Empty'}
                      </span>
                    </li>
                  ))}
                </ul>
              </details>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
