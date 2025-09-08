import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
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
  define: {
    global: 'globalThis',
    // Expose environment variables that @gaialabs/shared expects
    'process.env.PROJECT_NAME': JSON.stringify(process.env.VITE_PROJECT_NAME),
    'process.env.SUPABASE_URL': JSON.stringify(process.env.VITE_SUPABASE_URL),
    'process.env.SUPABASE_ANON_KEY': JSON.stringify(process.env.VITE_SUPABASE_ANON_KEY),
  },
})
