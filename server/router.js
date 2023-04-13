const express = require("express");
const router = express.Router();
const { controller } = require("./controller.js");

// API routes
router.get("/products", controller.getAll);
router.get("/products/:product_id", controller.getProduct);
router.get("/products/:product_id/styles", controller.getStyles);
router.get("/products/:product_id/related", controller.getRelated);
// router.post("/cart", cart.add);

exports.router = router;
