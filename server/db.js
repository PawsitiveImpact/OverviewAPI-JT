require("dotenv").config();
const { Client } = require('pg');

const db = new Client({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
});

db.connect()
  .then(() => console.log('connected'))
  .catch((err) => console.error('connection error', err.stack))

exports.db = db;
