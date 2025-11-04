// server.js
import express from "express";
import mariadb from "mariadb";
import dotenv from "dotenv";
import cors from "cors";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());
console.log(process.env.DB_HOST,  process.env.DB_USER, process.env.DB_NAME, process.env.PORT);

// 🔹 Create MariaDB connection pool
const pool = mariadb.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  port: process.env.PORT,
  connectionLimit: 5,
});

// 🔹 Test database connection
pool.getConnection()
  .then(conn => {
    console.log("Connected to MariaDB as ID:", conn.threadId);
    conn.release();
  })
  .catch(err => {
    console.error("MariaDB connection error:", err);
  });

// 🔹 ROUTES

// Root
app.get("/", (req, res) => {
  res.send("ConfessionBoard API is running");
});

// Get all confessions
app.get("/confessions", async (req, res) => {
  try {
    const rows = await pool.query(
      "SELECT c.*, u.username FROM confessions c LEFT JOIN users u ON c.user_id = u.id ORDER BY c.created_at DESC"
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).send("Error fetching confessions");
  }
});

// Post a new confession
app.post("/confessions", async (req, res) => {
  const { user_id, content } = req.body;
  if (!content)
    return res.status(400).send("Missing category or content");

  try {
    const result = await pool.query(
      "INSERT INTO confessions (user_id, category, content) VALUES (?, ?, ?)",
      [user_id || null, category, content]
    );
    res.status(201).json({ id: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error creating confession");
  }
});

// Upvote / downvote
app.post("/confessions/:id/vote", async (req, res) => {
  const { id } = req.params;
  const { user_id, vote_type } = req.body; // vote_type = 1 or -1
  if (![1, -1].includes(vote_type))
    return res.status(400).send("Invalid vote type");

  try {
    await pool.query(
      "INSERT INTO votes (confession_id, user_id, vote_type) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE vote_type = ?",
      [id, user_id || null, vote_type, vote_type]
    );
    // Update counters
    if (vote_type === 1)
      await pool.query("UPDATE confessions SET upvotes = upvotes + 1 WHERE id = ?", [id]);
    else
      await pool.query("UPDATE confessions SET downvotes = downvotes + 1 WHERE id = ?", [id]);
    res.json({ message: "Vote recorded" });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error voting");
  }
});

// Report a confession
app.post("/confessions/:id/report", async (req, res) => {
  const { id } = req.params;
  const { reporter_id, reason } = req.body;

  try {
    await pool.query(
      "INSERT INTO reports (confession_id, reporter_id, reason) VALUES (?, ?, ?)",
      [id, reporter_id || null, reason || null]
    );
    res.json({ message: "Report submitted" });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error reporting confession");
  }
});

// 🔹 Start server
const PORT = process.env.PORT1 || 3000;
app.listen(PORT, () => console.log(`🚀 Server running at http://localhost:${PORT}`));
