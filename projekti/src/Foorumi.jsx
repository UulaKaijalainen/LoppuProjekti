import React, { useState, useEffect } from 'react';

import './index.css'
function Foorumi() {
        const [confessions, setConfessions] = useState([]);
        const [load, setLoad] = useState(true);
        const [err, setErr] = useState('');
    

      useEffect(() => {
    async function fetchData() {
      try {
         const response = await fetch('http://localhost:3001/confessions')
        
        if (!response.ok) throw new Error(`HTTP-virhe: ${response.status}`);
        const data = await response.json();
        setConfessions(data); // Päivitetään tila saadulla datalla
      } catch (error) {
        console.error("Virhe haettaessa dataa:", error);
      }
    }
 
    fetchData();
  }, []);
    
 console.log(confessions);
 
              /*
            method: 'GET',
                headers: {
                    'Content-Type': 'application/json'},
                    mode: 'cors',
                    body: JSON.stringify({
                        username: 'anonyymi',
                        confession
                    
                        })
            });*/

    return(
        
        <div>
            <h2>Foorumi</h2>
            <div>
            {confessions.map((item) => (
                <div key={item.id} >
                    <p><strong>{item.username}</strong> sanoi:</p> 
                    <p>{item.confession}</p>
                </div>
            ))}
            </div>
        </div>
    )

}
 export default Foorumi;