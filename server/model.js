const { db } = require("./db.js");

const model = {
  getAll: (count = 5, page = 1) => {
    const queryStr = `SELECT * FROM product_info
      LIMIT ${count}
      OFFSET ${(page - 1) * count}`;
    return db.query(queryStr, queryArgs)
      .then((getAllData) => {
        return getAllData.rows;
      })
      .catch((err) => {
        console.log('MODEL getAll error: ', err);
      })
  },

  getProduct: (productId) => {
    const productQueryStr = `SELECT * FROM product_info WHERE product_id = ${productId}`;
    const featuresQueryStr = `SELECT feature, value FROM features WHERE product_id = ${productId}`;
    let result = {};
    return db.query(productQueryStr)
      .then((pData) => {
        result = pData.rows[0];
        return pData.rows[0].product_id;
      })
      .then((prodId) => {
        return db.query(featuresQueryStr)
          .then((fData) => {
            result.features = fData.rows;
            return result;
          })
          .catch((err) => {
            console.log('MODEL featuresQuery error: ', err);
          })
      })
      .catch((err => {
        console.log('MODEL getProduct error:', err);
      }))
  },

  // getStyles: (productId) => {
  //   console.log('MODEL getStyles: ', productId);
  // }

  // getRelated: (productId) => {
  //   console.log('MODEL getRelated: ', productId);
  // }
}

exports.model = model;