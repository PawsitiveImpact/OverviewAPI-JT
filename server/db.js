require("dotenv").config();
const { Client } = require('pg');

const db = new Client({
  // host: process.env.PGHOST,
  // port: process.env.PORT,
  database: process.env.PGDATABASE,
  // user: process.env.PGUSER,
  // password: process.env.PGPASSWORD,
})

db.connect()
  .then(() => console.log('connected'))
  .catch((err) => console.error('connection error', err.stack))

// db.query('SELECT * FROM product_info', (err, res) => {
//   console.log(err, res)
//   db.end()
// })

// const query = (text, params, callback) => {
//   return db.query(text, params, callback)
// }

// PgPromise db connection

// Run async connection

// Pg will have CRUD methods to use


exports.db = db;

