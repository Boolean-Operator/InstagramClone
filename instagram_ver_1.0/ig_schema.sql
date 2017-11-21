CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
      FOREIGN KEY (user_id)
      REFERENCES users(id)
      ON DELETE CASCADE 
);

CREATE TABLE comments (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(255),
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id)
      REFERENCES users(id)
      ON DELETE CASCADE,
    FOREIGN KEY(photo_id)
      REFERENCES photos(id)
      ON DELETE CASCADE
);

CREATE TABLE likes (
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id)
      REFERENCES users(id)
      ON DELETE CASCADE,
    FOREIGN KEY(photo_id)
      REFERENCES photos(id)
      ON DELETE CASCADE,
    PRIMARY KEY(user_id,photo_id)
);

CREATE TABLE follows (
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id)
      REFERENCES users(id)
      ON DELETE CASCADE,
    FOREIGN KEY(followee_id)
      REFERENCES users(id)
      ON DELETE CASCADE,
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
  photo_id INT NOT NULL, 
  tag_id INT NOT NULL,
  FOREIGN KEY(photo_id)
    REFERENCES photos(id)
    ON DELETE CASCADE,
  FOREIGN KEY(tag_id)
    REFERENCES tags(id)
    ON DELETE CASCADE,
  PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO users (username) VALUES
  ('BlueTheCat'),
  ('CharlieBrown'),
  ('ColtSteele'),
  ('BooleanOperator')
;
  
INSERT INTO photos (image_url, user_id) VALUES
  ('www.','1'),
  ('www.','2'),
  ('www.','2'),
  ('www.','4'),
  ('www.','4');

INSERT INTO comments (comment_text, user_id, photo_id) VALUES
('MEOW', 1, 2),
('WTF Did you take this with a potato?', 2, 5),
('I know, this one is so blurry I cannot tell what it is.  Maybe clean your lens, dude. ', 1, 5),
('This is really nice.  Remindes me of the time I was in Delaware.', 4, 4),
('Hey, I have been to Delaware, Nice Beaches and the Boardwalk Frys are Awesome', 3, 4),
('Does this one make anyone else think of cotton candy?', 4, 2),
('MEOW, Yes, I love cotton candy. ', 1, 2);

INSERT INTO likes (user_id,photo_id) VALUES
  (1,2),
  (2,2),
  (3,2),
  (1,3),
  (1,4);

INSERT INTO follows (follower_id,followee_id) VALUES
  (1,2),
  (2,4),
  (3,2),
  (1,3),
  (3,4);

INSERT INTO tags (tag_name) VALUES
  ('Meow'),
  ('LOL'),
  ('BeautifulSunset'),
  ('Adorable'),
  ('Cute'),
  ('Sunrise'),
  ('FullMoon');
  
INSERT INTO photo_tags (photo_id, tag_id) VALUES
  (1,3),
  (1,2),
  (1,7),
  (2,1),
  (2,4),
  (2,5),
  (4,5),
  (4,1),
  (5,3);


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
