import React, { useState } from 'react';

function Confessions(){
    const [Confession, setConfession] = useState('');
    const handleSubmit = async (e) => {
    try{
     const response = await fetch('http://localhost:3001/confessions', {
        method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }, 
                mode: 'cors',
                body: JSON.stringify({
                    Confession
                    })
            });
    if (!response.ok) {
                const body = await response.json().catch(()=>({}));
                throw new Error(body.error || 'Post failed');
            }
            setConfession('');
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
        {err && <div className="error">{err}</div>}
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
