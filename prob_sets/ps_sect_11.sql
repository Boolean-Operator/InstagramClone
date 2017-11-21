SELECT * FROM books;

SELECT 10 != 10;
-- false

SELECT 15 > 14 && 99 - 5 <= 94;
-- true

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
-- true

SELECT 
    title AS 'All books written before 1980',
    released_year
FROM books
    WHERE released_year < 1980
    ORDER BY released_year;
    
SELECT 
    title AS 'Books written by Eggers or Chabon',
    CONCAT(author_lname, ', ', author_fname) AS 'Author'
FROM books
    WHERE author_lname IN ('Eggers', 'Chabon')
    ORDER BY author_lname
;
    
SELECT
    title AS 'All books by Lahiri released after 2000',
    author_lname,
    released_year
FROM books
    WHERE author_lname IN ('Lahiri')
    AND released_year > 2000
;    

SELECT 
    title AS 'Books with page count between 100 and 200 pages',
    pages
FROM books
    WHERE pages BETWEEN 100 AND 200
;
    
SELECT 
    title AS 'Books where Author last name start with C or S',
    CONCAT(author_lname, ', ', author_fname) AS 'Author'
FROM books
    WHERE SUBSTRING(author_lname, 1,1) IN ('C','S')
    ORDER BY author_lname
;
    
SELECT
    title AS 'Books by type - Memoir, Novel or Short Stories',
    
    CASE 
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%Just Kids%' || title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books
     ORDER BY TYPE;
     

SELECT
    title AS 'Total Number of Books by this Author',
    CONCAT(author_lname,', ', author_fname) AS "Author",
    CASE WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*),' book')
        ELSE CONCAT(COUNT(*), ' booksess')
    END AS COUNT
        
FROM books
    GROUP BY  author_lname, author_fname;
    
