import { useState, useEffect } from 'react'
import './App.css'

function App() {
  const [users, setUsers] = useState([])

  useEffect(() => {
    fetch('http://localhost:3000/api/contacts')
      .then((resp) => resp.json())
      .then((json) => setUsers(json))
      .catch((error) => console.log('error fetching data:', error))
  }, [])

  return (
    <>
      <h1>Vite + React - Test Nginx</h1>
      <div className="card">
        <h2>Lista de Usuários - API Attack on Titan</h2>
        {users.length > 0 ? (
          <ul>
            {users.map(user => (
              <li key={user.id}>
                <strong>{user.name}</strong> - {user.phone}
              </li>
            ))}
          </ul>
        ) : (
          <p>Carregando...</p>
        )}
      </div>
    </>
  )
}

export default App
