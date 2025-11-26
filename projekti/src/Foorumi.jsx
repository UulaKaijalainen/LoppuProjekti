import React, { useState, useEffect } from 'react';
import './styles/Tyyli.css'
import Vote from './Vote';
export default function Foorumi({ user }) {
    const [confessions, setConfessions] = useState([]);

    useEffect(() => {
        async function fetchData() {
            try {
                const response = await fetch('http://localhost:3001/confessions');
                const data = await response.json();
                setConfessions(data.confessions || []);
            } catch (err) {
                console.error("Virhe haettaessa dataa:", err);
            }
        }
        fetchData();
    }, []);

    return (
        <div className="foorumPage">
            <h2>Foorumi</h2>
            <div className="foorumContainer">
                {confessions.map(item => (
                    <div key={item.id} className="foorumKortti">
                        <p><strong>Anonymous</strong> sanoi:</p>
                        <p>{item.confession}</p>

                        {/* IMPORTANT: fixed */}
                        <Vote confessionId={item.id} userId={user?.id} />

                        <small>{new Date(item.created_at).toLocaleString()}</small>
                    </div>
                ))}
            </div>
        </div>
    );
}
