-- CREATES A TABLE CALLED PEOPLE 
CREATE TABLE people(first_name VARCHAR(50), last_name VARCHAR(50), age INT);

-- ADDS FIRST PERSON TO PEOPLE 
INSERT INTO people(first_name, last_name, age)
VALUES('Tina' ,'Belcher', 13);

-- ADDS SECOND PERSON TO PEOPLE 
INSERT INTO people(first_name, last_name, age)
VALUES('Bob', 'Belcher', 42);

-- ADDS THREE PEOPLE TO PEOPLE 
INSERT INTO people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45),
	  ('Phillip','Frond', 38),
      ('Calvin','Fischoeder', 70);

-- DELETES PEOPLE TABLE & ALL INSIDE 
DROP TABLE people;

-- DON'T ALLOW EMPTY INPUTS 
CREATE TABLE cats2 (name VARCHAR(50) NOT NULL, age INT NOT NULL);

-- CREATES TABLE CALLED SHOPS & ADDS SHOE EMPORIUM TO IT 
CREATE TABLE shops (name VARCHAR(100));
INSERT INTO shops(name) VALUES('shoe emporium');

-- BRAKES OUT OF QUOTES, ALLOWING THEM IN STRING 
INSERT INTO shops(name) VALUES('mario\'s pizza');

-- DON'T ALLOW NULL/EMPTY INPUTS & INPUTS DEFAULTS IF BLANK 
CREATE TABLE cats4 ( name VARCHAR(100) NOT NULL DEFAULT 'mystery', age INT NOT NULL DEFAULT 99);

-- DON'T ALLOW NULL/EMPTY INPUTS 
CREATE TABLE unique_cats (cat_id INT NOT NULL PRIMARY KEY, name VARCHAR(100), age INT):



-- ADDS BINGO TO UNIQUE_CATS 
INSERT INTO unique_cats(cat_id, name, age)
VALUES(1, 'bingo', 2);

-- GIVES ERROR FOR SAME ID NUMBER 
INSERT INTO unique_cats(cat_id, name, age)
VALUES(1, 'bongo', 3);

-- MANUALY CHANGE ID NUMBER 
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'bongo', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES(3, 'bongo', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES(999, 'bongo', 3);

-- MORE READABLE DECLARATION OF PRIMARY KEY 
-- NOT NULL IS REDUNDANT. PRIMARY KEYS CANNOT BE NULL 
CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

-- NOT NULL NOT DECLARED, PRIMARY DECLARED 
CREATE TABLE unique_cats (cat_id INT, name VARCHAR(100), age INT, PRIMARY KEY(cat_id));

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Oingo', 3);

INSERT INTO unique_cats(name, age) VALUES('Oingo', 3);

-- PRIMARY DECLARED & AUTO INCREMENT MAKING IT PASS CAT_ID AUTOMATICLY 
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

-- PUT PRIMARY DECLARED & AUTO INCREMENT ON SAME LINE 
CREATE TABLE unique_cats4 (
    cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);


-- EXERCISE (BASICLY ADDING EVERYTHING SO FAR INTO ONE TABLE) 
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed'    
);

INSERT INTO employees (first_name, last_name, age)
VALUES ('thomas', 'chickenman', 87);

-- CRUD (START WITH CLEAN SLATE & DELETE EVERYTHING SO FAR) 
DROP TABLE cats;

CREATE TABLE cats
    (
        cat_id INT AUTO_INCREMENT,
        name VARCHAR(100),
        breed VARCHAR(100),
        age INT,
        PRIMARY KEY (cat_id)
    );

