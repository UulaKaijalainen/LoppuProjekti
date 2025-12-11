import bcrypt from 'bcrypt';
 
const pw = process.argv[2] || 'password7';
(async () => {
  try {
    const hash = await bcrypt.hash(pw, 10);
    console.log(hash);
  } catch (err) {
    console.error('ERR', err);
    process.exit(1);
  }
})();