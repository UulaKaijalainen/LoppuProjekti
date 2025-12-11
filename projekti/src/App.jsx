import { Routes, Route, Navigate, Link, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";

import Login from "./Login.jsx";
import Register from "./Register.jsx";
import Confessions from "./Confessions.jsx";
import Foorumi from "./Foorumi.jsx";
import Welcome from "./Welcome.jsx";
import ProtectedRoute from "./ProtectedRoute.jsx";

function App() {
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  // 🔥 Load user from session cookie on page load
  useEffect(() => {
    fetch("http://localhost:3001/me", {
      credentials: "include"   // IMPORTANT
    })
      .then(r => r.json())
      .then(data => {
        if (data.user) setUser(data.user);
      });
  }, []);

  // Called by Login.jsx
  const handleLogin = (userObj) => {
    setUser(userObj);
    navigate("/welcome");
  };

  const handleLogout = () => {

    setUser(null);
    navigate("/login");
  };

  return (
    <>
      <nav>
        <Link to="/login">Login</Link> | <Link to="/register">Register</Link>

        {user ? (
          <button onClick={handleLogout}>Logout</button>
        ) : (
          <span>You are not logged in</span>
        )}
      </nav>

      <Routes>
        <Route path="/" element={<Navigate to="/login" />} />

        <Route path="/login" element={<Login onLogin={handleLogin} />} />
        <Route path="/register" element={<Register />} />

        <Route
          path="/welcome"
          element={
            user ? <Welcome user={user} /> : <Navigate to="/login" replace />
          }
        />

        <Route
          path="/confessions"
          element={
            user ? <Confessions user={user} /> : <Navigate to="/login" replace />
          }
        />

        <Route
          path="/foorumi"
          element={
            <ProtectedRoute isAllowed={!!user} redirectPath="/login">
              <Foorumi user={user} isAdmin={user?.isAdmin} />
            </ProtectedRoute>
          }
        />
      </Routes>
    </>
  );
}

export default App;
