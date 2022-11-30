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
UPDATE employees SET current_status='laid-off', last-name='who cares';

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

SELECT SUBSTR(title,1,15) AS 'first' FROM books WHERE SUBSTR(title,1,1) = 'A' && CHAR_LENGTH(title) = 41;
SELECT SUBSTR(title,4,18) AS 'second' FROM books WHERE SUBSTR(title,1,1) = 'T' && CHAR_LENGTH(title) = 41;
SELECT SUBSTR(title,10,5) AS 'third' FROM books WHERE SUBSTR(title,1,1) = 'O' && CHAR_LENGTH(title) = 17;
SELECT SUBSTR(title,7,1) AS 'forth' FROM books WHERE SUBSTR(title,1,1) = 'C' && CHAR_LENGTH(title) = 11;
SELECT SUBSTR(title,13,6) AS 'fifth' FROM books WHERE SUBSTR(title,1,1) = 'W' && CHAR_LENGTH(title) = 51;
SELECT CONCAT_WS(' ', first, second);

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
-- SHORT HANDS OF CURRENTTIME/DATE & CURRENTTIMESTAMP
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