INSERT INTO cats(name, breed, age)
VALUES('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dumbldore', 'Main Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 13),
('George Michael', 'Ragdoll', 9),
('Jackson', 'Sphynx', 7);


-- USE THE WHERE FUNCTION WITH SELECT 
SELECT * FROM cats WHERE age = 4;
SELECT name, age FROM cats WHERE age=4;
SELECT name FROM cats WHERE age=4;

-- NON-CASE SENSITIVE 
SELECT * FROM cats WHERE name='Egg';

-- WORKS JUST THE SAME AS ONE ABOVE 
SELECT * FROM cats WHERE name='eGG';

-- RAPID FIRE EXERCISE (WRIGHT THE CODE USED) 
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;

-- ALIASES (ALT NAME FOR TABLE COLUMN) 
SELECT cat_id AS id, name FROM cats;

-- UPDATE COLUMNS 
-- UPDATES ALL IN TABLE COLUMN TO NEW VALUE/S 
UPDATE employees SET last_name='roosterbeard';
UPDATE employees SET current_status='laid-off', last_name='who cares';

-- BASIC TEMPLATE/PATERN FOR UPDATE 
UPDATE table SET col=val, another_col=val WHERE col=val;

-- SELECT BEFORE YOU UPDATE OR DELETE!!!!!! 
SELECT * FROM cats WHERE name='Misty';

-- UPDATE EXERCISE 
SELECT * FROM cats WHERE name='Jackson';
UPDATE cats SET name='Jack' WHERE name='Jackson';

SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';

SELECT * FROM cats WHERE breed='Main Coon';
UPDATE cats SET age=12 WHERE breed='Main Coon';

-- DELETE FUNCTION 
-- DELETE FUNCTION NEEDS WHERE SO YOU DELETE ONLY WHAT WANTED 
-- IF WHERE IS GONE THEN EVERY THING GETS DELETED 
DELETE FROM cats WHERE name='Egg';

-- FYI USE DATABASE TABLE WANTED IS IN FIRST 
USE pet_shop;

-- EXAMPLE FOR DELETE WITHOUT WHERE CLAUSE 
SELECT * FROM employees;
DELETE FROM employees;
DESC employees;

-- DELETE EXERCISE 
SELECT * FROM cats;
DELETE FROM cats WHERE age=4;

SELECT * FROM cats;
DELETE FROM cats WHERE age=cat_id;

SELECT * FROM cats;
DELETE FROM cats;

SELECT * FROM cats;

-- CRUD CHALLANGE 
CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts(
    shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(50),
    color VARCHAR(50),
    shirt_size VARCHAR(50),
    last_worn INT
    );

SELECT * FROM shirts;
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES('t-shirt', 'white', 'S', 10),
      ('t-shirt', 'green', 'S', 200),
      ('polo shirt', 'black', 'M', 10),
      ('tank top', 'blue', 'S', 50),
      ('t-shirt', 'pink', 'S', 0),
      ('polo shirt', 'red', 'M', 5),
      ('tank top', 'white', 'S', 200),
      ('tank top', 'blue', 'M', 0);
SELECT * FROM shirts;

INSERT INTO shirts(color, article, shirt_size, last_worn)
VALUES('purple', 'polo shirt', 'M', 50);
SELECT * FROM shirts;

SELECT article,color FROM shirts;

SELECT article,color,shirt_size,last_worn FROM shirts;

SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
SELECT * FROM shirts WHERE article='polo shirt';

SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
SELECT * FROM shirts WHERE last_worn=0;

SELECT * FROM shirts WHERE color='white';
UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';
SELECT * FROM shirts WHERE color='off white';

SELECT * FROM shirts WHERE last_worn='200';
DELETE FROM shirts WHERE last_worn='200';
SELECT * FROM shirts WHERE last_worn='200';

SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';
SELECT * FROM shirts WHERE article='tank top';

SELECT * FROM shirts;
DELETE FROM shirts;
SELECT * FROM shirts;

DROP DATABASE shirts_db;

-- CONCAT 
SELECT CONCAT(author_fname, '!!!') FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS Author_name FROM books;

-- CONCAT_WS 

SELECT CONCAT_WS('!','hi','bye','lol');
SELECT CONCAT_WS('-', title, author_fname, author_lname) AS Author_name_and_Title FROM books;
SELECT
    CONCAT_WS('-', title, author_fname, author_lname)
    FROM books;

-- SUBSTRING 
SELECT SUBSTRING('Hello World', 1, 4);
-- RESOLTES ARE "HELL" 

SELECT SUBSTRING('Hello World', 2, 5);
-- RESOLTES ARE "ELLO" 

SELECT SUBSTRING('Hello World', 7);
-- RESOLTES ARE "WORLD" 

SELECT SUBSTRING('Hello World', -3);
-- RESOLTES ARE "RLD" (GOES BACKWORDS) 

-- SUBSTR() === SUBSTRING() 
-- FIRST LETTER OF LAST NAME 
SELECT SUBSTR(author_lname, 1, 1) AS initial, author_lname FROM books;
SELECT SUBSTR(title, 1, 10) FROM books;

-- REPLACE 
SELECT REPLACE('Hello World', 'Hell', '%$#@')

SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REPLACE(title, ' ', '-') FROM books;

-- REVERSE 
SELECT REVERSE(NULL);

SELECT REVERSE('chicken nuggets');

-- MAKE NAMES WORK LIKE RACECAR (SAME FORWARDS AND BACK) 

SELECT
  CONCAT(author_fname, REVERSE(author_fname))
FROM
  books;

-- CHAR_LENGTH 
SELECT CHAR_LENGTH("Hey!");

-- BIT LENGHT SOMETIMES THE SAME AS CHAR_LENGTH
SELECT LENGTH("Hey!");

SELECT CHAR_LENGTH(title) AS len, title FROM books;

SELECT
REPLACE
    (
    CONCAT('I', ' ', 'like', ' ', 'cats'),
    ' ',
    '-'
    );


SELECT REPLACE(title,' ','->') AS title FROM books;

SELECT author_lname AS 'forwards', REVERSE(author_lname) AS 'backwords' FROM books;

SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS 'blurb' FROM books;

SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS short_title, CONCAT(author_lname, ',', author_fname) AS 'author', CONCAT(stock_quantity, ' in stock') AS 'quantitiy' FROM books;

SELECT * FROM books WHERE title IN()

SELECT 
        SUBSTR(title,1,15) AS 'first',

        SUBSTR(title,4,18) AS 'second',

        SUBSTR(title,10,5) AS 'third',
        SUBSTR(title,7,1) AS 'forth',
        
        SUBSTR(title,13,6) AS 'fifth'
        

    FROM books
    WHERE
        book_id IN(9,7,15,14,13);

SELECT SUBSTR(title,1,15) AS 'first',
SUBSTR(title,4,18) AS 'second',
SUBSTR(title,10,5) AS 'third',
SUBSTR(title,7,1) AS 'forth',
SUBSTR(title,13,6) AS 'fifth' FROM books
WHERE SUBSTR(title,1,1) = 'A' && CHAR_LENGTH(title) = 41
OR SUBSTR(title,1,1) = 'T' && CHAR_LENGTH(title) = 41
OR SUBSTR(title,1,1) = 'O' && CHAR_LENGTH(title) = 17
OR SUBSTR(title,1,1) = 'C' && CHAR_LENGTH(title) = 11
OR SUBSTR(title,1,1) = 'W' && CHAR_LENGTH(title) = 51;

-- DISTINCT (REMOVES DUPLECTS)
SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT released_year FROM books;

SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) AS 'Author Fullname' FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT DISTINCT author_fname, author_lname, released_year FROM books;

