
SELECT
  title
FROM books 
  WHERE title
  LIKE '%Stories%';
  
SELECT
  title,
  pages
FROM books 
ORDER BY 2 DESC LIMIT 1;  

SELECT
  CONCAT(title,' - ', released_year) AS Summary
FROM books
  ORDER BY released_year
  DESC LIMIT 3;

SELECT
  title, author_lname
FROM books
  WHERE author_lname
  LIKE '% %';
  
SELECT 
  title, released_year, stock_quantity
FROM books
  ORDER BY 3
  LIMIT 3;
  

SELECT 
title, author_lname
FROM books
ORDER BY 2,1;
  
SELECT 
  UPPER(
  CONCAT('My favorite author is ', author_fname,' ', author_lname)
  )
FROM books
  ORDER BY author_lname, author_fname;