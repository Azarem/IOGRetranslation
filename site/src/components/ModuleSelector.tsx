import React from 'react';
import { ModuleGroup } from '../types';
import './ModuleSelector.css';

interface ModuleSelectorProps {
  modules: ModuleGroup[];
}

export function ModuleSelector({ modules }: ModuleSelectorProps) {
  // Defensive check for modules
  if (!modules || !Array.isArray(modules)) {
    return (
      <div className="module-selector">
        <h2>Module Selection</h2>
        <p className="error-message">No modules available for selection</p>
      </div>
    );
  }

  // Function to get all selected values
  const getSelectedValues = () => {
    const form = document.querySelector('.module-selector form') as HTMLFormElement;
    if (!form) return [];

    const formData = new FormData(form);
    const values: string[] = [];

    for (const [key, value] of formData.entries()) {
      // Only include non-empty values and exclude "on" values from radio buttons without proper values
      const stringValue = value as string;
      if (stringValue && stringValue !== 'on') {
        values.push(stringValue);
      }
    }

    return values;
  };

  return (
    <div className="module-selector">
      <h2>Module Selection</h2>
      <p className="selector-description">
        Choose your preferred options for each module group. Each group allows exactly one selection.
      </p>
      <form>
        <div className="groups-container">
          {modules.map((group, groupIndex) => {
            // Handle nested groups structure
            if (group.groups && Array.isArray(group.groups)) {
              return (
                <div key={group.name || `group-${groupIndex}`} className="module-category">
                  <h3 className="category-title">{group.name}</h3>
                  <div className="nested-groups">
                    {group.groups.map((nestedGroup: any, nestedIndex: number) => {
                      const groupName = nestedGroup.name || `${group.name}-${nestedIndex}`;

                      if (!nestedGroup.options || !Array.isArray(nestedGroup.options)) {
                        return (
                          <div key={groupName} className="module-group">
                            <h4 className="group-title">{nestedGroup.name || `Subgroup ${nestedIndex + 1}`}</h4>
                            <p className="error-message">No options available for this group</p>
                          </div>
                        );
                      }

                      const defaultOption = nestedGroup.options.find((opt: any) => opt.default) || nestedGroup.options[0];

                      return (
                        <div key={groupName} className="module-group">
                          <h4 className="group-title">{nestedGroup.name}</h4>
                          <div className="options-container">
                            {nestedGroup.options.map((option: any, optionIndex: number) => {
                              // Use option.name as the radio button value for meaningful module names
                              const radioValue = option.module;
                              return (
                                <label key={`${groupName}-${option.id || optionIndex}`} className="option-label">
                                  <input
                                    type="radio"
                                    name={groupName}
                                    value={radioValue ?? undefined}
                                    defaultChecked={option.default}
                                    className="option-radio"
                                  />
                                  <span className="option-content">
                                    <span className="option-name">{option.name}</span>
                                    {option.description && (
                                      <span className="option-description">{option.description}</span>
                                    )}
                                  </span>
                                </label>
                              );
                            })}
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>
              );
            }
          })}
        </div>
      </form>
    </div>
  );
}