-- ORDER BY
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname;
-- ASC IS DEFAULT
-- DESC WITH ORDER BY IS DESCENDING 
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname DESC;

-- CAN ORDER BY AMOUNT
SELECT title, pages FROM books ORDER BY pages;

SELECT title, pages FROM books ORDER BY released_year;

-- ORDER BY SHORT-HAND
-- CAN ORDER BY USING THE POSITION NUMBER OF SELECTED RESULT
SELECT book_id, author_fname,author_lname, pages FROM books ORDER BY 4;

-- ORDERS BY TWO VALUES 
-- DEFINED ORDER VALUE & ASC/DESCGOES ONE AT A TIME
SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year;

SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year DESC;

-- AILIASE NAME CAN BE ORDERED BY
SELECT CONCAT(author_fname,' ', author_lname) AS author FROM books ORDER BY author;

-- LIMIT ONLY GETS AMOUNT WANTED
SELECT book_id, title, released_year FROM books LIMIT 5;

SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 5;

SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 3,2;

-- GETS WHAT IT CAN WITH A LIMIT FROM-TO NUMBER SET
SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 17, 32418953;

-- LIKE
SELECT title, author_fname, author_lname FROM books WHERE author_fname='David';

SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE '%da%';

SELECT * FROM books WHERE title LIKE '%:%';

SELECT * FROM books WHERE author_fname LIKE '____';

SELECT * FROM books WHERE author_fname LIKE '%';

-- GET EXACT WITH
SELECT * FROM books WHERE author_fname LIKE '_a_';
-- GET ALL WITH
SELECT * FROM books WHERE author_fname LIKE '%a%';

SELECT * FROM books WHERE author_fname LIKE '%n';

-- ESCAPE WILDCARDS
SELECT * FROM books WHERE title LIKE '%\%%';

SELECT * FROM books WHERE title LIKE '%\_%';

-- REFINEING SELECTIONS EXERCISE
SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT 
    CONCAT(
        UCASE('my favorite author is'), ' ', 
        UCASE(CONCAT(author_fname, ' ', 
        author_lname)), '!'
        ) AS yell 
        FROM books 
        ORDER BY author_lname;

-- COUNT
SELECT COUNT(*) FROM books;

SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT released_year) FROM books;

