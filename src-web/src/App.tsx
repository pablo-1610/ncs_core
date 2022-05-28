import { useState } from 'react'
import receiveNuiEvent from './providers/receiveNuiEvent'

function App() {
  const [name, setName] = useState('')
  receiveNuiEvent('core', 'set_menu_data', (data: {
    name: string
  }) => {
    setName(data.name)
  })

  return (
    <div className="bg-zinc-900 border border-gray-500 w-fit mt-2 ml-2 px-2 py-1 rounded">
      <h1 className="text-white font-mono text-xl">{name ? `Hi ${name}!` : 'Hi!'}</h1>
    </div>
  )
}

export default App
