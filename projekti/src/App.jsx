import { Routes, Route, Link, Navigate, useNavigate } from "react-router-dom";
import { useState, useEffect  } from "react";
import './App.css'
import Register from './Register.jsx'
import Login from './Login.jsx'
import Confessions from './Confessions.jsx'
import Foorumi from './Foorumi.jsx'

function App() {
  const [user, setUser] = useState(null);
   const [countdown, setCountdown] = useState(null);
  const navigate = useNavigate();

  const handleLogin = (userObj) => {
    setUser(userObj);
    // persist user minimally
    try { localStorage.setItem('user', JSON.stringify(userObj)); } catch (e) {}
    setCountdown(5);
    navigate('/welcome');
  }

  const handleLogout = () => {
    setUser(null);
    try { localStorage.removeItem('user'); } catch (e) {}
    navigate('/login');
  }

  useEffect(() => {
    if (countdown == null) return;
    if (countdown === 0) {
      setCountdown(null);
      navigate('/confessions')
      return;
    }
      const id = setTimeout(() => setCountdown(c => c - 1), 100);
    return () => clearTimeout(id);
  }, [countdown, navigate]);

  const Welcome = () => (
    
    <div className="p-6">
          <h2 className="text-xl font-semibold">Tervetuloa, {user.username}</h2>
          <p className="text-sm text-gray-600">Olet kirjautunut sisään.</p>
          <p>Sinut ohjataan Automaattisesti seuraavalle sivulle {countdown}</p>
        </div>
  );

  
//
  return (
    <>
      <nav>
        <Link to="/login">Kirjaudu</Link> | <Link to="/register">Rekisteröidy</Link>

      {user ? (
        <> 
        <button onClick={handleLogout}>Kirjaudu ulos</button>
       </>
      ) : (
        <span>Et ole kirjautunut sisään.</span>
      )}
      </nav>
        <Routes>
          <Route path="/" element={<Navigate to="/login" replace />} />
          <Route path="/welcome" element={user ? <Welcome /> : <Navigate to="/login" replace />} />
          <Route path="/confessions" element={user ? <Confessions user={user} /> : <Navigate to="/login " replace/>} />
          <Route path="/login" element={<Login onLogin={handleLogin} />} />
          <Route path="/register" element={<Register />} />
          <Route path="/foorumi" element={<Foorumi/> }/>
          
        </Routes>
      
    </>
  )
}

export default App



