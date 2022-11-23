<!-- CREATES A TABLE CALLED PEOPLE -->
CREATE TABLE people(first_name VARCHAR(50), last_name VARCHAR(50), age INT);

<!-- ADDS FIRST PERSON TO PEOPLE -->
INSERT INTO people(first_name, last_name, age)
VALUES('Tina' ,'Belcher', 13);

<!-- ADDS SECOND PERSON TO PEOPLE -->
INSERT INTO people(first_name, last_name, age)
VALUES('Bob', 'Belcher', 42);

<!-- ADDS THREE PEOPLE TO PEOPLE -->
INSERT INTO people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45),
	  ('Phillip','Frond', 38),
      ('Calvin','Fischoeder', 70);

<!-- DELETES PEOPLE TABLE & ALL INSIDE -->
DROP TABLE people;

<!-- DON'T ALLOW EMPTY INPUTS -->
CREATE TABLE cats2 (name VARCHAR(50) NOT NULL, age INT NOT NULL);

<!-- CREATES TABLE CALLED SHOPS & ADDS SHOE EMPORIUM TO IT -->
CREATE TABLE shops (name VARCHAR(100));
INSERT INTO shops(name) VALUES('shoe emporium');

<!-- BRAKES OUT OF QUOTES, ALLOWING THEM IN STRING -->
INSERT INTO shops(name) VALUES('mario\'s pizza');

<!-- DON'T ALLOW NULL/EMPTY INPUTS & INPUTS DEFAULTS IF BLANK -->
CREATE TABLE cats4 ( name VARCHAR(100) NOT NULL DEFAULT 'mystery', age INT NOT NULL DEFAULT 99);

<!-- DON'T ALLOW NULL/EMPTY INPUTS -->
CREATE TABLE unique_cats (cat_id INT NOT NULL PRIMARY KEY, name VARCHAR(100), age INT):



<!-- ADDS BINGO TO UNIQUE_CATS -->
INSERT INTO unique_cats(cat_id, name, age)
VALUES(1, 'bingo', 2);

<!-- GIVES ERROR FOR SAME ID NUMBER -->
INSERT INTO unique_cats(cat_id, name, age)
VALUES(1, 'bongo', 3);

