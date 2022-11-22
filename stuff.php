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
