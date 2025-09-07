// Types based on the shared package ProjectPayload
export interface ProjectPayload {
  branch: {
    id: string;
    name: string | null;
    version: number | null;
    isPublic: boolean;
    projectId: string;
    baseRomBranchId: string;
    fileCrcs: number[];
    modules: ModuleGroup[];
    createdAt: string;
    updatedAt: string;
    project: {
      id: string;
      name: string;
      meta: any;
      gameId: string;
      baseRomId: string;
      createdAt: string;
      updatedAt: string;
    };
  };
  files: any[];
}

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
