import { Routes, Route, Link, Navigate } from "react-router-dom";

import './App.css'
import Register from './Register.jsx'
import Login from './Login.jsx'
function App() {
  

  return (
    <>
      <nav>
        <Link to="/login">Login</Link> | <Link to="/register">Register</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Navigate to="/login" replace />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
      </Routes>
    </>
  )
}

export default App