SELECT title FROM books WHERE title LIKE '%the%';

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY
SELECT author_lname,COUNT(*) FROM books GROUP BY author_lname;

SELECT released_year,COUNT(*) FROM books GROUP BY released_year;

-- MIN AND MAX
SELECT MIN(released_year) FROM books;

SELECT MAX(pages) FROM books;

SELECT MIN(author_lname), MAX(author_lname) FROM books;

SELECT MAX(pages), title FROM books;

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT title, pages FROM books 
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);

SELECT author_fname, author_lname FROM books ORDER BY author_lname;

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) FROM books GROUP BY author;

-- MIN/MAX WITH GROUP BY
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;

SELECT
    author_lname,
    COUNT(*) AS books_written,
    MAX(released_year) AS lastest_release,
    MIN(released_year) AS earliest_release,
    MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;

SELECT
    author_lname,
    author_fname,
    COUNT(*) AS books_written,
    MAX(released_year) AS lastest_release,
    MIN(released_year) AS earliest_release,
    MAX(pages) AS most_pages
FROM books GROUP BY author_lname, author_fname;

-- SUM
SELECT SUM(pages) FROM books;

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*), SUM(released_year) FROM books GROUP BY author_lname;

SELECT SUM(author_lname) FROM books;

-- AVG (AVERAGE)
SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;

-- AGG FUNCITONS EXERCISE
SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, AVG(released_year) AS year FROM books GROUP BY author;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books 
WHERE pages = (SELECT MAX(pages) FROM books);
-- COULD HAVE DONE-v, BUT DID -^
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books 
ORDER BY pages DESC LIMIT 1;

SELECT
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books 
GROUP BY year --  v--- NOT NEEDED
ORDER BY year LIMIT 1,20;

-- CHAR VS. VARCHAR
CREATE TABLE friends (name VARCHAR(10));

INSERT INTO friends (name) VALUES ('tom'), ('juan pablo'), ('james');



CREATE TABLE states (abbr CHAR(2));

INSERT INTO states (abbr) VALUES ('CA'), ('NY');

+----------+----------+----------+-----------+---------+
| Value    | Char(4)  | Storage  | Varchar(4)| Storage |
+----------+----------+----------+-----------+---------+
| ' '      | '    '   | 4 bytes  | ' '       | 1 byte  |
+----------+----------+----------+-----------+---------+
| 'ab'     | 'ab  '   | 4 bytes  | 'ab'      | 3 byte  |
+----------+----------+----------+-----------+---------+
| 'abcd'   | 'abcd'   | 4 bytes  | 'abcd'    | 5 byte  |
+----------+----------+----------+-----------+---------+

-- USE CHAR IF FIXED LENGTH OTHERWISE USE VARCHAR
-- LESS THAN LIMIT WORKS
INSERT INTO states (abbr) VALUES ('x');
-- LIMIT EXCEED WON'T BE ALLOWED
INSERT INTO states (abbr) VALUES ('Ohio');

-- INT, TINYINT, BIGINT
CREATE TABLE parent (children TINYINT);

INSERT INTO parent(children) VALUES (2), (7), (0);
--                 THIS WON'T STORE---v
INSERT INTO parent(children) VALUES (200);
-- NEGITIVES WORK RIGHT NOW
INSERT INTO parent(children) VALUES (-3);

-- MAKES IT SO NO NEGITIVE SIGN CAN BE INSERTED
CREATE TABLE parent (children TINYINT UNSIGNED);
-- NEGITIVES NO LONGER WORKS NOW
INSERT INTO parent(children) VALUES (-3);

-- DECIMAL
INSERT INTO parent(children) VALUES (1.5);

-- ROUNDS THE DECIMAL
INSERT INTO parent(children) VALUES (3), (1.5);
INSERT INTO parent(children) VALUES (90.0008);

-- IF USE DECIMAL(5,2)
-- NUM OF DIGITS--^ ^--DIGITS AFTER DECIMAL
-- 999.99                 ^
-- --- -- "-"= DIGITS     |
--      ^---DECIMAL-------|

CREATE TABLE products (price DECIMAL(5,2));

-- IF 5 DIGITS BUT ONLY ONE DECIMAL IT DOSN'T WORK
INSERT INTO products (price) VALUES (5032.6);

-- IF 5 DIGITS BUT MOST IN DECIMAL
-- IT WILL ROUND UP TO FIT
INSERT INTO products (price) VALUES (5.026);

-- FLOAT LARGER NUBMERS USEING LESS SPACE BUT NOT EXACT

