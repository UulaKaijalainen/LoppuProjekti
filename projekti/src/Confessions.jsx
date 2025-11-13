import React, { useEffect, useState } from 'react';
import './index.css'
function Confessions({ user }){
    //const [confession, setConfession] = useState('');
    const [confession, setConfession] = useState([]);
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
                setConfessions(data || []);
            } catch (error) {
                setErr(error.message);
            }
        };
        
    const handleSubmit = async (e) => {
        e.preventDefault();
        setErr('');
        setLoad(true);

    try{
     const response = await fetch('http://localhost:3001/confessions', {
        method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }, 
                mode: 'cors',
                body: JSON.stringify({
                    username: user.username,
                    confession
                    
                    })
            });
    if (!response.ok) {
                const body = await response.json().catch(()=>({}));
                throw new Error(body.error || 'Lähetys epäonnistui');
            }
            setConfessions('');
            fetchConfessions();
        } catch (error) {
            setErr(error.message);
        } finally {
            setLoad(false);
            fetchConfessions();
        }
    };

    return(
        <>
        <div>
        <h2>Confession page</h2>
           
        <form onSubmit={handleSubmit}>
            <input
             type="text"
             value ={confession} 
             onChange={(e) => setConfession(e.target.value)}
             placeholder='kerro salaisuutesi...'
             required
             />
            <button type="submit">
                    Lähetä
                    
                </button>
        </form>
        </div>
        </>
    )

}

export default Confessions;
