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

-- CHALLANGE #5: AVG NUM OF PHOTOS PER USER
-- total number of photos / total number of users
SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

-- CHALLANGE #6: TOP 5 MOST USED HASHTAGS
SELECT tag_name, COUNT(*) AS total
FROM photo_tags
JOIN tags 
    ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- CHALLANGE #7: WHO LIKED EVERYTHING
-- MY CODE
SELECT 
    username, 
    COUNT(*) AS total_likes,
    IF(COUNT(*) >= (SELECT COUNT(*) FROM photos), 'BOT', 'USER') AS is_bot
FROM likes
JOIN users 
    ON users.id = likes.user_id
GROUP BY username
ORDER BY total_likes DESC;

-- VIDEO CODE
SELECT 
    username, 
    user_id,
    COUNT(*) AS num_likes,
    IF(COUNT(*) >= (SELECT COUNT(*) FROM photos), 'BOT', 'USER') AS is_bot
FROM users
JOIN likes
    ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos)
ORDER BY num_likes DESC;
