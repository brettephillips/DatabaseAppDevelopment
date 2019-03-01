CREATE TABLE USER(
  user_id INTEGER primary key AUTOINCREMENT,
  username TEXT,
  password TEXT
);

CREATE TABLE DECK(
  deck_id INTEGER primary key AUTOINCREMENT,
  name TEXT,
  rating INTEGER,
  user_id INTEGER,
  FOREIGN KEY(user_id) REFERENCES USER(user_id)
);

CREATE TABLE CARD(
  card_id integer primary key AUTOINCREMENT,
  api_id integer
);

CREATE TABLE DECK_CARD(
  card_id INTEGER,
  deck_id INTEGER,
  FOREIGN KEY(card_id) REFERENCES CARD(card_id),
  FOREIGN KEY(deck_id) REFERENCES DECK(deck_id),
  PRIMARY KEY(card_id, deck_id)
);