+-----------+-----------------+-------------------+
| Data Type | Memeory Needed  | Precision Issues  |
+-----------+-----------------+-------------------+
| FLOAT     | 4 bytes         | ~7 digits         |
+-----------+-----------------+-------------------+
| DOUBLE    | 8 bytes         | ~15 digits        |
+-----------+-----------------+-------------------+

CREATE TABLE numbers (x FLOAT, y DOUBLE);

INSERT INTO numbers (x,y) VALUES (1.12345678, 1.12345678987654321);

-- DATES AND TIMES
+--------------+-----------+-----------------------+
| DATE         | TIME      | DATETIME              |
+--------------+-----------+-----------------------+
| 'YYYY-MM-DD' | 'HH:MM:SS'| 'YYYY-MM-DD HH:MM:SS' |
+--------------+-----------+-----------------------+

CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- CURDATE, CURTIME, & NOW
-- SHORT HANDS OF CURRENTTIME/DATE & CURRENT_TIMESTAMP
+--------------+-----------+-----------------------+
| CURDATE      | CURTIME   | NOW                   |
+--------------+-----------+-----------------------+
| 'YYYY-MM-DD' | 'HH:MM:SS'| 'YYYY-MM-DD HH:MM:SS' |
+--------------+-----------+-----------------------+

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazle', CURDATE(), CURTIME(), NOW());

-- DATE FUNCTIONS
-- DAY OR DAYOFMONTH
SELECT name, birthdate, DAY(birthdate) FROM people;

SELECT name, birthdate, DAY(birthdate), DAYOFWEEK(birthdate) FROM people;

SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate), MONTH(birthdate), YEAR(birthdate) FROM people;

SELECT birthdate, MONTHNAME(birthdate) FROM people;

SELECT name, birthdt, year(birthdt) FROM people;

SELECT name, birthdt, year(birthdt), MONTHNAME(birthdt) FROM people;

SELECT name, birthtime, HOUR(birthtime) FROM people;

SELECT name, birthtime, MINUTE(birthtime) FROM people;

SELECT name, birthtime, SECOND(birthtime) FROM people;

SELECT birthdt, HOUR(birthdt) FROM people;

SELECT birthdt, DATE(birthdt) FROM people;

SELECT birthdt, DATE(birthdt), TIME(birthdt) FROM people;

-- FORMATING DATES
SELECT CONCAT_WS(' ', MONTHNAME(birthdate), DAY(birthdate), YEAR(birthdate)) AS date FROM people;
-- OR A SHORTER WAY
SELECT birthdate, DATE_FORMAT(birthdate, '%b') AS 'abbr month' FROM people;

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') AS 'abbr date' FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') AS 'abbr time' FROM people;

-- DATE MATH
SELECT birthdate, DATEDIFF(CURDATE(), birthdate) FROM people;

SELECT birthdate, DATEDIFF(CURDATE(), birthdt) FROM people;

SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);

SELECT DATE_ADD(CURDATE(), INTERVAL 12 YEAR);

SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH);

SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

SELECT birthdate, DATE_ADD(birthdate, INTERVAL 18 year) FROM people;

SELECT TIMEDIFF(CURTIME(), '07:00:00');

SELECT NOW() - INTERVAL 18 YEAR;

SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) AS when_adult FROM people;

-- TIMESTAMPS
SELECT TIMESTAMP('2022-11-30 14:50:23');

