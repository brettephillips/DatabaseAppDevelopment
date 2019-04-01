DROP DATABASE IF EXISTS mtg;
CREATE DATABASE mtg;

\c mtg;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
  user_id SERIAL,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  PRIMARY KEY(user_id)
);

DROP TABLE IF EXISTS deck CASCADE;
CREATE TABLE deck(
  deck_id SERIAL,
  name VARCHAR(50) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  PRIMARy KEY(deck_id)
);

DROP TABLE IF EXISTS deck_card CASCADE;
CREATE TABLE deck_card(
  card_id SERIAL,
  deck_id INT NOT NULL,
  api_id INT NOT NULL,
  card_name TEXT NOT NULL,
  image_url TEXT NOT NULL,
  FOREIGN KEY(deck_id) REFERENCES deck(deck_id)
);


DROP TABLE IF EXISTS rating CASCADE;
CREATE TABLE rating(
  rating_id SERIAL,
  deck_id INT NOT NULL,
  score INT NOT NULL,
  FOREIGN KEY(deck_id) REFERENCES deck(deck_id)
);

