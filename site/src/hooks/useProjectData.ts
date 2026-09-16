import { useState, useEffect } from 'react';
import { summaryFromPackageUrl, PackageSummary } from '@gaialabs/core'

interface UseProjectDataResult {
  projectData: PackageSummary | null;
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
}

export function useProjectData(): UseProjectDataResult {
  const [projectData, setProjectData] = useState<PackageSummary | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchData = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await summaryFromPackageUrl('/data');
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
