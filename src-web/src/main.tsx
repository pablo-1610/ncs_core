import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './assets/index.css'
import Visibility from './providers/visibility'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <>
      <Visibility moduleName="core" visibleComponent={<App />} />
    </>
  </React.StrictMode>
)
