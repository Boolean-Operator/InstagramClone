SELECT 'CHAR is faster for fixed length text such as state abbreviations and Y or N choices.' AS 'Good Use Case for CHAR: ';

-- CREATE TABLE inventory (
--   item_name VARCHAR(100),
--   price DECIMAL(8,2),
--   quantity INT);
  
SHOW COLUMNS FROM inventory;
  
  
SELECT 'TIMESTAMP has a smaller supported range and is converted to UTC for storage and back to local timezone upon retrieval.' AS 'Difference between DATETIME and TIMESTAMP :';
SELECT
  CURTIME() AS 'Current Time';

SELECT
  CURDATE() AS 'Current Date';

SELECT 
  DAYOFWEEK(NOW()) AS 'Number Day of the Week';
  
SELECT 
  DAYNAME(NOW()) AS 'Name Day of the Week';
  
SELECT
  DATE_FORMAT(NOW(), '%m/%d/%Y   %h:%i %p') AS 'Current Day and Time -Utilitarian';
  
SELECT
  DATE_FORMAT(NOW(), '%M %D at %h:%i') AS 'Current Day and Time - Formal';
  
-- CREATE TABLE tweets (
--     content VARCHAR(140),
--     username VARCHAR (15),
--     created_at TIMESTAMP DEFAULT NOW());


SHOW COLUMNS FROM tweets;

