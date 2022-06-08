import sendNuiEvent from "./sendNuiEvent"

const enableCursor = () => {
   sendNuiEvent("core", "onEnableCursor", {})
}

export default enableCursor