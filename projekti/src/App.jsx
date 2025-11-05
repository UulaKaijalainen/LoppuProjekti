import { Routes, Route, Link, Navigate } from "react-router-dom";
import { useState } from "react";
import './App.css'
import Register from './Register.jsx'
import Login from './Login.jsx'
function App() {
  const [user, setUser] = useState(null);

  const handleLogin = (userObj) => {
    setUser(userObj);
    // persist user minimally
    try { localStorage.setItem('user', JSON.stringify(userObj)); } catch (e) {}
  }

  const handleLogout = () => {
    setUser(null);
    try { localStorage.removeItem('user'); } catch (e) {}
  }

  return (
    <>
      <nav>
        <Link to="/login">Login</Link> | <Link to="/register">Register</Link>
      </nav>

      {user ? (
        <div className="p-6">
          <h2 className="text-xl font-semibold">Tervetuloa, {user.username}</h2>
          <p className="text-sm text-gray-600">Olet kirjautunut sisään.</p>
          <button onClick={handleLogout} className="mt-4 px-3 py-2 rounded bg-red-500 text-white">Kirjaudu ulos</button>
        </div>
      ) : (
        <Routes>
          <Route path="/" element={<Navigate to="/login" replace />} />
          <Route path="/login" element={<Login onLogin={handleLogin} />} />
          <Route path="/register" element={<Register />} />
        </Routes>
      )}
    </>
  )
}

export default App



