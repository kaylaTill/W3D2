PRAGMA foreign_keys = ON;

CREATE TABLE users
(
  id INTEGER NOT NULL PRIMARY KEY, 
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL
);

CREATE TABLE questions
(
  question_id INTEGER NOT NULL PRIMARY KEY,
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
  FOREIGN KEY (questions_id) REFERENCES questions(question_id)
);

CREATE TABLE replies
(
  id INTEGER NOT NULL PRIMARY KEY,
  subject_question_id  INTEGER NOT NULL,
  parent_reply INTEGER NOT NULL,
  users_id INTEGER NOT NULL,
  body VARCHAR NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (subject_question_id) REFERENCES questions(question_id),
  FOREIGN KEY (parent_reply) REFERENCES replies(id)

);


CREATE TABLE question_likes 
(
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
 

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(question_id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('nick', 'piper'),
  ('kayla', 'tillman'),
  ('corgi', 'jones'); 

INSERT INTO 
  questions(title, body, associated_author)
VALUES
  ('How to insert values in SQL tables?', 'blahblahblahblahjhjdfshjs', 2),
  ('How to SQL?', 'blahblahblahblahjhjdfshjs', 1);

INSERT INTO 
  replies(subject_question_id, parent_reply, users_id, body)
VALUES
  (2, 1, 2, "blahblahblahblahjhjdfshjs"),
  (1, 2, 1, " klahblahblahblahjhjdfshjs");

INSERT INTO 
  question_likes(question_id, user_id)
VALUES 
  (1, 1),
  (2, 2);

INSERT INTO 
  question_follows(questions_id, users_id)
VALUES
  (1, 3);

