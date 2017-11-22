-- Challenge 1
-- Question:We want to reward users who have been with us the longest time
-- FIND: 5 oldest user created_at date/times

SELECT 
  id AS 'User ID',
  username AS 'User Name',
  created_at AS 'Account Opened'
FROM users
-- ORDER BY id
ORDER BY created_at
LIMIT 5;

-- Challenge 2
-- Question: What day of the week do most users register on ?
-- FIND: Count Created_at by Day of the Week
-- Can also be used to find when(time/date/day) to post to get most likes

SELECT
  COUNT(*) AS 'Registrations',
  DAYNAME(created_at) AS 'Day of Week'
FROM users
  GROUP BY `Day of Week`
  ORDER BY `Registrations` DESC;
  
  
-- Challenge 3
-- Questions: Identify inactive users for marketing campaign
-- FIND: Users with NULL photo ID or Created_at Dates

SELECT 
  username AS 'UserName',
  photos.created_at,
  photos.user_id,
  photos.image_url, 
  photos.id
  
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
  WHERE photos.id IS NULL;

-- Challenge 4
-- Question: Identify Most Popular Photo and Photographer for Contest
-- FIND: User Name who posted the photo with the most likes

SELECT
  users.id,
  users.username,
  photos.id,
  photos.image_url,
  COUNT(*) AS 'Likes'
FROM photos
INNER JOIN likes
  ON likes.photo_id = photos.id
INNER JOIN users
  ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY `Likes` DESC
LIMIT 1;


-- Challenge 5
-- Question: How many times does the avearage user post?
-- FIND: Average Number of Photos per user

SELECT
(SELECT COUNT(*)FROM photos)
  /
    (SELECT COUNT(*) FROM users)
      AS 'Average Number of Posts per User';


-- Challenge 6
-- Question: Advertiser wants to know what Hashtags to use in ad.
-- FIND: Top Five Most Popular HashTags

SELECT 
  CONCAT('#', tags.tag_name) AS 'Hashtag Name',
  COUNT(*) AS 'Hashtag Count'
FROM photo_tags
  INNER JOIN tags
  ON photo_tags.tag_id = tags.id
GROUP BY photo_tags.tag_id
ORDER BY `Hashtag Count` DESC
LIMIT 5;


-- Challenge 7
-- Question: Problem with bots on site.
-- FIND: All users who have liked every photo on site

SELECT 
  COUNT(*)
FROM photos;

SELECT 
  COUNT(*) AS 'likes',
  username
FROM users
INNER JOIN likes
  ON users.id = likes.user_id
-- JOIN photos
--   ON photos.user_id = users.id
GROUP BY likes.user_id
HAVING likes = (SELECT COUNT(*) FROM photos);