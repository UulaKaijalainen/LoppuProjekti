import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import Hamster from "./Hamster";
import './styles/Welcome.css';

export default function Welcome({ user }) {
  const [countdown, setCountdown] = useState(5);
  const navigate = useNavigate();

  useEffect(() => {
    if (countdown <= 0) {
      navigate("/confessions");
      return;
    }

    const id = setTimeout(() => setCountdown(c => c - 1), 1000);
    return () => clearTimeout(id);
  }, [countdown, navigate]);

  return (
    <div className="welcomeContainer">
      <h2>Tervetuloa, {user.username}</h2>
      <p>Sinut ohjataan automaattisesti seuraavalle sivulle {countdown}</p>

      <Hamster />
    </div>
  );
}
