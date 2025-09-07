import { useState, useRef } from 'react';
import { crc32_buffer } from '@gaialabs/shared';
import { RomValidationResult } from '../types';
import './RomFilePicker.css';

interface RomFilePickerProps {
  expectedCrc?: number;
  onFileValidated: (file: File, romData: Uint8Array) => void;
  onValidationError: (error: string) => void;
}

export function RomFilePicker({ expectedCrc, onFileValidated, onValidationError }: RomFilePickerProps) {
  const [selectedFile, setSelectedFile] = useState<File | null>(null);
  const [validationResult, setValidationResult] = useState<RomValidationResult | null>(null);
  const [isValidating, setIsValidating] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const validateRomFile = async (file: File): Promise<RomValidationResult> => {
    try {
      // Read file as array buffer
      const arrayBuffer = await file.arrayBuffer();
      const romData = new Uint8Array(arrayBuffer);
      
      // Calculate CRC32
      const actualCrc = crc32_buffer(romData);
      
      // Check if we have an expected CRC to validate against
      if (expectedCrc !== undefined) {
        const isValid = actualCrc === expectedCrc;
        return {
          isValid,
          expectedCrc,
          actualCrc,
          error: isValid ? undefined : `CRC mismatch. Expected: ${expectedCrc}, Got: ${actualCrc}`
        };
      } else {
        // If no expected CRC, just return the calculated CRC
        return {
          isValid: true,
          expectedCrc: actualCrc,
          actualCrc
        };
      }
    } catch (error) {
      return {
        isValid: false,
        expectedCrc: expectedCrc || 0,
        error: `Failed to read ROM file: ${error instanceof Error ? error.message : 'Unknown error'}`
      };
    }
  };

  const handleFileSelect = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) {
      setSelectedFile(null);
      setValidationResult(null);
      return;
    }

    setSelectedFile(file);
    setIsValidating(true);
    setValidationResult(null);

    try {
      const result = await validateRomFile(file);
      setValidationResult(result);

      if (result.isValid) {
        // Re-read the file to pass the data to the parent
        const arrayBuffer = await file.arrayBuffer();
        const romData = new Uint8Array(arrayBuffer);
        onFileValidated(file, romData);
      } else {
        onValidationError(result.error || 'ROM validation failed');
      }
    } catch (error) {
      const errorMessage = `Validation error: ${error instanceof Error ? error.message : 'Unknown error'}`;
      setValidationResult({
        isValid: false,
        expectedCrc: expectedCrc || 0,
        error: errorMessage
      });
      onValidationError(errorMessage);
    } finally {
      setIsValidating(false);
    }
  };

  const handleClearFile = () => {
    setSelectedFile(null);
    setValidationResult(null);
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
  };

  const handleButtonClick = () => {
    fileInputRef.current?.click();
  };

  return (
    <div className="rom-file-picker">
      <h3>Select ROM File</h3>
      <p className="picker-description">
        Choose your original Illusion of Gaia ROM file (.smc, .sfc, or .bin format).
        {expectedCrc && ` The file will be validated against CRC32: ${expectedCrc}`}
      </p>

      <div className="file-input-container">
        <input
          ref={fileInputRef}
          type="file"
          accept=".smc,.sfc,.bin"
          onChange={handleFileSelect}
          className="file-input"
          id="rom-file-input"
        />
        <button onClick={handleButtonClick} className="file-input-label">
          {selectedFile ? selectedFile.name : 'Choose ROM File...'}
        </button>
        {selectedFile && (
          <button onClick={handleClearFile} className="clear-button">
            Clear
          </button>
        )}
      </div>

      {isValidating && (
        <div className="validation-status validating">
          <span className="status-icon">⏳</span>
          Validating ROM file...
        </div>
      )}

      {validationResult && !isValidating && (
        <div className={`validation-status ${validationResult.isValid ? 'valid' : 'invalid'}`}>
          <span className="status-icon">
            {validationResult.isValid ? '✅' : '❌'}
          </span>
          <div className="status-content">
            {validationResult.isValid ? (
              <div>
                <div className="status-message">ROM file is valid!</div>
                <div className="crc-info">CRC32: {validationResult.actualCrc}</div>
              </div>
            ) : (
              <div>
                <div className="status-message">ROM validation failed</div>
                <div className="error-message">{validationResult.error}</div>
                {validationResult.actualCrc && (
                  <div className="crc-info">
                    Expected: {validationResult.expectedCrc}, Got: {validationResult.actualCrc}
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      )}

      {selectedFile && validationResult?.isValid && (
        <div className="file-info">
          <h4>File Information</h4>
          <div className="info-grid">
            <span>Name:</span> <span>{selectedFile.name}</span>
            <span>Size:</span> <span>{(selectedFile.size / 1024 / 1024).toFixed(2)} MB</span>
            <span>Type:</span> <span>{selectedFile.type || 'Unknown'}</span>
            <span>CRC32:</span> <span>{validationResult.actualCrc}</span>
          </div>
        </div>
      )}
    </div>
  );
}
