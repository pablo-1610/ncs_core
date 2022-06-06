import {build, defineConfig} from "vite"
import {VitePluginFonts} from "vite-plugin-fonts"
import react from "@vitejs/plugin-react"

// https://vitejs.dev/config/
export default defineConfig({
  base: "./",
  build: {
    minify: "terser",
  },
  plugins: [
    react(),
    VitePluginFonts({
      google: {
        families: ["Overpass:wght@400;500;600;700"]
      }
    })
  ]
})
