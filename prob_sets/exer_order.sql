SHOW FULL COLUMNS FROM books;

SELECT
  title,
  author_fname,
  author_lname 
FROM books 
  ORDER BY
    author_lname, 
    author_fname;

SELECT
  title,
  author_fname,
  author_lname
FROM books
  ORDER BY 3,2;

SELECT
  title,
  author_fname,
  author_lname
FROM books
  ORDER BY 2 DESC LIMIT 1;

SELECT
  title,
  author_fname,
  author_lname,
  stock_quantity
FROM books
  ORDER BY stock_quantity DESC LIMIT 5;

SELECT
  title,
  author_fname,
  author_lname,
  stock_quantity
FROM books
  ORDER BY stock_quantity DESC LIMIT 2,7;

SELECT
  title,
  author_fname
FROM books 
  WHERE title LIKE '%Stories%';
 
SELECT
  title,
  author_fname
FROM books
  WHERE author_fname LIKE 'da%';
 
SELECT
  title
FROM books
  WHERE  title LIKE 'the';

SELECT
  title,
  pages
FROM books 
ORDER BY 2 DESC LIMIT 1;

