// import { useState, useEffect } from 'react'
// import axios from './axios-config'
import './App.css'

function App() {
  // const [users, setUsers] = useState([])

  // useEffect(() => {
  //   axios.get('/contacts').then((res) => setUsers(res.data))
  // }, [])

  return (
    <>
      <h1>Vite + React - Test Nginx</h1>
      <div className="card">
        <h2>Lista de Usuários - API Attack on Titan</h2>
        {/* <ul>
            {users.map(user => (
              <li key={user['id']}>
                <strong>{user['name']}</strong> - {user['phone']}
              </li>
            ))}
          </ul> */}
      </div>
    </>
  )
}

export default App
