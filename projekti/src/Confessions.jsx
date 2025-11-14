import React, { useEffect, useState } from 'react';
import { useNavigate } from "react-router-dom";
import './styles/Tyyli.css'
function Confessions({ user }){
    //const [confession, setConfession] = useState('');
    const [confession, setConfession] = useState([]);
      const [load, setLoad] = useState(true);
        const [err, setErr] = useState('');
        const navigate2 = useNavigate();

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
                //mode: 'cors',
                body: JSON.stringify({
                    username: user.username,
                    confession
                    
                    })
            });
           const data = await response.json();
           console.log(response);
           
            
    if (!response.ok) {
                throw new Error(body.error || 'Lähetys epäonnistui');
            }
    if(response.ok){
        navigate2('/foorumi');
    }
           /* setConfessions('');
            fetchConfessions();*/
        } catch (error) {
            setErr(error.message);
    }
    };
    return(
        <>
        <div className='confessionContainer'>
        <h2>Confession page</h2>
           
        <form onSubmit={handleSubmit}>
            <textarea
             type="field"
             value ={confession} 
             onChange={(e) => setConfession(e.target.value)}
             placeholder='kerro salaisuutesi...'
             className='confessionInput'
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
