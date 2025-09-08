import { useState, useCallback } from 'react';
import { RomGenerator } from '@gaialabs/core';
import { RomGenerationProgress } from '../types';
import './RomBuilder.css';

interface RomBuilderProps {
  romData: Uint8Array;
  projectName: string;
  onBuildComplete: (romData: Uint8Array) => void;
  onBuildError: (error: string) => void;
}

export function RomBuilder({
  romData,
  projectName,
  onBuildComplete,
  onBuildError
}: RomBuilderProps) {
  const [isBuilding, setIsBuilding] = useState(false);
  const [progress, setProgress] = useState<RomGenerationProgress | null>(null);
  const [romOutput, setRomOutput] = useState<Uint8Array | null>(null);

  // Function to get module selections from the form
  const getModuleSelections = (): string[] => {
    const form = document.querySelector('.module-selector form') as HTMLFormElement;
    if (!form) return [];

    const formData = new FormData(form);
    const selections: string[] = [];

    for (const [key, value] of formData.entries()) {
      // Only include non-empty values and exclude "on" values from radio buttons without proper values
      const stringValue = value as string;
      if (stringValue && stringValue !== 'on') {
        selections.push(stringValue);
      }
    }
    
    return selections;
  };

  const buildRom = async () => {
    const moduleSelections = getModuleSelections();

    if (!romData || Object.keys(moduleSelections).length === 0) {
      onBuildError('ROM data and module selections are required');
      return;
    }

    setIsBuilding(true);
    setProgress({ stage: 'Initializing', progress: 0, message: 'Starting ROM generation...' });

    try {
      // Convert module selections to array format expected by RomGenerator
      const moduleList = Object.values(moduleSelections);
      
      setProgress({ stage: 'Validating', progress: 10, message: 'Validating ROM and modules...' });
      
      // Create RomGenerator instance
      const romGenerator = new RomGenerator();

      await romGenerator.initialize();
      await romGenerator.validateAndDownload(romData);
      
      setProgress({ stage: 'Generating', progress: 30, message: 'Generating project...' });
      
      // Generate the ROM
      const outputRom = await romGenerator.generateProject(moduleList);
      
      setProgress({ stage: 'Complete', progress: 100, message: 'ROM generation complete!' });

      setRomOutput(outputRom);
      // Call success callback
      onBuildComplete(outputRom);
      
    } catch (error) {
      console.error('ROM generation error:', error);
      const errorMessage = error instanceof Error ? error.message : 'Unknown error during ROM generation';
      onBuildError(errorMessage);
      setProgress({ stage: 'Error', progress: 0, message: errorMessage });
    } finally {
      setIsBuilding(false);
    }
  };

  const downloadRom = useCallback(() => {
    if (!romOutput) return;
    const blob = new Blob([romOutput], { type: 'application/octet-stream' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = `${projectName}.smc`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }, [romOutput, projectName]);

  const moduleSelections = getModuleSelections();
  const canBuild = romData && Object.keys(moduleSelections).length > 0 && !isBuilding;

  return (
    <div className="rom-builder">
      <h3>ROM Builder</h3>
      <p className="builder-description">
        Build your custom ROM with the selected modules. This process will create a new ROM file
        with your chosen modifications applied.
      </p>

      <div className="build-status">
        <div className="status-info">
          <span className={`status-indicator ${romData ? 'ready' : 'pending'}`}>
            {romData ? '✅' : '⏳'}
          </span>
          <span>ROM File: {romData ? 'Ready' : 'Not loaded'}</span>
        </div>
        
        <div className="status-info">
          <span className={`status-indicator ${Object.keys(moduleSelections).length > 0 ? 'ready' : 'pending'}`}>
            {Object.keys(moduleSelections).length > 0 ? '✅' : '⏳'}
          </span>
          <span>Modules: {Object.keys(moduleSelections).length} selected</span>
        </div>
      </div>

      {progress && (
        <div className="progress-container">
          <div className="progress-header">
            <span className="progress-stage">{progress.stage}</span>
            <span className="progress-percentage">{progress.progress}%</span>
          </div>
          <div className="progress-bar">
            <div 
              className="progress-fill" 
              style={{ width: `${progress.progress}%` }}
            />
          </div>
          <div className="progress-message">{progress.message}</div>
        </div>
      )}

      <div className="build-actions">
        <button 
          onClick={buildRom}
          disabled={!canBuild}
          className={`build-button ${canBuild ? 'ready' : 'disabled'}`}
        >
          {isBuilding ? 'Building ROM...' : 'Build ROM'}
        </button>
      </div>

      {progress?.stage === 'Complete' && (
        <div className="build-complete">
          <h4>Build Complete!</h4>
          <p>Your custom ROM has been generated successfully.</p>
          <button 
            onClick={() => downloadRom()} 
            className="download-button"
          >
            Download ROM
          </button>
        </div>
      )}
    </div>
  );
}
