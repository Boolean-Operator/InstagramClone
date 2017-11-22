SHOW TABLES;  

SHOW COLUMNS FROM users;
SHOW COLUMNS FROM photos;
SHOW COLUMNS FROM comments;
SHOW COLUMNS FROM follows;
SHOW COLUMNS FROM likes;
SHOW COLUMNS FROM tags;
SHOW COLUMNS FROM photo_tags;

SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;
SELECT * FROM likes;
SELECT * FROM follows;
SELECT * FROM tags;
SELECT * FROM photo_tags;


-- Practice JOIN
SELECT
  image_url AS 'Image URL',
  username AS 'User Name',
  photos.created_at AS 'Photo added on'
FROM photos
JOIN users 
  ON photos.user_id = users.id;
  
  

SELECT 
  comment_text AS 'Comment',
  photo_id AS 'Photo',
  username AS ' User'
FROM comments
JOIN users
  ON users.id = comments.user_id
  ORDER BY photo_id,comments.created_at
;

SELECT 
  photo_id AS 'Photo',
  username AS ' User'
FROM likes
JOIN users
  ON users.id = likes.user_id
  ORDER BY photo_id,likes.created_at
;

SELECT 
  follower_id AS 'Follower ',
  followee_id AS 'Following'
FROM users
JOIN follows
  ON follower_id = users.id;

SELECT
  follows.follower_id AS 'User ID',
    stalker.username AS 'Stalker',
  follows.followee_id AS 'User ID',
    prey.username AS 'Prey'
FROM users stalker
INNER JOIN follows
  ON follows.follower_id = stalker.id
INNER JOIN users prey
  ON follows.followee_id = prey.id;


SELECT 
  tag_name AS 'Tag',
  photo_id AS 'Photo ID0',
  image_url AS 'Image'
FROM tags
JOIN photo_tags
ON photo_tags.tag_id = tags.id
JOIN photos
  ON photos.id = photo_tags.photo_id;

