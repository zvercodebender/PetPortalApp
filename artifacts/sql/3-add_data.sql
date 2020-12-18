USE test;
INSERT INTO tutorials_tbl
  (tutorial_title, tutorial_author, submission_date)
  VALUES
  ("Learn PHP", "John Poul", NOW());

mysql> INSERT INTO tutorials_tbl
  (tutorial_title, tutorial_author, submission_date)
  VALUES
  ("Learn MySQL", "Abdul S", NOW());

mysql> INSERT INTO tutorials_tbl
  (tutorial_title, tutorial_author, submission_date)
  VALUES
  ("JAVA Tutorial", "Sanjay", '2007-05-06');

SELECT * FROM tutorials_tbl;
