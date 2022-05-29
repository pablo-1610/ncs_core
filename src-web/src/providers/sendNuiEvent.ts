const sendNuiEvent = (resourceName: String, moduleName: String, functionName: String, argsList: Object) => {
   fetch(`https://${resourceName}/${moduleName}::${functionName}`, {
      method: 'POST',
      headers: {
         'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(argsList)
   })
}

export default sendNuiEvent