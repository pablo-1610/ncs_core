type messageData = Event & {
   data?: {
      moduleName: string,
      functionName: string,
      argsList: any
   }
}

export default messageData