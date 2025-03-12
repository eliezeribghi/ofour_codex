import { defineConfig } from "vite";
import { svelte } from "@sveltejs/vite-plugin-svelte";

// https://vitejs.dev/config/
export default defineConfig({
  
  root: "./", // spécifie que la racine du projet est à la racine du dossier frontend
  publicDir: "public",
  build: {
    outDir   : 'dist',
    rollupOptions: {
      input: "index.html", // Spécifie explicitement l'entrée
    },
 // le dossier de sortie après le build
  },
  css: {
    preprocessorOptions: {
      sass: {
        // Configurations Sass ici
      },
    },
  },
  plugins: [svelte()],
  server: {
    host: true,
    watch: {
      usePolling: true,
    }
  }
});
