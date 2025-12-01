import React, { useState, useEffect } from 'react';
import './styles/Tyyli2.css'
import Vote from './Vote';
import dayjs from 'dayjs';
import relativeTime from 'dayjs/plugin/relativeTime';

dayjs.extend(relativeTime);

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
                        
                        <div className='conf-container-foorumi1'>
                        <div className="conf-container-foorumi2"><p>{item.confession}</p></div>

                        {/* IMPORTANT: fixed */}
                        <Vote confessionId={item.id} userId={user?.id} /></div>
                        <div className='conf-container-foorumi3'>
                        <small>{dayjs(item.created_at).fromNow()}</small>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}
