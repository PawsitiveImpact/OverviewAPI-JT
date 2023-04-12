require("dotenv").config();
const express = require("express");
const { router } = require("./router.js");

const app = express();

app.use(router);
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}.`);
});

// NOTE: Finish implementing first route (getAll), returning data to client in the shape as shown in FEC gLearn
// Read article from Uncle Jay on query optimization