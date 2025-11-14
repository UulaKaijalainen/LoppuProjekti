import express from "express";
import session from "express-session";
import mariadb from "mariadb";
import dotenv from "dotenv";
import cors from "cors";
import bcrypt from 'bcrypt'



dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());
console.log(process.env.DB_HOST,  process.env.DB_USER, process.env.DB_NAME, process.env.PORT);


app.use(session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: false,
    cookie: {
        secure: false,
        maxAge: 24 * 60 * 60 * 1000 
    }
}));

const db = mariadb.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    
    port: Number(process.env.PORT) || 3307,
    

});

app.get('/', (req, res) => {
    console.log('Received request at /', req.body);
    res.send('Server is running');

});

app.post('/register', async (req, res)=>{
    console.log('Registration request body:', req.body);
    const {username, password, confirmPassword, email, age, city} = req.body;

    if (!username || !email || !password || !confirmPassword || !age || !city) {
        return res.status(400).json({ error: 'Missing required fields' });
    }

    if(password !== confirmPassword){
        return res.status(400).json({message: 'Passwords do not match'});
    }
    if (username.length < 3 || password.length < 6 || !email.includes('@') || age < 13 || city.length < 2) {
        return res.status(400).json({message: 'Invalid data provided'});
    }

    try {
        const rows = await db.query('SELECT id FROM users WHERE username = ? OR email = ?', [username, email]);
        console.log('Existing user check rows:', rows);
        if (rows.length > 0) {
            return res.status(409).json({ error: 'Username or email already exists' });
        }
          const passwordHash = await bcrypt.hash(password, 10);
          console.log('hash toimii',passwordHash)
        const [result] = await db.query(
            'INSERT INTO users (username, password_hash, email, age, city, created_at) VALUES (?, ?, ?, ?, ?, NOW())',
            [username, passwordHash, email, age, city]
        );


        res.status(201).json({message: 'User registered successfully', id: result.insertId});
    }catch(err){
        console.error('Registration error:', err);
        res.status(500).json({error: 'Internal server error'});
        }

    

});



app.get('/login', async (req, res) => {
    const { username, password } = req.body;
});

    // Login
app.post("/login", async (req, res) => {
  const { username, password } = req.body;
  
  if (!username || !password) {
    return res.status(400).json({ error: "Username and password are required" });
  }

  try {
    // Get user from database
    const rows = await db.query("SELECT username, password_hash FROM users WHERE username = ?",[username]);

    if (!rows || rows.length === 0) {
      return res.status(401).json({ error: "Invalid username or password" });
    }

    const userRow = rows[0];

    const ok = await bcrypt.compare(password, userRow.password_hash);
    if (!ok) {
      return res.status(401).json({ error: "Invalid username or password" });
    }

    const user = { username: userRow.username };

    return res.json({ user });
    
    }
   catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ error: "Internal server error" });
  }
});


app.get('/confessions', async (req, res) => {
  
   try {
        const rows = await db.query('SELECT id, username, confession, created_at FROM confessions');
        console.log(rows);
        
        res.json(rows);
    } catch (err) {
        console.error('Fetching confessions error:', err);
        res.status(500).json({ error: 'virhe 500' });
    }
});

app.post('/confessions', async (req, res) => {
  const { username, confession } = req.body;
  console.log(username, confession);
  

  if (!username || !confession) {
    return res.status(400).json({ error: 'Confessio puuttuu' });
  }

  try{

const result = await db.query(
            'INSERT INTO confessions (username, confession, created_at) VALUES ( ?, ?, NOW())',
            [username, confession]
        );
        res.status(201).json({message: 'Confessio lähetetty onnistuneesti', id: result.insertId.toString()});
    }catch(err){
        console.error('Confession lähetys epäonnistui', err);
        res.status(500).json({error: 'Server errori ;C'});
        }
});

const PORT = process.env.PORT1 || 3000;
app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));

