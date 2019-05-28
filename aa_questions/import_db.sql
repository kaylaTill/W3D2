PRAGMA foreign_keys = ON;

CREATE TABLE users
(
  id INT NOT NULL PRIMARY KEY, 
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL
);

CREATE TABLE questions
(
  id INT NOT NULL PRIMARY KEY,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  associated_author INTEGER NOT NULL,

  FOREIGN KEY (associated_author) REFERENCES users(id)
);

CREATE TABLE question_follows
(
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies
(
  id INTEGER NOT NULL PRIMARY KEY
  subject_question_id  INTEGER NOT NULL,
  parent_reply INTEGER NOT NULL,
  users_id INTEGER NOT NULL,
  body VARCHAR NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply) REFERENCES replies(id)

);

-
CREATE TABLE question_likes 
(
  id INTEGER NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  likes INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (id) REFERENCES questions(id)
);