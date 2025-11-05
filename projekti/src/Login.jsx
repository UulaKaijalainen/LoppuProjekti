import React, { useState } from 'react';

export default function Login({ onLogin }) {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    // Try to call backend /login; if backend not present, fall back to a simple mock
    const tryLogin = async (username, password) => {
        // Attempt backend authentication
        try {
            const resp = await fetch('http://localhost:3000/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password }),
            });

            if (resp.ok) {
                const data = await resp.json();
                // Expect backend to return { user: { username, ... } } or similar
                return { success: true, user: data.user || data };
            }
            // If 4xx/5xx, treat as failure and fall through to mock
        } catch (err) {
            // Network error or backend offline — we'll fallback
        }

        // Mock fallback: allow admin/password
        if (username === 'admin' && password === 'password') {
            return { success: true, user: { username: 'admin' } };
        }

        return { success: false };
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        if (!username.trim() || !password) {
            setError('Täytä käyttäjänimi ja salasana.');
            return;
        }

        setLoading(true);
        try {
            const result = await tryLogin(username.trim(), password);
            if (result.success) {
                onLogin?.(result.user);
            } else {
                setError('Virheellinen käyttäjänimi tai salasana.');
            }
        } catch (err) {
            setError('Tapahtui virhe, yritä uudelleen.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="min-h-screen flex items-center justify-center bg-gray-50 p-4">
            <form
                onSubmit={handleSubmit}
                className="w-full max-w-md bg-white rounded-2xl shadow-md p-8"
                aria-labelledby="login-heading"
            >
                <h1 id="login-heading" className="text-2xl font-semibold mb-6 text-center">
                    Kirjaudu sisään
                </h1>

                {error && (
                    <div role="alert" className="mb-4 text-sm text-red-700 bg-red-50 rounded p-2">
                        {error}
                    </div>
                )}

                <label className="block mb-4">
                    <span className="text-sm font-medium">Käyttäjänimi</span>
                    <input
                        type="text"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                        className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2"
                        autoComplete="username"
                        required
                    />
                </label>

                <label className="block mb-6">
                    <span className="text-sm font-medium">Salasana</span>
                    <input
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2"
                        autoComplete="current-password"
                        required
                    />
                </label>

                <button
                    type="submit"
                    className="w-full py-2 rounded-xl bg-indigo-600 text-white font-medium disabled:opacity-50"
                    disabled={loading}
                >
                    {loading ? 'Kirjaudutaan...' : 'Kirjaudu'}
                </button>

                <p className="text-xs text-gray-500 mt-4 text-center">Käytä: admin / password: password</p>
            </form>
        </div>
    );
}