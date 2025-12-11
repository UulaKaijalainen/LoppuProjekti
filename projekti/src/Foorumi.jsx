import React, { useState, useEffect } from "react";
import "./styles/Tyyli2.css";
import Vote from "./Vote";
import dayjs from "dayjs";
import relativeTime from "dayjs/plugin/relativeTime";

dayjs.extend(relativeTime);

export default function Foorumi({ user, isAdmin }) {
  const [confessions, setConfessions] = useState([]);

  // ✅ Fetch all confessions
  useEffect(() => {
  async function fetchData() {
    try {
      const response = await fetch("http://localhost:3001/confessions", {
        credentials: "include", // send cookies for session
      });
      const data = await response.json();
      setConfessions(data.confessions || []);
    } catch (err) {
      console.error("Error fetching data:", err);
    }
  }

  fetchData();
}, []);

  // ✅ Delete confession (admin only)
  const handleDelete = async (id) => {
    if (!window.confirm("Haluatko varmasti poistaa tämän kommentin?")) return;

    try {
      const response = await fetch(`http://localhost:3001/confessions/${id}`, {
  method: "DELETE",
  credentials: "include",  // must send the cookie
  headers: { "Content-Type": "application/json" },
});
              
      if (!response.ok) {
        const error = await response.json();
        alert(`Error: ${error.error || "Delete has failed"}`);
        return;
      }

      // Remove from local state
      setConfessions(prev => prev.filter(item => item.id !== id));
    } catch (err) {
      alert("Error in deleting: " + err.message);
    }
  };

  return (
    <div className="foorumPage">
      <h2>Forum</h2>

      <div className="foorumContainer">
        {confessions.map((item) => (
          <div key={item.id} className="foorumKortti">
            <p>
              <strong>Anonymous</strong> said:
            </p>

            <div className="conf-container-foorumi1">
              <div className="conf-container-foorumi2">
                <p>{item.confession}</p>

                {isAdmin && (
                  <button
                    className="deleteBtn"
                    onClick={() => handleDelete(item.id)}
                  >
                    Poista
                  </button>
                )}
              </div>

              <Vote confessionId={item.id} userId={user?.id} />
            </div>

            <div className="conf-container-foorumi3">
              <small>{dayjs(item.created_at).fromNow()}</small>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
