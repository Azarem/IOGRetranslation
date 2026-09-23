import { useState } from 'react'
import { useProjectData } from './hooks/useProjectData'
import { ModuleSelector } from './components/ModuleSelector'
import { RomFilePicker } from './components/RomFilePicker'
import { RomBuilder } from './components/RomBuilder'
import { Notepad } from './components/Notepad'
import { FolderPicker } from './components/FolderPicker'
import { NotificationSystem, useNotifications } from './components/NotificationSystem'
import { ChunkFile } from '@gaialabs/core'
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
        <h1>{projectData.projectName}</h1>
        <h2>ROM Patcher</h2>
      </div>
      <div className="workflow-container">
        <div className="workflow-step">
          <div className="card">
            <h3>📋 Version {projectData.version}</h3>
            <ul>
              {projectData.notes && projectData.notes.map((note: string) => (
                <li key={note}>{note}</li>
              ))}
            </ul>
          </div>
        </div>

        <div className="workflow-step">
          <RomFilePicker
            expectedCrc={projectData.crc} // Expected CRC for Illusion of Gaia ROM
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
              fileTypes={projectData.fileTypes}
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
              projectName={projectData.projectName}
              folderFiles={folderFiles}
              unshiftManualFiles={insertBeforeModules}
              fileTypes={projectData.fileTypes}
              expectedCrc={projectData.crc}
              packageHash={projectData.packageHash}
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

      <footer className="discord-footer">
        <a
          href="https://discord.gg/VWJteVzJQ"
          target="_blank"
          rel="noopener noreferrer"
          className="discord-link"
        >
          <svg className="discord-icon" viewBox="0 -28.5 256 256" xmlns="http://www.w3.org/2000/svg">
            <path d="M216.856 16.597A208.502 208.502 0 0 0 164.042 0c-2.275 4.113-4.933 9.645-6.766 14.046-19.692-2.961-39.203-2.961-58.533 0-1.832-4.4-4.55-9.933-6.846-14.046a207.809 207.809 0 0 0-52.855 16.638C5.618 67.147-3.443 116.4 1.087 164.956c22.169 16.555 43.653 26.612 64.775 33.193A161.094 161.094 0 0 0 79.735 175.3a136.413 136.413 0 0 1-21.846-10.632 108.636 108.636 0 0 0 5.356-4.237c42.122 19.702 87.89 19.702 129.51 0a131.66 131.66 0 0 0 5.355 4.237 136.07 136.07 0 0 1-21.886 10.653c4.006 8.02 8.638 15.67 13.873 22.848 21.142-6.58 42.646-16.637 64.815-33.213 5.316-56.288-9.08-105.09-38.056-148.36ZM85.474 135.095c-12.645 0-23.015-11.805-23.015-26.18s10.149-26.2 23.015-26.2c12.867 0 23.236 11.824 23.015 26.2.02 14.375-10.148 26.18-23.015 26.18Zm85.051 0c-12.645 0-23.014-11.805-23.014-26.18s10.148-26.2 23.014-26.2c12.867 0 23.236 11.824 23.015 26.2 0 14.375-10.148 26.18-23.015 26.18Z" fill="currentColor"/>
          </svg>
          Join the GaiaLabs Discord
        </a>
        <span className="discord-subtext">Bug reports · Feature requests · Translation feedback</span>
      </footer>
    </>
  )
}

export default App