CREATE TABLE captions (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE captions2 (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO captions2 (text) VALUES ('i love live!');

UPDATE captions2 SET text='i love life!!!!!';

-- DATA TYPE EXERCISE
-- WHAT'S A GOOD USE CASE FOR CHAR?
-- WHEN THE TEXT IS FIXED DATA (THE MAX LENGTH OR 1 LETTER OFF)

CREATE TABLE inventory (
    item_name VARCHAR(50),
    price DECIMAL(8,2)),
    quantitiy SMALLINT
)

-- WHAT'S THE DIFF BETWEEN DATETIME AND TIMESTAMP?
-- TIMESTAMP TAKES HALF AS MUCH SPACE BUT DATETIME CAN GO FROM YEAR 1000-9999

SELECT TIME(NOW()) AS time,
DATE(NOW()) AS date,
DATE_FORMAT(NOW(), '%w') AS num_wday,
DATE_FORMAT(NOW(), '%W') AS wday_name,
DATE_FORMAT(NOW(), '%c/%d/%Y') AS 'Short date & time',
DATE_FORMAT(NOW(), '%M %D at %H:%i') AS 'Long date & time';

SELECT CURTIME() AS time,
CURDATE() AS date,
DAYOFWEEK(CURDATE()) AS num_wday,
DAYNAME(CURDATE()) AS num_wday,
DATE_FORMAT(CURDATE(), '%m/%d/%Y') AS 'Short date & time',
DATE_FORMAT(NOW(), '%M %D at %H:%i') AS 'Long date & time';

-- TWEETS TABLE
CREATE TABLE tweets(
    content VARCHAR(180),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

-- NOT EQUAL
SELECT * FROM books WHERE released_year != 2017;

SELECT title, author_lname FROM books WHERE author_lname = 'Gaiman';
SELECT title, author_lname FROM books WHERE author_lname != 'Gaiman';

-- NOT LIKE
SELECT title FROM books WHERE title NOT LIKE '% %';

SELECT title, author_fname, author_lname FROM books WHERE author_fname NOT LIKE '%da%';

SELECT title FROM books WHERE title NOT LIKE '%a%';

-- GREATER THAN
SELECT * FROM books WHERE released_year > 2005;

SELECT * FROM books WHERE pages > 500;

SELECT 99 > 1;
-- TRUE = 1 FALSE = 0

SELECT title, pages, released_year FROM books;

SELECT title, pages, released_year FROM books WHERE pages > 500;

-- LESS THAN
SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;

SELECT title, pages FROM books WHERE pages < 200;

-- LESS/GRATER THAN OR EQUAL TO
SELECT title, released_year FROM books WHERE released_year >= 2010;

SELECT title, released_year FROM books WHERE released_year <= 1985;

-- AND
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

LEFT AND RIGHT

SELECT title, pages FROM books
WHERE author_lname = 'Eggers' AND
released_year > 2010;

SELECT 3 > 1;
-- 1
SELECT 1 > 0 AND 8 = 7;
-- 0

SELECT CHAR_LENGTH(title) FROM books;

SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;

-- OR
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' OR
released_year > 2010;

SELECT  1 < 5;
-- 1
SELECT  1 < 5 OR 4 = 5;
-- 1
SELECT  1 < 5 AND 4 = 5;
-- 1
SELECT  1 < 0 OR 4 = 5;
-- 0

SELECT title, pages FROM books
WHERE pages < 200
OR title LIKE '%stories%';

-- BETWEEN
SELECT * FROM books
WHERE released_year <= 2015 AND
released_year >= 2004;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, pages FROM books
WHERE pages BETWEEN 200 AND 300;

SELECT title, pages FROM books
WHERE pages NOT BETWEEN 200 AND 300;

-- COMPARING DATES
SELECT * FROM people WHERE birthdate < '2005-01-01';

SELECT * FROM people WHERE YEAR(birthdate) < 2005;

SELECT * FROM people WHERE birthtime > '12:00:00';

SELECT * FROM people WHERE HOUR(birthtime) > 12;

-- CAST
SELECT CAST('9:00:00' AS TIME);

SELECT * FROM people WHERE birthtime BETWEEN '12:00:00' AND '16:00:00';

SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);

SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;

-- IN
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver'
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books
WHERE released_year NOT IN ('2000', '2002', '2004','2006', '2008', '2010', '2012', '2014', '2016');

SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN ('2000', '2002', '2004','2006', '2008', '2010', '2012', '2014', '2016');

-- MODULO = %
SELECT 10 % 4;

SELECT 17 % 6;

SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year % 2 = 1 ORDER BY released_year;

-- DATE CASE (USING TOGETHER)
-- CASE IS SQL IF ALIKE STATMENT
SELECT title, released_year,
    CASE
        WHEN ... 2000 THEN ...
        ELSE ...
    END
FROM books;

SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM books;


SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity  BETWEEN 41 AND 70  THEN '**'
        WHEN stock_quantity  BETWEEN 71 AND 100  THEN '***'
        WHEN stock_quantity  BETWEEN 101 AND 140  THEN '****'
        ELSE '*****'
    END AS STOCK
FROM books;


SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70  THEN '**'
        WHEN stock_quantity <= 100  THEN '***'
        WHEN stock_quantity <= 140  THEN '****'
        ELSE '*****'
    END AS STOCK
FROM books;

-- IS NULL
SELECT * FROM books WHERE author_lname IS NULL;

SELECT * FROM books WHERE author_lname IS NOT NULL;

-- EXERCISE
SELECT 10 != 10;
-- 0
SELECT 15 > 14 AND 99 - 5 <= 94;
-- 1
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10;
-- 1

SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books 
WHERE author_lname = 'Eggers' 
OR author_lname = 'Chabon';

SELECT * FROM books 
WHERE author_lname = 'Lahiri' 
AND released_year > 2000;

SELECT * FROM books 
WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books 
WHERE SUBSTR(author_lname,1,1) = 'C' 
OR SUBSTR(author_lname,1,1) = 'S';

SELECT title, author_lname FROM books 
WHERE author_lname,1,1 LIKE 'C%' 
OR  author_lname,1,1 LIKE 'S%' 
-- COULD BE: SUBSTR(author_lname,1,1) IN ('C', 'S');

SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

SELECT author_fname, author_lname, 
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
WHERE author_lname IS NOT NULL
GROUP BY author_lname, author_fname;

-- UNIQUE CONSTRAINTS
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

INSERT INTO contacts (name, phone)
VALUES ('billybob', '9781213455');

-- CHECK CONSTRAINTS
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

CREATE TABLE palindromes (
    word VARCHAR(100) CHECK(REVERSE(word) = word)
);

-- NAMED CONSTRAINTS
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

CREATE TABLE palindromes2 (
    word VARCHAR(100),
    CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

-- MULTIPLE COLUMN CONSTRAINTES
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);

CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

-- ALTER TABLE
ALTER TABLE companies
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- DROP COLUMN
ALTER TABLE companies DROP COLUMN phone;

ALTER TABLE companies DROP COLUMN employee_count;

-- RENAME TABLE
RENAME TABLE companies TO suppliers;

ALTER TABLE suppliers RENAME TO companies;

-- RENAMING COLUMNS
ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- MODIFY COLUMNS
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

ALTER TABLE companies
CHANGE company_name VARCHAR(100) DEFAULT 'unknown';

-- ALTER TABLE CONSTRAINT
ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;

-- RELATIONSHIPS AND JOINS
CREATE TABLE customers (
    customers_fname VARCHAR(50) NOT NULL,
    customers_fname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    order_date DATE,
    order_price DECIMAL
)

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT id FçROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

SELECT * FROM customers, orders WHERE orders.customer_id = customers.id;
-- work the same --v-^
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders
    ON customers.id = orders.customer_id;

SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;

UPDATE orders, customers SET order_date=NULL, amount=NULL WHERE first_name='David' && last_name='Bowie';

SELECT first_name, last_name, SUM(amount) AS total FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total;

-- LEFT JOIN
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT first_name, last_name, order_date, amount FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;

SELECT order_date, amount, first_name, last_name FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;

SELECT first_name, last_name, SUM(amount) AS money_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

-- RIGHT JOIN
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

DELETE FROM customers WHERE last_name = 'George';

DROP TABLE orders, customers;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

-- JOINS EXERCISE
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade FROM students
JOIN papers ON papers.student_id = students.id
ORDER BY grade DESC;

SELECT first_name, title, grade FROM students
LEFT JOIN papers ON papers.student_id = students.id

SELECT 
    first_name,
    IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade FROM students
LEFT JOIN papers ON papers.student_id = students.id;

SELECT first_name, IFNULL(AVG(grade), '0') AS average FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade), '0') AS average,
    CASE
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;

