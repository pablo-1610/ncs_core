import {FC, useEffect, useState} from "react"
import receiveNuiEvent from "./receiveNuiEvent"

const Visibility: FC<{moduleName: string, visibleComponent: any, alwaysVisible?: boolean}> = ({moduleName, visibleComponent, alwaysVisible = false}) => {
   const [visible, setVisible] = useState(false)
   useEffect(() => {
      if(alwaysVisible) {
         setVisible(true)
      }
   }, [])

   receiveNuiEvent(moduleName, "setVisible", (data: {
      visible: boolean
   }) => {
      if(alwaysVisible) return

      setVisible(data.visible)
   })

   return (
      <div id={moduleName} className="fixed">
         {visible && (
            <>
               { visibleComponent }
            </>
         )}
      </div>
   )
}

export default Visibility