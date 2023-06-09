const { model } = require("./model.js");

const controller = {
  getAll: (req, res) => {
    model.getAll(req.query.count, req.query.page)
      .then((getAllData) => {
        res.status(200);
        res.send(getAllData);
      })
      .catch((err) => {
        console.log('CONTROLLER getAll error: ', err);
      })
  },

  getProduct: (req, res) => {
    model.getProduct(req.params.product_id)
      .then((data) => {
        res.status(200);
        res.send(data);
      })
      .catch((err) => {
        console.log('CONTROLLER getProduct error: ', err);
      })
  },

  getStyles: (req, res) => {
    model.getStyles(req.params.product_id)
      .then((data) => {
        res.status(200);
        res.send(data);
      })
      .catch((err) => {
        console.log('CONTROLLER getStyles error: ', err);
      })
  },

  getRelated: (req, res) => {
    model.getRelated(req.params.product_id)
      .then((data) => {
        res.status(200);
        res.send(data);
      })
      .catch((err) => {
        console.log('CONTROLLER getRelated error: ', err);
      })
  }
}

exports.controller = controller;