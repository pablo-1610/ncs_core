import {useEffect} from 'react'

const receiveNuiEvent = (moduleName: String, functionName: String, moduleCallback: Function) => {
   useEffect(() => {
      const eventHandler = (event: MessageEvent) => {
         const data: { moduleName: String, functionName: String, argsList: Object } = event.data
         if (data.moduleName === moduleName && data.functionName === functionName) {
            moduleCallback(data.argsList)
         }
      }

      window.addEventListener('message', eventHandler)
      return () => window.removeEventListener('message', eventHandler)
   }, [])
}

export default receiveNuiEvent