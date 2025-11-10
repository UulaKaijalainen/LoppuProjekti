import React, { useState } from 'react';

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
        <>
            <h1>Register</h1>
            {err && <div className="error">{err}</div>}
            <form onSubmit={handleSubmit}>
                <input 
                    type="text" 
                    value={username} 
                    onChange={(e) => setUsername(e.target.value)} 
                    placeholder="Username" 
                    required 
                />
                <input 
                    type="password" 
                    value={password} 
                    onChange={(e) => setPassword(e.target.value)} 
                    placeholder="Password" 
                    required 
                />
                <input 
                    type="password" 
                    value={confirmPassword} 
                    onChange={(e) => setConfirmPassword(e.target.value)} 
                    placeholder="Confirm Password" 
                    required 
                />

                <input 
                    type="email" 
                    value={email} 
                    onChange={(e) => setEmail(e.target.value)} 
                    placeholder="Email" 
                    required 
                />
                <input 
                    type="number" 
                    value={age} 
                    onChange={(e) => setAge(e.target.value)} 
                    placeholder="Age" 
                    required 
                />
                <input 
                    type="text" 
                    value={city} 
                    onChange={(e) => setCity(e.target.value)} 
                    placeholder="City" 
                    required 
                />
                <button type="submit" disabled={load}>
                    {load ? 'Registering...' : 'Register'}
                </button>
            </form>
        </>
    );
}

export default Register;