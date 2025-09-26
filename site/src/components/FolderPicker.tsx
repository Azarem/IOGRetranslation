import { useState, useRef } from 'react';
import { ChunkFile, BinType, readFileAsText, readFileAsBinary } from '@gaialabs/shared';
import './FolderPicker.css';

interface FolderPickerProps {
  onFilesLoaded: (files: ChunkFile[]) => void;
  onUnshiftChanged: (before: boolean) => void;
  onError: (error: string) => void;
}

export function FolderPicker({ onFilesLoaded, onError, onUnshiftChanged }: FolderPickerProps) {
  const [selectedFolder, setSelectedFolder] = useState<string | null>(null);
  const [asmFiles, setAsmFiles] = useState<ChunkFile[]>([]);
  const [isScanning, setIsScanning] = useState(false);
  const [scanError, setScanError] = useState<string | null>(null);
  const folderInputRef = useRef<HTMLInputElement>(null);

  const readFileContent = (file: File, text: boolean = false): Promise<any> => {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = (e) =>{
        const result = e.target?.result as any;
        if(typeof result === 'string') resolve(result);
        else resolve(new Uint8Array(result));
      };
      reader.onerror = () => reject(new Error(`Failed to read file: ${file.name}`));
      if(text) reader.readAsText(file);
      else reader.readAsArrayBuffer(file);
    });
  };

  // const getRelativePath = (file: File, basePath: string): string => {
  //   // Extract relative path from the file's webkitRelativePath
  //   const fullPath = file.webkitRelativePath || file.name;
    
  //   // Remove the base folder name from the path
  //   const pathParts = fullPath.split('/');
  //   if (pathParts.length > 1) {
  //     // Remove the first part (base folder name) and rejoin
  //     return pathParts.slice(1).join('/');
  //   }
    
  //   return file.name;
  // };

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
            chunkFile.textData = await readFileContent(file, true);
            return chunkFile;

          case 'txt':
          case 'patch':
            chunkFile.type = BinType.Patch;
            chunkFile.textData = await readFileContent(file, true);
            return chunkFile;
          case 'bin':
          case 'bmp': chunkFile.type = BinType.Bitmap; chunkFile.compressed = false; break;
          case 'set': chunkFile.type = BinType.Tileset; chunkFile.compressed = false; break;
          case 'map': chunkFile.type = BinType.Tilemap; chunkFile.compressed = false; break;
          case 'spm': chunkFile.type = BinType.Spritemap; chunkFile.compressed = false; break;
          case 'pal': chunkFile.type = BinType.Palette; break;
          case 'bgm': chunkFile.type = BinType.Music; break;
          case 'sfx': chunkFile.type = BinType.Sound; break;
          default: chunkFile.type = BinType.Unknown; break;
        }

        chunkFile.rawData = await readFileContent(file, false);
        return chunkFile;
      }));

      const resolvedChunkFiles = chunkFiles.filter(file => !!file);

      if (resolvedChunkFiles.length === 0) {
        setScanError('No valid files found in the selected folder');
        setAsmFiles([]);
        onFilesLoaded([]);
        return;
      }

      // Process each .asm file
      // const chunkFiles: ChunkFile[] = [];
      
      // for (const file of asmFileList) {
      //   try {
      //     const content = await readFileContent(file);
      //     const relativePath = getRelativePath(file, baseFolderName);

      //     const slashIx = Math.max(0, relativePath.indexOf('/'));
      //     const folderName = relativePath.slice(0, slashIx).toLowerCase();
      //     const type = folderName === 'asm' ? BinType.Assembly : BinType.Patch;
          
      //     const chunkFile: ChunkFile = {
      //       name: file.name.slice(0, -4),
      //       type: type,
      //       textData: content,
      //       size: 0,
      //       location: 0,
      //       mnemonics: []
      //     };
          
      //     chunkFiles.push(chunkFile);
      //   } catch (error) {
      //     console.error(`Error reading file ${file.name}:`, error);
      //     // Continue processing other files even if one fails
      //   }
      // }

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

  const handleChangeUnshift = (event: React.ChangeEvent<HTMLInputElement>) => {
    if(onUnshiftChanged) onUnshiftChanged(event.target.checked);
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
            <span>
              Found {asmFiles.length} file{asmFiles.length !== 1 ? 's' : ''}
              {selectedFolder && ` in "${selectedFolder}"`}
            </span>
          </div>

          {asmFiles.length > 0 && (
            <>
              <div className="status-info">
                <label htmlFor="insertBeforeModules">Insert before modules</label>
                <input type="checkbox" id="insertBeforeModules" onChange={handleChangeUnshift} />
              </div>
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
            </>
          )}
        </div>
      )}
    </div>
  );
}
