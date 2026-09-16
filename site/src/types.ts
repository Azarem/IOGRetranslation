export interface ModuleGroup {
  name?: string;
  options: ModuleOption[];
}

export interface ModuleOption {
  id: string;
  name: string;
  description?: string;
  default?: boolean;
}

export interface RomValidationResult {
  isValid: boolean;
  expectedCrc: number;
  actualCrc?: number;
  error?: string;
}

export interface RomGenerationProgress {
  stage: string;
  progress: number;
  message: string;
}
