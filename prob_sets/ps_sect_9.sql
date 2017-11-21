-- -- Number of books in database
SELECT
  COUNT(*) AS 'Titles in Database'
FROM books;

--  Number of Books released each year
SELECT 
  released_year,
  COUNT(*) AS 'Books Released per Year'
FROM books
  GROUP BY released_year;

--  Total books in stock
SELECT
  SUM(stock_quantity) AS 'Total Books in Stock'
FROM books;

-- Average release year for each author
SELECT
  CONCAT(author_lname, ', ', author_fname) AS 'Author',
  AVG(released_year) AS 'Average Release Year'
FROM books
  GROUP BY
    author_lname,
    author_fname;

-- Full Name of author with longest book(1)
SELECT
  CONCAT(author_fname, ' ', author_lname) AS 'Author of Longest Book' ,
  pages AS 'Pages'
FROM books
  ORDER BY pages
  DESC
  LIMIT 1;

-- Full Name of author with longest book(2)
SELECT
  CONCAT(author_fname, ' ', author_lname) AS 'Author of Longest Book',
  pages 
FROM books WHERE pages = 
    (SELECT Max(pages)
    FROM books);

-- Chart with columns: Year, # books, avg pages
SELECT 
  released_year AS 'Year',
  COUNT(*) AS '# Books',
  AVG(pages) AS 'Avg. Pages'
FROM books
  GROUP BY released_year;