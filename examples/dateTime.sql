CREATE TABLE people (
  name VARCHAR (100),
  birthdate DATE,
  birthtime TIME,
  birthdayExact DATETIME
  );
  
  
  
INSERT INTO people (name, birthdate, birthtime, birthdayExact)
  VALUES 
  ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35' ),
  ('Larry', '1943-12-25', '01:10:42', '1943-12-25 01:10:42');
    
    
-- CURDATE() - Gives Current Date
-- CURTIME() - Gives Current Time
-- NOW() - Gives current Date & Time

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdayExact) VALUES
('MavrickMan', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

SELECT name, birthdate, DAYNAME(birthdate) FROM people;

SELECT
  name AS 'Name',
  birthdate AS 'Date of Birth',
  DAYNAME(birthdayExact) AS 'Day of Week',
  MONTHNAME(birthdayExact) AS 'Birth Month'
FROM people;

SELECT
  name AS 'Name',
  birthdate AS 'Date of Birth',
  DATE_FORMAT(birthdayExact, '%W %M %D, %Y at %h:%i %p' ) AS 'Raw Formal Display'
FROM people;

SELECT
  name AS 'Name',
  birthdate AS 'Date of Birth',
  DATE_FORMAT(birthdayExact, '%W, the %D day of %M in the year %Y' ) AS 'Formal Display'
FROM people;


SELECT * FROM people;
 
SELECT
  DATEDIFF(NOW(),
  birthdate)
FROM people;
 
SELECT
  name,
  birthdate,
  DATEDIFF(NOW(), birthdate)
FROM people;
 
SELECT
  birthdayExact
FROM people;
 
SELECT
  birthdayExact,
  DATE_ADD(birthdayExact, INTERVAL 1 MONTH)
FROM people;
 
SELECT
  birthdayExact,
  DATE_ADD(birthdayExact, INTERVAL 10 SECOND)
FROM people;
 
SELECT
  birthdayExact,
  DATE_ADD(birthdayExact, INTERVAL 3 QUARTER)
FROM people;
 
SELECT
  birthdayExact,
  birthdayExact + INTERVAL 1 MONTH
FROM people;
 
SELECT
  birthdayExact,
  birthdayExact - INTERVAL 5 MONTH
FROM people;
 
SELECT
  birthdayExact,
  birthdayExact + INTERVAL 15 MONTH + INTERVAL 10 HOUR
FROM people;


CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT
  INTO comments (content)
  VALUES('lol what a funny article');
 
INSERT
  INTO comments (content) 
  VALUES('I found this offensive');
 
INSERT
  INTO comments (content) 
  VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments 
  ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT
  INTO comments2 (content)
  VALUES('dasdasdasd');
 
INSERT
  INTO comments2 (content)
  VALUES('lololololo');
 
INSERT
  INTO comments2 (content)
  VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2
  SET content='THIS IS NOT GIBBERISH'
  WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);