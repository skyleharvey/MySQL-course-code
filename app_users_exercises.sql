-- EXERCISE 1
SELECT
  DATE_FORMAT(created_at, "%M %D %Y") AS earliest_date
FROM users
ORDER BY created_at ASC
LIMIT 1;

SELECT
  DATE_FORMAT(Min(created_at), "%M %D %Y") AS earliest_date
FROM users;

-- EXERCISE 2
SELECT
  email,
  created_at
FROM users
ORDER BY created_at ASC
LIMIT 1;

SELECT
  email,
  created_at
FROM users
WHERE created_at = (SELECT Min(created_at) FROM users);

-- EXERCISE 3
SELECT
  DATE_FORMAT(created_at, "%M") AS month,
  COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- EXERCISE 4
SELECT
  COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE "%yahoo.com";

-- EXERCISE 5
SELECT
  CASE
    WHEN email LIKE "%gmail.com" THEN "gmail"
    WHEN email LIKE "%yahoo.com" THEN "yahoo"
    WHEN email LIKE "%hotmail.com" THEN "hotmail"
    ELSE "other"
  END AS provider,
  COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
