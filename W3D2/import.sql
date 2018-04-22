DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;

------------------------------------------------
------ CREATE ------

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,
  body VARCHAR(255) NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


------------------------------------------------
------ INSERT ------


INSERT INTO
  users (fname, lname)
VALUES
  ('John', 'Doe'),
  ('Mary', 'Poppins'),
  ('Luke', 'SkyIsFalling');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('What is life?', 'The universe, and everything', 1),
  ('How Yondu Took Over', 'Im Mary Poppins yall!', 2);

INSERT INTO
  replies (parent_id, user_id, body, question_id)
VALUES
  (NULL, 1, '42! Always 42!', 1),
  (1, 1, '42! Always 42!', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1,1),
  (1,2),
  (2,1);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,1),
  (1,2),
  (2,1);
