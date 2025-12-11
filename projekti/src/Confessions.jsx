import React, { useState } from 'react';
import { useNavigate } from "react-router-dom";
import './styles/Tyyli.css';

function Confessions({ user }) {
  const [confession, setConfession] = useState('');
  const [loading, setLoading] = useState(false);
  const [err, setErr] = useState('');
  const navigate = useNavigate();
    const isAdmin = user?.isAdmin;

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErr('');
    setLoading(true);

    try {
      const response = await fetch("http://localhost:3001/confessions", {
        method: "POST",
        credentials: "include", // send cookies/session
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          username: user.username,
          confession: confession,
        }),
      });

      const data = await response.json();

      if (!response.ok) {
        throw new Error(data.error || "Lähetys epäonnistui");
      }

      // clear textarea and redirect
      setConfession('');
      navigate('/foorumi');

    } catch (error) {
      setErr(error.message);
    } finally {
      setLoading(false);
    }
  };
  

  return (
    <>
    {isAdmin && (
        <button
          className="adminForumBtn"
          onClick={() => navigate("/foorumi")}
        >
          Go to Forum
        </button>
      )}
      <div className='confessionContainer'>
        <h2>Confession page</h2>

        {err && <p style={{ color: 'red' }}>{err}</p>}

        <form onSubmit={handleSubmit}>
          <textarea
            value={confession}
            onChange={(e) => setConfession(e.target.value)}
            placeholder='Tell me your dark secret😈...'
            className='confessionInput'
            required
          />
          <button type="submit" disabled={loading}>
            {loading ? "Sending..." : "Send"}
          </button>
        </form>
      </div>
    </>
  );
}

export default Confessions;
