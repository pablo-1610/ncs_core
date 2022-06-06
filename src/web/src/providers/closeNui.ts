import sendNuiEvent from "./sendNuiEvent"
import type messageData from "../types/messageData"

const closeNui = (moduleName: string, disableCursor?: boolean) => {
   if(disableCursor) {
      sendNuiEvent(moduleName, "DISABLE_CURSOR", {})
   }

   const message: messageData = new Event("message")
   message.data = {
      moduleName: moduleName,
      functionName: "setVisible",
      argsList: {
         visible: false
      }
   }

   window.dispatchEvent(message)
}

export default closeNui