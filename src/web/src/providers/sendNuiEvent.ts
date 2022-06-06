const sendNuiEvent = (moduleName: string, functionName: string, argsList: Object) => {
   fetch(`https://ncs_core/${moduleName}::${functionName}`, {
      method: "POST",
      headers: {
         "Content-Type": "application/json; charset=UTF-8",
      },
      body: JSON.stringify(argsList)
   })
}

export default sendNuiEvent