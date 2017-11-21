SELECT * FROM customers;
SELECT * FROM orders;
SHOW COLUMNS FROM customers;
SHOW COLUMNS FROM orders;

SHOW FULL COLUMNS FROM customers;
SHOW FULL COLUMNS FROM orders;


-- !!! 2 step process to achieve a JOIN 
SELECT * 
FROM customers
  WHERE last_name = 'George';

SELECT * 
FROM orders
  WHERE customer_id = 1;

-- !!! 1 step with nested SELECT to achieve a JOIN
SELECT * FROM orders WHERE customer_id =
  (
    SELECT id FROM customers 
    WHERE last_name = 'George'
  );

-- <<<<CROSS JOIN>>>>
-- (meaningless - worthless) - just jams all orders with all customers
SELECT * FROM customers, orders;


-- IMPLICIT  Inner Join ---!! DO NOT USE THIS ONE !!---
SELECT * FROM customers, orders
  WHERE customers.id = orders.customer_id;

-- Not sure if this type of notation is acceptabel
SELECT 
  customers.first_name AS 'First Name',
  customers.last_name AS 'Last Name',
  orders.amount AS 'Amount',
  orders.order_date AS 'Purchase Date',
  customers.id AS 'Customer Id No.'
FROM customers, orders
  WHERE customers.id = orders.customer_id;
  
SELECT 
  CONCAT(customers.first_name, ' ', customers.last_name)AS 'Customer',
  orders.amount AS 'Amount',
  orders.order_date AS 'Purchase Date',
  customers.id AS 'Member Id'
FROM customers, orders
  WHERE customers.id = orders.customer_id;
  

-- <<<<INNER JOIN>>>>
-- EXPLICIT INNER JOIN
-- !! USE THIS ONE !!
SELECT * FROM customers
JOIN orders
  ON customers.id = orders.customer_id;
  

SELECT 
  first_name AS 'First Name',
  last_name AS 'Last Name',
  order_date AS 'Purchase Date',
  amount AS 'Amount'
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
  ORDER BY order_date DESC;
  
SELECT 
  customer_id AS 'ID',
  first_name AS 'First Name',
  last_name AS 'Last Name',
  order_date AS 'Purchase Date',
  amount AS 'Amount'
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
  ORDER BY orders.customer_id ASC;
    
    
-- Example - Table to show customers spending in order of highes to lowest, join two tables to get info.    
-- Use 'quotes' to name alias with spaces, Use `backticks` to Identify alias in ORDER BY command
SELECT 
  customer_id AS 'ID',
  CONCAT(first_name, ' ',last_name) AS 'Customer',
  SUM(amount) AS 'Spending YTD'
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
  GROUP BY orders.customer_id
  ORDER BY `Spending YTD` DESC;
  
-- <<<< LEFT JOIN >>>>
!!! Everthing from left table along with matches from right table !!!

SELECT 
  CONCAT(first_name, ' ',last_name) AS 'Customer',
  amount AS 'Amount'
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id;

  
SELECT 
  CONCAT(first_name, ' ',last_name) AS 'Customer',
  SUM(amount) AS 'YTD Spending'
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id
GROUP BY customers.id;
  

-- IFNULL statement  
SELECT 
  CONCAT(first_name, ' ',last_name) AS 'Customer',
  SUM(amount) AS 'YTD Spending',
  IFNULL(SUM(amount), 0)
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY `YTD Spending` DESC;
  
  
