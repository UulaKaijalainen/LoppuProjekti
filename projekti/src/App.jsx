import { Routes, Route, Link, Navigate, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";

import './styles/Tyyli.css';
import './styles/Welcome.css';

import Register from './Register.jsx';
import Login from './Login.jsx';
import Confessions from './Confessions.jsx';
import Foorumi from './Foorumi.jsx';
import Welcome from './Welcome.jsx';

function App() {
  const [user, setUser] = useState(() => {
    try {
      return JSON.parse(localStorage.getItem('user')) || null;
    } catch {
      return null;
    }
  });

  const navigate = useNavigate();

  // Login handler
  const handleLogin = (userObj) => {
    setUser(userObj);
    localStorage.setItem('user', JSON.stringify(userObj));
    navigate("/welcome");
  };

  // Logout handler
  const handleLogout = () => {
    setUser(null);
    localStorage.removeItem('user');
    navigate("/login");
  };

  return (
    <>
      <nav>
        <Link to="/login">Kirjaudu</Link> | <Link to="/register">Rekisteröidy</Link>

        {user ? (
          <button onClick={handleLogout}>Kirjaudu ulos</button>
        ) : (
          <span>Et ole kirjautunut sisään.</span>
        )}
      </nav>

      <Routes>
        <Route path="/" element={<Navigate to="/login" replace />} />

        <Route
          path="/welcome"
          element={user ? <Welcome user={user} /> : <Navigate to="/login" replace />}
        />

        <Route
          path="/confessions"
          element={user ? <Confessions user={user} /> : <Navigate to="/login" replace />}
        />

        <Route path="/login" element={<Login onLogin={handleLogin} />} />
        <Route path="/register" element={<Register />} />

        <Route
          path="/foorumi"
          element={user ? <Foorumi user={user} /> : <Navigate to="/login" replace />}
        />
      </Routes>
    </>
  );
}

export default App;
