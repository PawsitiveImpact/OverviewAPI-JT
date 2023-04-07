CREATE TABLE IF NOT EXISTS product_info (
  product_id INTEGER DEFAULT NULL,
  name VARCHAR(30) NULL DEFAULT NULL,
  slogan VARCHAR(60) NULL DEFAULT NULL,
  description VARCHAR(300) NULL DEFAULT NULL,
  category_id INTEGER NULL DEFAULT NULL,
  default_price VARCHAR(7) NULL DEFAULT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS styles (
  style_id INTEGER DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  name VARCHAR(30) NULL DEFAULT NULL,
  original_price VARCHAR(7) NULL DEFAULT NULL,
  sale_price VARCHAR(7) NULL DEFAULT NULL,
  default_style BOOLEAN NULL DEFAULT NULL,
  PRIMARY KEY (style_id)
);

CREATE TABLE IF NOT EXISTS related (
  related_id INTEGER DEFAULT NULL,
  product_id_current INTEGER NULL DEFAULT NULL,
  product_id_related INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (related_id)
);

CREATE TABLE IF NOT EXISTS features (
  feature_id INTEGER DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  feature VARCHAR(20) NULL DEFAULT NULL,
  value VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (feature_id)
);

CREATE TABLE IF NOT EXISTS photos (
  photo_id INTEGER DEFAULT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  thumbnail_url TEXT NULL DEFAULT NULL,
  url TEXT NULL DEFAULT NULL,
  PRIMARY KEY (photo_id)
);

CREATE TABLE IF NOT EXISTS skus (
  sku_id INTEGER DEFAULT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  size VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (sku_id)
);

CREATE TABLE IF NOT EXISTS cart (
  session_id INTEGER DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (session_id)
);

CREATE TABLE IF NOT EXISTS categories (
  category_id INTEGER DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (category_id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES product_info (product_id);
ALTER TABLE styles ADD FOREIGN KEY (product_id) REFERENCES product_info (product_id);
ALTER TABLE product_info ADD FOREIGN KEY (category_id) REFERENCES categories (category_id);
ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES styles (style_id);
ALTER TABLE related ADD FOREIGN KEY (product_id_current) REFERENCES product_info (product_id);
ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES styles (style_id);
ALTER TABLE cart ADD FOREIGN KEY (product_id) REFERENCES product_info (product_id);