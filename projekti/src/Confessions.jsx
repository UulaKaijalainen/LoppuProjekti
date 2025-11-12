import React, { useEffect, useState } from 'react';

function Confessions(){
    const [confession, setConfession] = useState('');
    const [confessions, setConfessions] = useState([]);
      const [load, setLoad] = useState(true);
        const [err, setErr] = useState('');

        useEffect(() => {
            fetchConfessions();
        }, []);

        const fetchConfessions = async () => {
            try {
                const response = await fetch('http://localhost:3001/confessions');
                if (!response.ok) {
                    throw new Error('Failed to fetch confessions');
                }
                const data = await response.json();
                setConfessions(data.confessions || []);
            } catch (error) {
                setErr(error.message);
            }
        }
        
    const handleSubmit = async (e) => {
        e.preventDefault();
        setErr('');

    try{
     const response = await fetch('http://localhost:3001/confessions', {
        method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }, 
                mode: 'cors',
                body: JSON.stringify({
                    confession
                    })
            });
    if (!response.ok) {
                const body = await response.json().catch(()=>({}));
                throw new Error(body.error || 'Post failed');
            }
            setConfession('');
            fetchConfessions();
        } catch (error) {
            setErr(error.message);
        } finally {
            setLoad(false);
        }
    };

    return(
        <>
        <div>
        <h2>Confession page</h2>
        
        <form onSubmit ={handleSubmit}>
            <input
             type="text"
             value ={confession} 
             onChange={(e) => setConfession(e.target.value)}
             placeholder='Tell your darkest Sin'
             required
             />
            <button type="submit" disabled={load}>
                    {load ? 'Sending to police...' : 'Send'}
                </button>
        </form>
        </div>
        </>
    )

}

export default Confessions;
