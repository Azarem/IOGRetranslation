import { useState } from 'react';
import './Notepad.css';

interface NotepadProps {
  // No props needed for now, but keeping the interface for future extensibility
}

export function Notepad({}: NotepadProps) {
  const [content, setContent] = useState<string>('');

  const handleContentChange = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
    setContent(event.target.value);
  };

  const clearContent = () => {
    setContent('');
  };

  return (
    <div className="notepad">
      <h3>📝 Notepad</h3>
      <p className="notepad-description">
        Enter custom assembly (ASM) code that will be compiled and integrated with your ROM. 
        This code will be processed along with the selected modules during ROM generation.
      </p>

      <div className="notepad-content">
        <div className="notepad-header">
          <span className="content-info">
            {content.trim() ? `${content.trim().split('\n').length} lines` : 'Empty'}
          </span>
          {/* {content.trim() && (
            <button 
              onClick={clearContent}
              className="clear-button"
              type="button"
            >
              Clear
            </button>
          )} */}
        </div>

        <textarea
          id="notepad-textarea"
          className="notepad-textarea"
          value={content}
          onChange={handleContentChange}
          placeholder="Enter your assembly code here...

Example:
; Custom patch
widestring_example `[TPL:0]Hello World![END]`

; Assembly code
LDA #$00
STA $7E0000"
          rows={12}
          spellCheck={false}
        />

        <div className="notepad-status">
          <span className={`status-indicator ${content.trim() ? 'ready' : 'empty'}`}>
            {content.trim() ? '✅' : '📝'}
          </span>
          <span>
            Notepad: {content.trim() ? 'Contains custom code' : 'Empty'}
          </span>
        </div>
      </div>
    </div>
  );
}
