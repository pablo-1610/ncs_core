import React from "react"
import ReactDOM from "react-dom/client"
import Visibility from "./providers/visibility"
import HUD from "./components/HUD"
import "./assets/index.css"

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <>
      <Visibility moduleName="hud" visibleComponent={<HUD />} alwaysVisible={true} />
    </>
  </React.StrictMode>
)
