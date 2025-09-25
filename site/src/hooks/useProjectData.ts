import { useState, useEffect } from 'react';
import { ProjectBranchData, summaryFromSupabaseByProject } from '@gaialabs/shared'

interface UseProjectDataResult {
  projectData: ProjectBranchData | null;
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
}

export function useProjectData(): UseProjectDataResult {
  const [projectData, setProjectData] = useState<ProjectBranchData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const projectName = process?.env?.PROJECT_NAME || 'Illusion of Gaia: Retranslated';

  const fetchData = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await summaryFromSupabaseByProject(projectName);
      setProjectData(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch project data');
      setProjectData(null);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  return {
    projectData,
    loading,
    error,
    refetch: fetchData,
  };
}
