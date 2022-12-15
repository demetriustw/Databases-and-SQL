-- CHALLANGE #1: 5 OLDEST USERS
SELECT * 
FROM users 
ORDER BY created_at
LIMIT 5;

-- CHALLANGE #2: DAY OF WEEK USERS REGIESTER
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users 
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- CHALLANGE #3: NO PHOTOS
SELECT username
FROM users
LEFT JOIN photos 
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- CHALLANGE #4: CONTEST WINNER (MOST LIKED PHOTO)
SELECT 
    username,
    photos.id, 
    photos.image_url, 
    COUNT(*) AS total
FROM photos
JOIN likes 
    ON likes.photo_id = photos.id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;