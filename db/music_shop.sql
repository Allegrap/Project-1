DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  image_url VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE,
  genre VARCHAR(255),
  image_url VARCHAR(255),
  quantity INT4,
  buy_price INT4,
  sell_price INT4
);