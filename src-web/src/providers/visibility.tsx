import { useState, FC, ReactNode } from 'react'
import receiveNuiEvent from './receiveNuiEvent'

const Visibility: FC<{moduleName: String, visibleComponent: any}> = ({moduleName, visibleComponent}) => {
   const [visible, setVisible] = useState(false)
   receiveNuiEvent(moduleName, 'setVisible', (data: {
      visible: boolean
   }) => {
      setVisible(data.visible)
   })

   return (
      <>
         {visible && (
            <>
               { visibleComponent }
            </>
         )}
      </>
   )
}

export default Visibility