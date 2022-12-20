CREATE TABLE users(
	email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (email) 
VALUES ('Katie34@yahoo.com'), ('Tunde@gmail.com');

INSERT INTO users (email, created_at) VALUES
('dusty@gmail.com', '2022-03-12T06:46:55.049Z');

SELECT 
DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date 
FROM users 
ORDER BY created_at LIMIT 1;

SELECT * 
FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

SELECT 
email, created_at
FROM users 
ORDER BY created_at LIMIT 1;

SELECT 
	MONTHNAME(created_at) AS month,
	COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

SELECT 
	COUNT(email) AS yahoo_users
FROM users
WHERE email LIKE '%yahoo%';


SELECT 
email,
	CASE 
		WHEN email LIKE '%@gmail.com%' THEN 'gamil'
		WHEN email LIKE '%@yahoo.com%' THEN 'yahoo'
		WHEN email LIKE '%@hotmail.com%' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
