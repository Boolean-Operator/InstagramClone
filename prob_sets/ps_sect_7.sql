SELECT
  REVERSE(UPPER('Why does my cat look at me with such hatred?'));
  
SELECT
  REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-');
  
SELECT
  REPLACE(title, ' ', ' -> ') FROM books;

SELECT
  (author_fname) AS forwards, 
  REVERSE(author_fname) AS reversed
FROM books;
 
SELECT
  UPPER(
  CONCAT( author_fname, ' ', author_lname)) AS 'Full Name in Caps'
FROM books;
 
SELECT
  CONCAT( title, 'was released in ', released_year) AS 'blurbs'
FROM books;
 
SELECT 
  title,
  CHAR_LENGTH(title) AS 'Character Count'
FROM books;
 
SELECT
  CONCAT(SUBSTRING(title, 1, 10), ' ...') AS 'Short Title',
  CONCAT (author_lname, ', ', author_fname) AS Author,
  CONCAT('In stock: ',stock_quantity) AS 'Quantity'
FROM books;