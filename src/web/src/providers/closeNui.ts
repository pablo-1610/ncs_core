import type messageData from "../types/messageData"

const closeNui = (moduleName: string) => {
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