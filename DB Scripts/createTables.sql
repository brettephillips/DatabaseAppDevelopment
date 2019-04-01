DROP DATABASE IF EXISTS mtg;
CREATE DATABASE mtg;

\c mtg;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
  user_id SERIAL,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  PRIMARY KEY(user_id)
);

INSERT INTO users (user_id,username,password) VALUES (2,'dan','$2b$12$36EKImw626h4xG/DHEU4QeTklFoXWB.RMXv9SBEvYPE4UrlUX0Equ');
INSERT INTO users (user_id,username,password) VALUES (3,'Alex','$2b$12$itK2aMPdXT20hMCyJNcqo.nimwNbQy6dn64JNWXO4xi4pnfVPurJa');
INSERT INTO users (user_id,username,password) VALUES (8,'test','$2b$12$dgJN3Hxu7FrBCzePRvdKGO.xwRb7SkE2B.K/erE4xDDslYPn1Pf6i');


DROP TABLE IF EXISTS deck CASCADE;
CREATE TABLE deck(
  deck_id SERIAL,
  name TEXT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  PRIMARY KEY(deck_id)
);

INSERT INTO deck (deck_id,name,user_id) VALUES (1,'My First Deck',2);
INSERT INTO deck (deck_id,name,user_id) VALUES (4,'My Second Deck',2);

DROP TABLE IF EXISTS deck_card CASCADE;
CREATE TABLE deck_card(
  card_id SERIAL,
  deck_id INT NOT NULL,
  api_id INT NOT NULL,
  card_name TEXT NOT NULL,
  image_url TEXT NOT NULL,
  FOREIGN KEY(deck_id) REFERENCES deck(deck_id)
);

INSERT INTO deck_card (card_id,deck_id,api_id,card_name,image_url) VALUES (2,1,1234,'Water Elemental','http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1234&type=card');
INSERT INTO deck_card (card_id,deck_id,api_id,card_name,image_url) VALUES (3,1,5678,'Intrepid Hero','http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=5678&type=card');



DROP TABLE IF EXISTS rating CASCADE;
CREATE TABLE rating(
  rating_id SERIAL,
  deck_id INT NOT NULL,
  score INT NOT NULL,
  FOREIGN KEY(deck_id) REFERENCES deck(deck_id)
);

