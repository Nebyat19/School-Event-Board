const { Client } = require('pg');

const client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

client.connect();

if (process.env.NODE_ENV === 'development') {
  client.query('SELECT NOW()', (err, res) => {
    if (err) {
      console.error('Error connecting to database:', err);
    } else {
      console.log('Connected to database:', res.rows[0].now);
    }
  });
}
module.exports = client;
