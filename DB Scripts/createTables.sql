DROP DATABASE IF EXISTS MTG;
CREATE DATABASE MTG;

DROP TABLE IF EXISTS USER CASCADE;
CREATE TABLE USER(
  user_id INT SERIAL NOT NULL,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  PRIMARY KEY(user_id)
);

DROP TABLE IF EXISTS DECK CASCADE;
CREATE TABLE DECK(
  deck_id INT SERIAL NOT NULL,
  name VARCHAR(50) NOT NULL,
  rating INT,
  user_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES USER(user_id),
  PRIMARy KEY(deck_id)
);

DROP TABLE IF EXISTS CARD CASCADE;
CREATE TABLE CARD(
  card_id INT SERIAL NOT NULL,
  api_id INT ONT NULL,
  PRIMARY KEY(card_id)
);

DROP TABLE IF EXISTS DECK_CARD CASCADE;
CREATE TABLE DECK_CARD(
  card_id INT NOT NULL,
  deck_id INT NOT NULL,
  FOREIGN KEY(card_id) REFERENCES CARD(card_id),
  FOREIGN KEY(deck_id) REFERENCES DECK(deck_id),
  PRIMARY KEY(card_id, deck_id)
);