<!-- MANUALY CHANGE ID NUMBER -->
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'bongo', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES(3, 'bongo', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES(999, 'bongo', 3);

<!-- MORE READABLE DECLARATION OF PRIMARY KEY -->
<!-- NOT NULL IS REDUNDANT. PRIMARY KEYS CANNOT BE NULL -->
CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

<!-- NOT NULL NOT DECLARED, PRIMARY DECLARED -->
CREATE TABLE unique_cats (cat_id INT, name VARCHAR(100), age INT, PRIMARY KEY(cat_id));

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Oingo', 3);

INSERT INTO unique_cats(name, age) VALUES('Oingo', 3);

<!-- PRIMARY DECLARED & AUTO INCREMENT MAKING IT PASS CAT_ID AUTOMATICLY -->
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

<!-- PUT PRIMARY DECLARED & AUTO INCREMENT ON SAME LINE -->
CREATE TABLE unique_cats4 (
    cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);


<!-- EXERCISE (BASICLY ADDING EVERYTHING SO FAR INTO ONE TABLE) -->
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

<!-- CRUD (START WITH CLEAN SLATE & DELETE EVERYTHING SO FAR) -->
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


<!-- USE THE WHERE FUNCTION WITH SELECT -->
SELECT * FROM cats WHERE age = 4;
SELECT name, age FROM cats WHERE age=4;
SELECT name FROM cats WHERE age=4;

<!-- NON-CASE SENSITIVE -->
SELECT * FROM cats WHERE name='Egg';

<!-- WORKS JUST THE SAME AS ONE ABOVE -->
SELECT * FROM cats WHERE name='eGG';

<!-- RAPID FIRE EXERCISE (WRIGHT THE CODE USED) -->
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;

<!-- ALIASES (ALT NAME FOR TABLE COLUMN) -->
SELECT cat_id AS id, name FROM cats;

<!-- UPDATE COLUMNS -->
<!-- UPDATES ALL IN TABLE COLUMN TO NEW VALUE/S -->
UPDATE employees SET last_name='roosterbeard';
UPDATE employees SET current_status='laid-off', last-name='who cares';

<!-- BASIC TEMPLATE/PATERN FOR UPDATE -->
UPDATE table SET col=val, another_col=val WHERE col=val;

<!-- SELECT BEFORE YOU UPDATE OR DELETE!!!!!! -->
SELECT * FROM cats WHERE name='Misty';

<!-- UPDATE EXERCISE -->
SELECT * FROM cats WHERE name='Jackson';
UPDATE cats SET name='Jack' WHERE name='Jackson';

SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';

SELECT * FROM cats WHERE breed='Main Coon';
UPDATE cats SET age=12 WHERE breed='Main Coon';

<!-- DELETE FUNCTION -->
<!-- DELETE FUNCTION NEEDS WHERE SO YOU DELETE ONLY WHAT WANTED -->
<!-- IF WHERE IS GONE THEN EVERY THING GETS DELETED -->
DELETE FROM cats WHERE name='Egg';

<!-- FYI USE DATABASE TABLE WANTED IS IN FIRST -->
USE pet_shop;

<!-- EXAMPLE FOR DELETE WITHOUT WHERE CLAUSE -->
SELECT * FROM employees;
DELETE FROM employees;
DESC employees;

<!-- DELETE EXERCISE -->
SELECT * FROM cats;
DELETE FROM cats WHERE age=4;

SELECT * FROM cats;
DELETE FROM cats WHERE age=cat_id;

SELECT * FROM cats;
DELETE FROM cats;

SELECT * FROM cats;

<!-- CRUD CHALLANGE -->
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

<!-- CONCAT -->
SELECT CONCAT(author_fname, '!!!') FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS Author_name FROM books;

<!-- CONCAT_WS -->

SELECT CONCAT_WS('!','hi','bye','lol');
SELECT CONCAT_WS('-', title, author_fname, author_lname) AS Author_name_and_Title FROM books;
SELECT
    CONCAT_WS('-', title, author_fname, author_lname)
    FROM books;

<!-- SUBSTRING -->
SELECT SUBSTRING('Hello World', 1, 4);
<!-- RESOLTES ARE "HELL" -->

SELECT SUBSTRING('Hello World', 2, 5);
<!-- RESOLTES ARE "ELLO" -->

SELECT SUBSTRING('Hello World', 7);
<!-- RESOLTES ARE "WORLD" -->

SELECT SUBSTRING('Hello World', -3);
<!-- RESOLTES ARE "RLD" (GOES BACKWORDS) -->

<!-- SUBSTR() === SUBSTRING() -->
<!-- FIRST LETTER OF LAST NAME -->
SELECT SUBSTR(author_lname, 1, 1) AS initial, author_lname FROM books;
SELECT SUBSTR(title, 1, 10) FROM books;

<!-- REPLACE -->
SELECT REPLACE('Hello World', 'Hell', '%$#@')

SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REPLACE(title, ' ', '-') FROM books;

<!-- REVERSE -->
SELECT REVERSE(NULL);

SELECT REVERSE('chicken nuggets');

<!-- MAKE NAMES WORK LIKE RACECAR (SAME FORWARDS AND BACK) -->

SELECT
  CONCAT(author_fname, REVERSE(author_fname))
FROM
  books;

<!-- CHAR_LENGTH -->
SELECT CHAR_LENGTH("Hey!");

<!-- BIT LENGHT SOMETIMES THE SAME AS CHAR_LENGTH-->
SELECT LENGTH("Hey!");

SELECT CHAR_LENGTH(title) AS len, title FROM books;
