const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL;
const SUPABASE_API_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY;
const PROJECT_NAME = import.meta.env.VITE_SUPABASE_PROJECT_NAME;

// Validate environment variables
if (!SUPABASE_URL) {
  throw new Error('VITE_SUPABASE_URL environment variable is required');
}
if (!SUPABASE_API_KEY) {
  throw new Error('VITE_SUPABASE_ANON_KEY environment variable is required');
}
if (!PROJECT_NAME) {
  throw new Error('VITE_SUPABASE_PROJECT_NAME environment variable is required');
}

export class SupabaseService {
  static async fetchProjectBranch() {
    try {
      const url = new URL(`${SUPABASE_URL}/rest/v1/ProjectBranch`);
      url.searchParams.set('apikey', SUPABASE_API_KEY);
      url.searchParams.set('select', 'id,name,version,isPublic,notes,projectId,baseRomBranchId,fileCrcs,modules,createdAt,updatedAt,project:Project!inner(id,name,meta,gameId,baseRomId,createdAt,updatedAt)');
      url.searchParams.set('project.name', `eq.${PROJECT_NAME}`);
      url.searchParams.set('name', 'eq.main');
      url.searchParams.set('version', 'is.null');
      url.searchParams.set('isPublic', 'eq.true');

      const response = await fetch(url.toString(), {
        headers: {
          'Authorization': `Bearer ${SUPABASE_API_KEY}`,
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error(`Supabase API error: ${response.status} ${response.statusText}`);
      }

      const data = await response.json();

      if (!data || data.length === 0) {
        throw new Error(`Project "${PROJECT_NAME}" with main branch not found`);
      }

      return {
        branch: data[0],
        files: [] // We'll fetch files separately if needed
      };
    } catch (error) {
      console.error('Error fetching project data:', error);
      throw new Error(`Failed to fetch project data: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }
}
