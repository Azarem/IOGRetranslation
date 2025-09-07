import { useState, useEffect } from 'react';
import { ProjectPayload } from '../types';
import { SupabaseService } from '../services/supabaseService';

interface UseProjectDataResult {
  projectData: ProjectPayload | null;
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
}

export function useProjectData(): UseProjectDataResult {
  const [projectData, setProjectData] = useState<ProjectPayload | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchData = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await SupabaseService.fetchProjectBranch();
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
