import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => {
  // Load env file based on `mode` in the current working directory.
  // Set the third parameter to '' to load all env regardless of the `VITE_` prefix.
  const env = loadEnv(mode, process.cwd(), '')

  // For production builds, GitHub Actions will set these as environment variables
  // For local development, they come from the .env file
  const supabaseUrl = env.VITE_SUPABASE_URL || process.env.VITE_SUPABASE_URL
  const supabaseAnonKey = env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_ANON_KEY
  const projectName = env.VITE_PROJECT_NAME || process.env.VITE_PROJECT_NAME

  // Optional: Log environment variable status during build
  if (mode === 'development') {
    console.log('Environment variables loaded:', {
      VITE_SUPABASE_URL: supabaseUrl ? 'SET' : 'NOT SET',
      VITE_SUPABASE_ANON_KEY: supabaseAnonKey ? 'SET' : 'NOT SET',
      VITE_PROJECT_NAME: projectName ? 'SET' : 'NOT SET'
    });
  }

  return {
    plugins: [react()],
    base: '/IOGRetranslation/',
    build: {
      outDir: 'dist',
      assetsDir: 'assets',
      sourcemap: true,
    },
    server: {
      port: 3000,
      open: true,
    },
    // Expose environment variables to the client
    envPrefix: ['VITE_'],
    define: {
      global: 'globalThis',
      // Expose environment variables that @gaialabs/shared expects
      // These will be available as process.env.* in the client code
      'process.env.PROJECT_NAME': JSON.stringify(projectName),
      'process.env.SUPABASE_URL': JSON.stringify(supabaseUrl),
      'process.env.SUPABASE_ANON_KEY': JSON.stringify(supabaseAnonKey),
    },
  }
})
