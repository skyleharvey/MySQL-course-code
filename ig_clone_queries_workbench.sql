
SELECT
*
FROM photos
INNER JOIN likes
  ON photos.id = likes.photo_id
GROUP BY photos.user_id
ORDER BY photos.user_id;
