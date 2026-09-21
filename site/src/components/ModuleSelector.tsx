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

  const renderImageOptions = (nestedGroup: any, groupName: string) => {
    return (
      <div key={groupName} className="module-group">
        {nestedGroup.name && <h4 className="group-title">{nestedGroup.name}</h4>}
        <div className="image-options-container">
          {nestedGroup.options.map((option: any, optionIndex: number) => {
            const radioValue = option.module;
            return (
              <label key={`${groupName}-${option.id || optionIndex}`} className="image-option-label">
                <input
                  type="radio"
                  name={groupName}
                  value={radioValue ?? undefined}
                  defaultChecked={option.default}
                  className="image-option-radio"
                />
                <span className="image-option-card">
                  {option.image ? (
                    <span className="image-option-thumbnail-wrapper">
                      <img
                        src={`/images/${option.image}`}
                        alt={option.name}
                        className="image-option-thumbnail"
                        loading="lazy"
                      />
                    </span>
                  ) : (
                    <span className="image-option-no-image">
                      <span>No preview</span>
                    </span>
                  )}
                  <span className="image-option-info">
                    <span className="image-option-name">{option.name}</span>
                    {option.description && (
                      <span className="image-option-description">{option.description}</span>
                    )}
                  </span>
                  <span className="image-option-check">✓</span>
                </span>
              </label>
            );
          })}
        </div>
      </div>
    );
  };

  const renderTextOptions = (nestedGroup: any, groupName: string) => {
    if (!nestedGroup.options || !Array.isArray(nestedGroup.options)) {
      return (
        <div key={groupName} className="module-group">
          <h4 className="group-title">{nestedGroup.name || 'Options'}</h4>
          <p className="error-message">No options available for this group</p>
        </div>
      );
    }

    return (
      <div key={groupName} className="module-group">
        <h4 className="group-title">{nestedGroup.name}</h4>
        <div className="options-container">
          {nestedGroup.options.map((option: any, optionIndex: number) => {
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
            if (group.groups && Array.isArray(group.groups)) {
              return (
                <div key={group.name || `group-${groupIndex}`} className="module-category">
                  <h3 className="category-title">{group.name}</h3>
                  <div className="nested-groups">
                    {group.groups.map((nestedGroup: any, nestedIndex: number) => {
                      const groupName = nestedGroup.name || `${group.name}-${nestedIndex}`;
                      const hasImages = nestedGroup.options?.some((opt: any) => opt.image);

                      if (hasImages) {
                        return renderImageOptions(nestedGroup, groupName);
                      }
                      return renderTextOptions(nestedGroup, groupName);
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