-- MANY:MANY RELATIONSHIP
-- SELF NOTE: "MTO" COULD BE USED FOR "MORE THAN ONE" E.G. MTO_SERIES
CREATE DATABASE tv_db;
USE tv_db;

CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id) REFERENCES series(id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

-- TV SERIES CHALLENGE #1
SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id;

-- TV SERIES CHALLENGE #2
SELECT title, ROUND(AVG(rating), 2) AS avg_rating FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- TV SERIES CHALLENGE #3
SELECT first_name, last_name, rating FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id;

-- TV SERIES CHALLENGE #4
-- LEFT JOIN
SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;

-- RIGHT JOIN
SELECT title AS unreviewed_series
FROM reviews
RIGHT JOIN series ON series.id = reviews.series_id
WHERE rating IS NULL;

-- TV SERIES CHALLENGE #5
SELECT genre, ROUND(AVG(rating), 2) AS avg_rating FROM series
JOIN reviews ON reviews.series_id = series.id
GROUP BY genre;

-- TV SERIES CHALLENGE #6
SELECT * FROM reviews;

SELECT first_name, last_name, COUNT(reviews.reviewer_id = reviewers.id) AS COUNT, AS MIN, AS MAX, AVG(rating) AS AVG, AS 'STATUS'
FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id;

SELECT first_name, last_name, COUNT(reviews.reviewer_id = reviewers.id) AS COUNT FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name, last_name;

SELECT first_name, last_name, COUNT(reviews.reviewer_id = reviewers.id) AS COUNT, ROUND(MAX(rating), 1) AS MAX FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name, last_name;

SELECT first_name, last_name, COUNT(reviews.reviewer_id = reviewers.id) AS COUNT, ROUND(MIN(rating), 1) AS MIN, ROUND(MAX(rating), 1) AS MAX, AVG(rating) AS AVG FROM reviewers
LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name, last_name;

-- CASE STATMENT ALLOWS ANY AMOUND OF OPTIONS
SELECT 
    first_name, 
    last_name, 
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0),2) AS AVG,
    CASE
        WHEN COUNT(rating) >= 10 THEN "POWERUSER"
        WHEN COUNT(rating) > 0 THEN "ACTIVE"
        ELSE "INACTIVE"
    END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name, last_name;

