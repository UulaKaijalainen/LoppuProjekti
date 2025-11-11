import { Routes, Route, Link, Navigate, useNavigate } from "react-router-dom";
import { useState, useEffect  } from "react";
import './App.css'
import Register from './Register.jsx'
import Login from './Login.jsx'
import Confessions from './Confessions.jsx'

function App() {
  const [user, setUser] = useState(null);
   const [countdown, setCountdown] = useState(null);
  const navigate = useNavigate();

  const handleLogin = (userObj) => {
    setUser(userObj);
    // persist user minimally
    try { localStorage.setItem('user', JSON.stringify(userObj)); } catch (e) {}
    setCountdown(5);
  }

  const handleLogout = () => {
    setUser(null);
    try { localStorage.removeItem('user'); } catch (e) {}
  }

  useEffect(() => {
    if (countdown == null) return;
    if (countdown === 0) {
      setCountdown(null);
      navigate('/confessions')
      return;
    }
      const id = setTimeout(() => setCountdown(c => c - 1), 1000);
    return () => clearTimeout(id);
  }, [countdown, navigate]);

  

  return (
    <>
      <nav>
        <Link to="/login">Login</Link> | <Link to="/register">Register</Link>
      </nav>

      {user ? (
        <div className="p-6">
          <h2 className="text-xl font-semibold">Tervetuloa, {user.username}</h2>
          <p className="text-sm text-gray-600">Olet kirjautunut sisään.</p>
          <p>Sinut ohjataan Automaattisesti seuraavalle sivulle {countdown}</p>
          <button onClick={handleLogout} className="mt-4 px-3 py-2 rounded bg-red-500 text-white">Kirjaudu ulos</button>
        </div>
      ) : (
        <Routes>
          <Route path="/" element={<Navigate to="/login" replace />} />
          <Route path="/login" element={<Login onLogin={handleLogin} />} />
          <Route path="/register" element={<Register />} />
          <Route path="/confessions" />
        </Routes>
      )}
    </>
  )
}

export default App



