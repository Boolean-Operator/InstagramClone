-- <<< Challenge 1 All Rated Series >>>

SELECT 
  title,
  rating
FROM series
INNER JOIN reviews
  ON series.id = reviews.series_id;

-- <<< Challenge 2 Average Rating >>>

SELECT
  title,
  AVG(rating) AS 'Average Rating'
FROM series
INNER JOIN reviews
  ON series.id = reviews.series_id
  GROUP BY series.id 
  ORDER BY `Average Rating`;


-- <<< Challenge 3 Reviewers and Given Ratings>>>

SELECT 
  first_name AS 'First Name',
  last_name AS 'Last Name',
  rating AS 'Rating'
  
FROM reviewers
INNER JOIN reviews
  ON reviewers.id = reviews.reviewer_id;

-- <<< Challenge 4 Unreviewed Series>>>

SELECT 
  title AS 'Unreviewed Series'
FROM series
LEFT JOIN reviews
  ON series.id = reviews.series_id
  WHERE rating IS NULL;


-- <<< Challenge 5 Genre Average Ratings>>>

SELECT 
  genre AS 'Genre',
  ROUND(
    AVG(rating), 2
  ) AS 'Average Rating'
FROM series
JOIN reviews
  ON series.id = reviews.series_id
  GROUP BY genre;


-- <<< Challenge 6 Reviewer Stats >>>

SELECT
  first_name AS 'First Name',
  last_name AS 'Last Name',
  IFNULL(COUNT(rating), 0) AS 'Count',
  IFNULL(MIN(rating), 0) AS 'Min Rating',
  IFNULL(MAX(rating),0) AS 'Max Rating',
  ROUND(
    IFNULL(AVG(rating),0),3
        ) AS 'Avg Rating',
  -- IF (COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS 'Status'
    CASE
      WHEN COUNT(rating) >= 10 THEN 'POWER USER'
      WHEN COUNT(rating) > 0 THEN 'ACTIVE'
      ELSE 'INACTIVE'
    END AS 'Status'
FROM reviewers
LEFT JOIN reviews
  ON reviewers.id = reviews.reviewer_id
  GROUP BY reviewers.id;


-- <<< Challenge 7 Series 3 Tables - Review and Reviewer >>>


SELECT 
  title,
  rating
FROM series

SELECT 
  title AS 'Series',
  rating AS 'Rating',
  CONCAT(first_name, ' ', last_name) AS 'Reviewer'
FROM reviewers
INNER JOIN reviews
  ON reviewers.id = reviews.reviewer_id
INNER JOIN series
  ON series.id = reviews.series_id
  ORDER BY series.title;