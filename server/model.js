const { db } = require("./db.js");

const model = {
  getAll: (count = 5, page = 1) => {
    const queryStr = `SELECT * FROM product_info
      LIMIT ${count}
      OFFSET ${(page - 1) * count}`;
    return db.query(queryStr)
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

  getStyles: (productId) => {
    console.log('MODEL getStyles: ', productId);

    const queryStr = `SELECT
      json_build_object(
        'product_id', ${productId},
        'results', (SELECT json_agg(
          json_build_object(
            'style_id', styles.style_id,
            'name', styles.name,
            'original_price', styles.original_price,
            'sale_price', styles.sale_price,
            'default?', styles.default_style,
            'photos', (SELECT json_agg(
              json_build_object(
                'thumbnail_url', photos.thumbnail_url,
                'url', photos.url
              )
            ) AS photos FROM photos WHERE photos.style_id = styles.style_id),
            'skus', (SELECT json_object_agg(
              sku_id, json_build_object(
                'quantity', skus.quantity,
                'size', skus.size
              )
            ) AS skus FROM skus WHERE skus.style_id = styles.style_id)
          )
        ) FROM styles WHERE styles.product_id = ${productId})
      ) AS styles FROM styles WHERE styles.product_id = ${productId} GROUP BY styles.product_id`;

    return db.query(queryStr)
      .then((getStylesData) => {
        return getStylesData.rows;
      })
      .catch((err) => {
        console.log('MODEL getStyles error: ', err);
      })
  },

  getRelated: (productId) => {
    console.log('MODEL getRelated: ', productId);
    const queryStr = `SELECT json_agg(related.product_id_related) AS related FROM related WHERE related.product_id_current = ${productId}`;
    return db.query(queryStr)
      .then((getRelatedData) => {
        return getRelatedData.rows[0].related;
      })
      .catch((err) => {
        console.log('MODEL getRelated error: ', err);
      })
  }
}

exports.model = model;