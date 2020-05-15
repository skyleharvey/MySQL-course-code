-- SELECT
--   *
-- FROM users
-- ORDER BY created_at
-- LIMIT 5;


-- SELECT
--   DATE_FORMAT(created_at, '%a') AS day,
--   COUNT(DATE_FORMAT(created_at, '%a')) AS total
-- FROM users
-- GROUP BY day
-- ORDER BY total DESC;


-- SELECT
--   username AS 'inactive users'
-- FROM users
-- LEFT JOIN photos
--   ON photos.user_id = users.id
-- WHERE photos.id IS NULL;


-- find the user who has the photo with the most likes
-- SELECT
--   users.username AS user_with_most_liked_photo
-- FROM likes
-- JOIN photos
--   ON photos.id = likes.photo_id
-- JOIN users
--   ON users.id = photos.user_id
-- WHERE photos.id = (SELECT photo_id FROM likes GROUP BY photo_id ORDER BY COUNT(photo_id) DESC LIMIT 1)
-- LIMIT 1;


-- How many times does the average user post?
-- SELECT
--   AVG(SELECT COUNT(*) FROM photos GROUP BY user_id)
-- FROM photos;
-- ???
--
-- SELECT (SELECT COUNT(*) FROM photos)/ (SELECT COUNT(*) FROM users);


-- What are the top 5 most commonly used hashtags?
-- SELECT
--   -- tag_id,
--   tags.tag_name,
--   COUNT(*) AS total
-- FROM photo_tags
-- JOIN tags
--   ON tags.id = photo_tags.tag_id
-- GROUP BY tags.id
-- ORDER BY total DESC
-- LIMIT 7;




-- find users who have liked every photo on the site

SELECT
  users.username AS bots
FROM users;

SELECT
  users.username AS bots,
  COUNT(*) AS total_likes
FROM likes
JOIN users
  ON users.id = likes.user_id
WHERE (SELECT COUNT(*)) = 257
GROUP BY likes.user_id
ORDER BY total_likes;


-- SELECT
--   sub.bots,
--   sub.total_likes
-- FROM
--
-- (SELECT
--   users.username AS bots,
--   COUNT(*) AS total_likes
-- FROM likes
-- JOIN users
--   ON users.id = likes.user_id
-- GROUP BY likes.user_id
-- ORDER BY total_likes) sub
--
-- WHERE total_likes = (SELECT Max(sub.total_likes) FROM sub)
-- ;

-- LEFT JOIN likes
--   ON users.id = likes.user_id
-- WHERE likes.user_id IS NULL;




--
