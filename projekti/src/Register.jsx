import React, { useState } from 'react';
import './styles/Tyyli.css'

function Register() {
    const [username, setUsername] = useState('');  
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [email, setEmail] = useState('');
    const [age, setAge] = useState('');
    const [city, setCity] = useState('');
    const [err, setErr] = useState('');
    const [load, setLoad] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setErr('');

        if (password !== confirmPassword) {
            setErr('Passwords do not match');
            return;
        }

        

        setLoad(true);

        try {
            const response = await fetch('http://localhost:3001/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }, 
                mode: 'cors',
                body: JSON.stringify({
                    username,    
                    email,    
                    password, 
                    confirmPassword,
                    age,
                    city
                    
                })
            });

             if (!response.ok) {
                
                const errBody = await response.json().catch(() => ({}));
                throw new Error(errBody.error || errBody.message || 'Registration failed');
            }

            alert('Registration successful!');
            
        } catch (error) {
            setErr(error.message);
        } finally {
            setLoad(false);
            
        }
    };

    return (
        <div className="registerPage">
            <h1>Register</h1>
            {err && <div className="error">{err}</div>}
            <div className='registerContainer'>
            <form onSubmit={handleSubmit}>
                <div className="rekisteriKortti">
                <label >Nimi:</label>
                <input 
                    type="text" 
                    value={username} 
                    onChange={(e) => setUsername(e.target.value)} 
                    placeholder="Username" 
                    required 
                />
                </div>
                <div className="rekisteriKortti">
                <label >Salasana:</label>
                <input 
                    type="password" 
                    value={password} 
                    onChange={(e) => setPassword(e.target.value)} 
                    placeholder="Password" 
                    required 
                />
                </div>
                <div className="rekisteriKortti">
                <label >Vahvista Salasana:</label>
                <input 
                    type="password" 
                    value={confirmPassword} 
                    onChange={(e) => setConfirmPassword(e.target.value)} 
                    placeholder="Confirm Password" 
                    required 
                />
                </div>
                <div className="rekisteriKortti">
                <label > Sähköposti:</label>
                <input 
                    type="email" 
                    value={email} 
                    onChange={(e) => setEmail(e.target.value)} 
                    placeholder="Email" 
                    required 
                />
                </div>
                <div className="rekisteriKortti">
                <label >Ikä:</label>
                <input 
                    type="number" 
                    value={age} 
                    onChange={(e) => setAge(e.target.value)} 
                    placeholder="Age" 
                    required 
                />
                </div>
                <div className="rekisteriKortti">
                <label >Kaupunki:</label>
                <input 
                    type="text" 
                    value={city} 
                    onChange={(e) => setCity(e.target.value)} 
                    placeholder="City" 
                    required 
                />
                </div>
                <button type="submit" disabled={load}>
                    {load ? 'Registering...' : 'Register'}
                </button>
            </form>
            </div>
        </div>
    );
}

export default Register;