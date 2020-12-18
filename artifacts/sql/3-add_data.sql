USE test;
INSERT INTO tutorials_tbl
  (tutorial_title, tutorial_author, submission_date)
  VALUES
  ("Learn PHP", "John Poul", NOW());

INSERT INTO tutorials_tbl
  (tutorial_title, tutorial_author, submission_date)
  VALUES
  ("Learn MySQL", "Abdul S", NOW());

INSERT INTO tutorials_tbl
  (tutorial_title, tutorial_author, submission_date)
  VALUES
  ("JAVA Tutorial", "Sanjay", '2007-05-06');

SELECT * FROM tutorials_tbl;