-- IF STATMENT ONLY 2 OPTIONS
SELECT 
    first_name, 
    last_name, 
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0),2) AS AVG,
    IF(COUNT(rating) > 0, 'ACTIVE', 'INACTIVE') AS status
FROM reviewers
LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name, last_name;

-- TV SERIES CHALLENGE #7

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviews.reviewer_id = reviewers.id
ORDER BY title;

-- VIEWS
SELECT title,released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

CREATE VIEW full_reviews AS
SELECT title,released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT genre, AVG(rating) FROM full_reviews GROUP BY genre;

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

INSERT INTO ordered_series (title, released_year, genre)
    VALUES ('The Great', 2020, 'Comedy');

DELETE FROM ordered_series WHERE title = 'The Great';

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

DROP VIEW ordered_series;

-- HAVING
SELECT title, AVG(rating) FROM full_reviews GROUP BY title;

SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count 
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;

-- WITH ROLLUP
SELECT * FROM full_reviews;

SELECT 
    title, 
    AVG(rating) 
FROM full_reviews 
GROUP BY title WITH ROLLUP;

SELECT 
    title, 
    COUNT(rating)
FROM full_reviews 
GROUP BY title WITH ROLLUP;

SELECT first_name, released_year, genre, AVG(rating)
FROM full_reviews 
GROUP BY released_year, genre, first_name WITH ROLLUP;

-- SQL MODES
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = @@GLOBAL.sql_mode;

SELECT title, rating FROM series
JOIN reviews ON reviews.series_id = series.id
GROUP BY title;

-- SECTIONS 16-17

-- WINDOWS FUNCTIONS
-- OVER
CREATE DATABASE window_funcs;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);


SELECT department, AVG(salary) FROM employees
    GROUP BY department;

SELECT AVG(salary) FROM employees;

-- WINDOW FUNCTIONS: RUNS CODE WITH EACH ROW
SELECT AVG(salary) OVER() FROM employees;

SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

-- WORKS BECAUSE OVER
SELECT 
    emp_no, 
    department, salary,
    MIN(salary) OVER(),
    MAX(salary) OVER() 
FROM employees;

-- WORKS AS ABOVE
SELECT 
    MIN(salary),
    MAX(salary) 
FROM employees;

-- DON'T WORK BECAUSE GROUP BY
SELECT 
    emp_no, 
    department, salary,
    MIN(salary),
    MAX(salary) 
FROM employees;

-- PARTITION BY
SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
FROM employees;

SELECT department, AVG(salary) FROM employees GROUP BY department;

SELECT 
    emp_no, 
    department, 
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

SELECT emp_no, department, salary, COUNT(*) OVER(PARTITION BY department) AS dept_count
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

-- ORDER BY (WITH OVER)
-- DIVIDES UP ALL THE ROWS
SELECT 
    emp_no, 
    department, 
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees ORDER BY department;

-- DENSE_RANK, & ROW_NUMBER()
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) AS overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS overall_num
FROM employees ORDER BY overall_rank;

-- NTILE(N)
SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- FIRST_VALUE
SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) AS highest_paid_overall
FROM employees;

-- LEAD AND LAG
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LEAD(salary) OVER(ORDER BY salary DESC) AS salary_diff
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_diff
FROM employees;

-- SCHEMA DESIGN
CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (username) VALUES
('BlueTheCat'),
('CharlieBrown'),
('UnrealVoice')

CREATE TABLE likes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (username) REFERENCES users(username)
)

CREATE TABLE photos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (poster_id) REFERENCES users(id),
    FOREIGN KEY (username) REFERENCES users(username)
)

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (username) REFERENCES users(username)
)

CREATE TABLE hashtags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY (username) REFERENCES users(username)
)
