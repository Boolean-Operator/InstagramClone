-- <<< Practice #1 >>>
SELECT 
  first_name,
  title,
  grade
FROM students
JOIN papers
  ON students.id = papers.student_id;


-- <<< Practice #2 >>>
SELECT 
  first_name,
  title,
  AVG(grade) AS 'Grade Average'
FROM students
JOIN papers
  ON students.id = papers.student_id
  GROUP BY id
  ORDER BY `Grade Average` DESC;


-- <<< #1 >>>
SELECT 
  first_name AS 'Student',
  title AS 'Title of Paper', 
  grade AS 'Grade'
FROM students
INNER JOIN papers
  ON students.id = papers.student_id
  ORDER BY `Grade` DESC;
  
-- <<< #2 >>>  
SELECT 
  first_name AS 'Student',
  title AS 'Title of Paper', 
  grade AS 'Grade'
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
  ORDER BY id;
  
-- <<< #3 >>>  
SELECT 
  first_name AS 'Student',
  IFNULL(title, 'MISSING, Time to Study! ') AS 'Title of Paper', 
  IFNULL(grade, 0) AS 'Grade'
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
  ORDER BY id;
  
-- <<< #4 >>>
SELECT 
  first_name AS 'Student',
  IFNULL(AVG(grade), 0 ) AS 'Grade Average'
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
  GROUP BY students.id
  ORDER BY `Grade Average` DESC;


-- <<< #5 >>>
SELECT 
  first_name AS 'Student',
  IFNULL(AVG(grade), 0 ) AS 'Grade Average',
    CASE
      WHEN AVG(grade) IS NULL THEN 'FAILING'
      WHEN AVG(grade) >= 75 THEN 'PASSING'
      ELSE 'FAILING'
    END AS 'PASS / FAIL Status'
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
  GROUP BY students.id
  ORDER BY `Grade Average` DESC;
  