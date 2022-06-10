import sendNuiEvent from "./sendNuiEvent"

const disableCursor = () => {
   sendNuiEvent("core", "onDisableCursor", {})
}

export default disableCursor