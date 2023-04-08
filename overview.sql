-- ---
-- Create tables
-- ---

CREATE TABLE IF NOT EXISTS product_info (
  product_id INTEGER DEFAULT NOT NULL,
  name VARCHAR(30) NULL DEFAULT NULL,
  slogan TEXT NULL DEFAULT NULL,
  description TEXT NULL DEFAULT NULL,
  category TEXT NULL DEFAULT NULL,
  default_price INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS styles (
  style_id INTEGER DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  name VARCHAR(30) NULL DEFAULT NULL,
  original_price INTEGER NULL DEFAULT NULL,
  sale_price INTEGER NULL DEFAULT NULL,
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
  feature TEXT NULL DEFAULT NULL,
  value TEXT NULL DEFAULT NULL,
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
  id INTEGER DEFAULT NULL,
  session_id INTEGER NULL DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


-- ---
-- Foreign Keys
-- ---

ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES product_info (product_id);
ALTER TABLE styles ADD FOREIGN KEY (product_id) REFERENCES product_info (product_id);
ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES styles (style_id);
ALTER TABLE related ADD FOREIGN KEY (product_id_current) REFERENCES product_info (product_id);
ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES styles (style_id);
ALTER TABLE cart ADD FOREIGN KEY (product_id) REFERENCES product_info (product_id);


-- ---
-- Run this code in terminal to create tables using the above code:
-- psql -h hostname -d databasename -U username -f file.sql
-- ---

psql -h localhost -d product_overview -U bread -f ~/Documents/HackReactor/SEI/Git/SDC/OverviewAPI-JT/overview.sql


-- ---
-- Run this code in psql to import CSV data into tables:
-- \COPY <table_name> FROM '<path_to_csv>' WITH (FORMAT csv, HEADER true);
-- ---

\COPY product_info (product_id, name, slogan, description, category, default_price)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/product.csv'
WITH (FORMAT csv, HEADER true);

\COPY styles (style_id, product_id, name, original_price, sale_price, default_style)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/styles.csv'
WITH (FORMAT csv, HEADER true);

\COPY related (related_id, product_id_current, product_id_related)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/related.csv'
WITH (FORMAT csv, HEADER true);

\COPY features (feature_id, product_id, feature, value)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/features.csv'
WITH (FORMAT csv, HEADER true);

\COPY photos (photo_id, style_id, thumbnail_url, url)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/photos.csv'
WITH (FORMAT csv, HEADER true);

\COPY skus (sku_id, style_id, quantity, size)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/skus.csv'
WITH (FORMAT csv, HEADER true);

\COPY cart (id, session_id, product_id, quantity)
FROM '/Users/Jessica/Documents/HackReactor/SEI/SDC/Data CSVs/cart.csv'
WITH (FORMAT csv, HEADER true);
