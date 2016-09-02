CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject INTEGER NOT NULL,
  parent INTEGER,
  author INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (subject) REFERENCES questions(id),
  FOREIGN KEY (parent) REFERENCES replies(id),
  FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ("Danielle","Z"),
  ("Joe", "K"),
  ("Mickey", "Mouse");

INSERT INTO
  questions (title, body, user_id)
VALUES
  ("Who wrote the book of love?", "I wonder wonder", 2),
  ("Where is Carmen Sandiago?", "I think I saw her in Rio", 1),
  ("Have you seen Pluto?", "I hear its no longer a planet", 3),
  ("What's new Scooby Doo?", "Nothing", 3);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (2, 3),
  (1, 2),
  (2, 1),
  (3, 1);

INSERT INTO
  replies(subject, parent, author, body)
VALUES
  (1, NULL, 1, "Adele"),
  (1, 1, 2, "LOL"),
  (1, 2, 1, "I know right"),
  (2, NULL, 3, "She went to the Olympics")
;

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,2),
  (2,3),
  (1,3),
  (1,4)
;
