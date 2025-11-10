import { useState } from 'react';

function Confession() {
    const [confession, setConfession] = useState('');

    const handleSubmit = (e) => {
        e.preventDefault();
        if (confession.trim()) {
            alert('Confession lähetetty: ' + confession);
            setConfession(''); // Clear the input after submission
        }
    };

    return (
        <div className="max-w-md mx-auto p-6">
            <form onSubmit={handleSubmit} className="space-y-4">
                <div>
                    <label 
                        htmlFor="confession" 
                        className="block text-sm font-medium text-gray-700 mb-2"
                    >
                        Kirjoita confession
                    </label>
                    <textarea
                        id="confession"
                        value={confession}
                        onChange={(e) => setConfession(e.target.value)}
                        className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-200 focus:border-indigo-400"
                        rows="4"
                        placeholder="Kirjoita confessionisi tähän..."
                        required
                    />
                </div>
                <button
                    type="submit"
                    className="w-full bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700 transition-colors"
                    disabled={!confession.trim()}
                >
                    Lähetä confession
                </button>
            </form>
        </div>
    );
}

export default Confession;
