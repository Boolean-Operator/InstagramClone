SHOW FULL COLUMNS FROM books;
SHOW COLUMNS FROM books;
SELECT * FROM books;

******* COUNT *******
return number of books in the table
SELECT COUNT(*) FROM books;

return number of distinct first names in table
SELECT COUNT(DISTINCT author_fname) FROM books;

return the number of distinct authors in table;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

how many titles contain "the"
SELECT
  COUNT(*) AS '# Books with "the" in title'
FROM books
  WHERE title
  LIKE '%the%'; 

******* GROUP BY *******

SELECT 
  CONCAT(author_lname,', ', author_fname) AS "Author - Last, First",
  COUNT(*) AS "Title Count"
FROM books
  GROUP BY author_lname, author_fname;
  
  SELECT
    CONCAT('In ', released_year, ' ', COUNT(*),
    ' book(s) released') AS year
  FROM books
    GROUP BY released_year;


******* MIN & MAX ******

SELECT
  Max(pages)
From books;

SELECT
  Min(released_year)
From books;


!!Runs 2 queries to return title author and pages of book with least number of pages !! SLOW if using on a large Data Set

SELECT title, author_lname, pages
FROM books
  WHERE pages = 
    (SELECT Min(pages)
    FROM books);

!Faster solution!
SELECT title, author_lname, pages
FROM books
  ORDER BY pages ASC LIMIT 1;


SELECT 
  author_fname, author_lname,
  Min(released_year)
FROM books
  GROUP BY author_lname, author_fname;

SELECT
  CONCAT(author_fname, ' ' , author_lname) AS Author,
  Min(released_year) AS 'First Release'
FROM books
  GROUP BY author_lname, author_fname;


********** SUM **********

SELECT
  Sum(pages) AS 'Total Pages'
FROM books;

SELECT
  author_fname,
  author_lname,
  Sum(pages)
From books
  GROUP BY
    author_lname,
    author_fname;
  
SELECT
  CONCAT(author_fname, ' ', author_lname) AS Author,
  Sum(pages) AS 'Total Pages'
From books
  GROUP BY author_lname, author_fname;
  

********** AVG **********

SELECT
  AVG(pages)
FROM books;

SELECT 
  AVG(stock_quantity)
FROM books
  GROUP BY released_year;
  
SELECT 
  released_year,  
  AVG(stock_quantity)
FROM books
  GROUP BY released_year;

SELECT
  CONCAT(author_lname, ', ', author_fname) AS 'Author',
  SUM(pages) AS 'Total Pages',
  AVG(pages) AS "Average Pages"
FROM books
  GROUP BY
    author_lname,
    author_fname;

SELECT
  CONCAT(author_lname, ', ', author_fname) AS 'Author',
  COUNT(*) AS "Books",
  SUM(pages) AS 'Total Pages',
  AVG(pages) AS "Average Pages"
FROM books
  GROUP BY
    author_lname,
    author_fname;

