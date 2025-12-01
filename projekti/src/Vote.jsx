import { useState, useEffect } from "react";
import "bootstrap-icons/font/bootstrap-icons.css";

function Vote({ confessionId, userId }) {
    const [userVote, setUserVote] = useState(null);  // "up" | "down" | null
    const [score, setScore] = useState(0);

    useEffect(() => {
        loadVoteAndScore();
    }, [confessionId, userId]);

   async function loadVoteAndScore() {
    try {
        // Load confession score
        const res = await fetch(`http://localhost:3001/confessions/${confessionId}`);
        const data = await res.json();
        setScore(data.score);

        // Load user vote
        const v = await fetch(`http://localhost:3001/votes/${confessionId}/${userId}`);
        const vote = await v.json();

        if (vote.vote_type === 1) setUserVote("up");
        else if (vote.vote_type === -1) setUserVote("down");
        else setUserVote(null);

    } catch (err) {
        console.error("Vote fetch error:", err);
    }
}

    async function handleVote(type) {
    if (!userId) return alert("Login required");

    const endpoint =
        type === "up"
            ? `http://localhost:3001/confessions/${confessionId}/upvote`
            : `http://localhost:3001/confessions/${confessionId}/downvote`;

    await fetch(endpoint, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId })
    });

    setUserVote(type);       // 👈 update UI immediately
    loadVoteAndScore();      // 👈 refresh score
}
    return (
        <div className="voteContainer">
            <button className="upVoteButton"
                onClick={() => handleVote("up")}
                disabled={userVote === "up"}
            >
                <i className={userVote === "up" ? "bi bi-caret-up-fill" : "bi bi-caret-up"}></i>
            </button>

            <span>{score}</span>

            <button className="downVoteButton"
                onClick={() => handleVote("down")}
                disabled={userVote === "down"}
            >
<i className={userVote === "down" ? "bi bi-caret-down-fill" : "bi bi-caret-down"}></i>
            </button>
        </div>
    );
}

export default Vote;
