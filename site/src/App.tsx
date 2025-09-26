import { useState } from 'react'
import { useProjectData } from './hooks/useProjectData'
import { ModuleSelector } from './components/ModuleSelector'
import { RomFilePicker } from './components/RomFilePicker'
import { RomBuilder } from './components/RomBuilder'
import { Notepad } from './components/Notepad'
import { FolderPicker } from './components/FolderPicker'
import { NotificationSystem, useNotifications } from './components/NotificationSystem'
import { ChunkFile } from '@gaialabs/shared'
import './App.css'

function App() {
  const { projectData, loading, error, refetch } = useProjectData();

  const [romFile, setRomFile] = useState<File | null>(null);
  const [romData, setRomData] = useState<Uint8Array | null>(null);
  const [builtRom, setBuiltRom] = useState<Uint8Array | null>(null);
  const [buildError, setBuildError] = useState<string | null>(null);
  const [folderFiles, setFolderFiles] = useState<ChunkFile[]>([]);
  const [insertBeforeModules, setInsertBeforeModules] = useState<boolean>(false);

  const {
    notifications,
    dismissNotification,
    showSuccess,
    showError,
    showWarning,

  } = useNotifications();

  if (loading) {
    return (
      <div>
        <div className="app-header">
          <h1>Illusion of Gaia: Retranslated</h1>
          <h2>ROM Patcher</h2>
        </div>
        <div className="card">
          <div className="loading-spinner"></div>
          <span>Loading project data...</span>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <>
        <NotificationSystem
          notifications={notifications}
          onDismiss={dismissNotification}
        />
        <div> 
          <div className="app-header">
            <h1>Illusion of Gaia: Retranslated</h1>
            <h2>ROM Patcher</h2>
          </div>
          <div className="card error">
            <h3>❌ Failed to Load Project</h3>
            <p>Error: {error}</p>
            <button onClick={() => {
              showWarning('Retrying...', 'Attempting to reload project data');
              refetch();
            }}>
              Retry
            </button>
          </div>
        </div>
      </>
    );
  }

  if (!projectData) {
    return (
      <div>
        <div className="app-header">
          <h1>Illusion of Gaia: Retranslated</h1>
          <h2>ROM Patcher</h2>
        </div>
        <div className="card">
          <h3>⚠️ No Project Data</h3>
          <p>No project data available</p>
          <button onClick={refetch}>Retry</button>
        </div>
      </div>
    );
  }



  const handleRomFileValidated = (file: File, data: Uint8Array) => {
    setRomFile(file);
    setRomData(data);
    showSuccess(
      'ROM File Validated',
      `${file.name} (${(file.size / 1024 / 1024).toFixed(2)} MB) is ready for patching`
    );
  };

  const handleRomValidationError = (error: string) => {
    setRomFile(null);
    setRomData(null);
    showError('ROM Validation Failed', error);
  };

  const handleBuildComplete = (romData: Uint8Array) => {
    setBuiltRom(romData);
    setBuildError(null);
    showSuccess(
      'ROM Build Complete!',
      `Your custom ROM (${(romData.length / 1024 / 1024).toFixed(2)} MB) is ready for download`
    );
  };

  const handleBuildError = (error: string) => {
    setBuildError(error);
    setBuiltRom(null);
    showError('ROM Build Failed', error);
  };

  const handleFolderFilesLoaded = (files: ChunkFile[]) => {
    setFolderFiles(files);
    if (files.length > 0) {
      showSuccess(
        'Folder Scanned',
        `Found ${files.length} .asm file${files.length !== 1 ? 's' : ''} ready for processing`
      );
    }
  };

  const handleFolderError = (error: string) => {
    setFolderFiles([]);
    showError('Folder Scan Failed', error);
  };

  const handleBeforeChanged = (before: boolean) => {
    setInsertBeforeModules(before);
  };

  return (
    <>
      <NotificationSystem
        notifications={notifications}
        onDismiss={dismissNotification}
      />
      <div className="app-header">
        <h1>{projectData.project.name}</h1>
        <h2>ROM Patcher</h2>
      </div>
      <div className="workflow-container">
        <div className="workflow-step">
          <div className="card">
            <h3>📋 Version {projectData.name}</h3>
            <ul>
              {projectData.notes && projectData.notes.map((note: string) => (
                <li key={note}>{note}</li>
              ))}
            </ul>
          </div>
        </div>

        <div className="workflow-step">
          <RomFilePicker
            expectedCrc={projectData.baseRomBranch.gameRomBranch.gameRom.crc} // Expected CRC for Illusion of Gaia ROM
            onFileValidated={handleRomFileValidated}
            onValidationError={handleRomValidationError}
          />
        </div>

        {projectData.modules && projectData.modules.length > 0 && (
          <div className="workflow-step">
            <ModuleSelector
              modules={projectData.modules}
            />
          </div>
        )}

        {romData && (
          <div className="workflow-step">
            <FolderPicker
              onFilesLoaded={handleFolderFilesLoaded}
              onError={handleFolderError}
              onUnshiftChanged={handleBeforeChanged}
            />
          </div>
        )}

        {romData && (
          <div className="workflow-step">
            <Notepad />
          </div>
        )}

        {romData && (
          <div className="workflow-step">
            <RomBuilder
              romData={romData}
              projectName={projectData.project.name}
              folderFiles={folderFiles}
              unshiftManualFiles={insertBeforeModules}
              onBuildComplete={handleBuildComplete}
              onBuildError={handleBuildError}
            />
          </div>
        )}
      </div>

      {buildError && (
        <div className="card error">
          <h3>Build Error</h3>
          <p style={{ color: 'red' }}>{buildError}</p>
        </div>
      )}
    </>
  )
}

export default App
