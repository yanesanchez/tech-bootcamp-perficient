# MySQL 8.0
# Chapter 3 Tutorial
# https://dev.mysql.com/doc/refman/8.0/en/tutorial.html

# A Relational Database Overview: https://docs.oracle.com/javase/tutorial/jdbc/overview/database.html

/* ----------------------------------------------------------- */
# * 3.2 Entering Queries *
# keywords are NOT case-sensitive
	SELECT VERSION(), CURRENT_DATE;
	select version(), current_date;

# mysql can be used as a simple calculator
	SELECT SIN(PI()/4), (4+1)*5;

# can have multiple statements in one line seperated by semicolons
	SELECT VERSION(); SELECT NOW();

# lines are not executed until met with semicolon
	SELECT
	USER()
	,
	CURRENT_DATE;

# to cancel query when in the process of typing it, use \c
	SELECT USER() \c

/* COMMAND PROMPTS - provide valuable feedback
+-----------+---------------------------------------------------+
| Prompt 	| Meaning											|
+===========+===================================================+
| mysql>	| Ready for new query								|
+-----------+---------------------------------------------------+
| ->		| Waiting for next line of multiple-line query		|
+-----------+---------------------------------------------------+
| '>		| Waiting for next line, waiting for completion	of	|
|			| a string that began with a single quote (')		|
+-----------+---------------------------------------------------+
| ">		| Waiting for next line, waiting for completion of	|
|			| a string that began with a double quote (")		|
+-----------+---------------------------------------------------+
| `>		| Waiting for next line, waiting for completion of	|
|			| an identifier that began with a backtick (`)		|
+-----------+---------------------------------------------------+
| /*>		| Waiting for next line, waiting for completion of	|
|			| a comment that began with /*						|
+-----------+---------------------------------------------------+
NOTE: before canceling a query mid-string, close the string then \c
*/


/* =========================================================== */
# * 3.3 Creating and Using a Database *
# see what databases currently exist on the server
	SHOW DATABASES;

# administrators can grant permission with
GRANT ALL ON menagerie.* TO 'your_mysql_name'@'your_client_host';

/* ----------------------------------------------------------- */
# * 3.3.1 Creating and Using a Database *
# under Unix, database names ARE case-sensitive (unlike SQL keywords)
# create new database (NOTE: creating database does not select it)
	CREATE DATABASE menagerie;

# select database explicity every time you use it/begin a mysql session
	USE menagerie;

/* you can also select the database when invoking mysql on command line:
mysql -h host -u user -p menagerie
*/

# see which database is currently selected at any time
	SELECT DATABASE();


/* ----------------------------------------------------------- */
## * 3.3.2 Creating a Table *
# display tables in current database
	SHOW TABLES;

# create a new table in menagerie
	CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

# display structure (fields and data types) of the table
	DESCRIBE pet;


/* ----------------------------------------------------------- */
## * 3.3.3 Loading Data into a Table *
/* 
since we're starting with an empty table, an easy way to populate it 
is to create a text file containing a row for each animal, 
then load the file contents into the table with a single statement

create a new text file containing one record per line, with 
values separated by tabs, and given in the order in which the columns 
were listed in 'create <table>' or are listed in 'describe <table>'

missing or unknown values can contain NULL values. 
represent NULL in text files with \N (backslash, capital-N)
*/

# load text file into pet table
	LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet;

# some files created on Windows use a different line terminator
	LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet
       LINES TERMINATED BY '\r\n';

# some files on created macOS might use
	LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet
       LINES TERMINATED BY '\r';

/* you can specify the column value separator and end of line marker 
explicitly in the LOAD DATA statement if you wish, 
but the defaults are tab and linefeed. */

# to enable local file loading on server side
	SET GLOBAL local_infile=1;

# !!!!!!!!!!!!!!!! ask about this bc literally impossible 

# to add new records one at a time
	INSERT INTO pet
       VALUES ('Puffball','Diane','hamster','f','1999-03-30', NULL);

# how I populated table
	INSERT INTO pet VALUES 
		('Fluffy', 'Harold', 'cat', 'f', '1993-02-04', NULL),
		('Claws', 'Gwen', 'cat', 'm', '1994-03-17', NULL),
		('Buffy', 'Harold', 'dog', 'f', '1989-05-13', NULL),
		('Fang', 'Benny', 'dog', 'm', '1990-08-27', NULL),
		('Bowser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29'),
		('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL),
		('Whistler', 'Gwen', 'bird', NULL, '1997-12-09', NULL),
		('Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL),
		('Puffball','Diane','hamster','f','1999-03-30', NULL);


/* ----------------------------------------------------------- */
## * 3.3.4 Retrieving Information from a Table *
# retrieve information from a table (WHERE clause is optional)
	SELECT what_to_select
	FROM which_table
	WHERE conditions_to_satisfy;


### ** 3.3.4.1 Selecting All Data **
# simplest form, retrieve everything
	SELECT * FROM pet;
# fix record with an error
	UPDATE pet SET birth = '1989-08-31' WHERE name = 'Bowser';


### ** 3.3.4.2 Selecting Particular Rows **
# verify previous change
	SELECT * FROM pet WHERE name = 'Bowser';
# NOTE: string comparisons are case-insensitive

# retrieve pets born during or after 1998
	SELECT * FROM pet WHERE birth >= '1998-1-1';

# conditions with logical operators...
	# AND: retrieve pets that are both dogs AND females
	SELECT * FROM pet WHERE species = 'dog' AND sex = 'f';

	# OR: retrieve pets that are either snakes OR birds
	SELECT * FROM pet WHERE species = 'snake' OR species = 'bird';

	# AND & OR: good practice to explicitly group conditions with parenthesis
	SELECT * FROM pet WHERE (species = 'cat' AND sex = 'm')
       OR (species = 'dog' AND sex = 'f');
# NOTE: 'AND' has higher precedence than 'OR'


### ** 3.3.4.3 Selecting Particular Columns **
# see when your animals were born
	SELECT name, birth FROM pet;

# see who owns pets
	SELECT owner FROM pet;
# NOTE: this query selects owner of each pet, but some owners are repeated

# see unique owners of pets, regardless of how many pets they own
	SELECT DISTINCT owner FROM pet;

# combine row selection with column selection
	SELECT name, species, birth FROM pet
       WHERE species = 'dog' OR species = 'cat';


### ** 3.3.4.4 Sorting Rows **
# use the ORDER BY clause to examine output in a meaningful way
# NOTE: character type sorting is case-insensitive
# case-sensitive sorting can be forced with 'ORDER BY BINARY <col_name>'

# NOTE: default sort order is ascending, with smallest values first
# animal birthdays, sorted by date
	SELECT name, birth FROM pet ORDER BY birth;

# animal birthdays, sorted by date, descending
	SELECT name, birth FROM pet ORDER BY birth DESC;

# you can sort on multiple columns, and sort different columns in different directions
# sort species in ascending order, then by birth date within species in decsending order (youngest first)
# NOTE: 'DESC' keyword only applied to the column name immediately preceding it (birth); it doesn't affect the species column order
	SELECT name, species, birth FROM pet
       ORDER BY species, birth DESC;


### ** 3.3.4.5 Date Calculations **
# calculate difference to find age of pets
	SELECT name, birth, CURDATE(), 
		TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS age
		FROM pet;

# order rows by name to scan results more easily
	SELECT name, birth, CURDATE(), 
			TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS age
			FROM pet ORDER BY name;

# order by some other field, such as age
	SELECT name, birth, CURDATE(),
		TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS age 
		FROM pet ORDER BY age;

# determine age for pets that have passed away
	SELECT name, birth, death,
		TIMESTAMPDIFF(YEAR, birth, death) AS age 
		FROM pet WHERE death IS NOT NULL ORDER BY age;

# other functions for extracting parts of dates:
	YEAR()
	MONTH()
	DAYOFMONTH()
	MONTH()
	DATE_ADD()	# <- allows you to add time interval to given date

# extract birth month
	SELECT name, birth, MONTH(birth) FROM pet;
# search for specific birth month
	SELECT name, birth FROM pet WHERE MONTH(birth) = 5;
# search for birthdays in the next month; handle December end case
	SELECT name, birth FROM pet
       WHERE MONTH(birth) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH));
	SELECT name, birth FROM pet
       WHERE MONTH(birth) = MOD(MONTH(CURDATE()), 12) + 1;
# calculate next day
	SELECT '2018-10-31' + INTERVAL 1 DAY;


### ** 3.3.4.6 Working with NULL Values **
# NULL = "a missing unknown value"
# test for NULL by using 'IS NULL' or 'IS NOT NULL'
	SELECT 1 IS NULL, 1 IS NOT NULL;

# cannot perform arithmetic on NULL
# NOTE: '<>' means !=
	SELECT 1 = NULL, 1 <> NULL, 1 < NULL, 1 > NULL;

# NOTE: two NULL values are regarded as equal in a GROUP BY

# it is possible to insert a 0 or empty string into a column defined as NOT NULL
	SELECT 0 IS NULL, 0 IS NOT NULL, '' IS NULL, '' IS NOT NULL;


### ** 3.3.4.7 Pattern Matching **
# MySQL provides SQL pattern matching and regex-based pattern matching
/* SQL pattern matching lets you use
	_ to match any single character and 
	% to match 0 or more characters
*/
## SQL PATTERNS
# do NOT use = or <> when using SQL patterns
# use LIKE or NOT LIKE comparison operators

# find names starting with a 'b'
	SELECT * FROM pet WHERE name LIKE 'b%';

# find names ending with 'fy'
	SELECT * FROM pet WHERE name LIKE '%fy';

# find names containing a 'w'
	SELECT * FROM pet WHERE name LIKE '%w%';

# find names with exactly five characters
	SELECT * FROM pet WHERE name LIKE '_____';

## EXTENDED REGULAR EXPRESSIONS
# use REGEXP_LIKE() function, or the REGEXP or RLIKE operators
/* 
	.	matches any single character.
[...]	character class, matches any character within the brackets
[a-z]	range of characters, matches any letter. [0-9] matches any digit
	*	matches zero or more instances of the thing preceding it
   .*	matches any number of anything
    ^	anchor, must match the beginning
    $	anchor, must match the end

NOTE: 
	a regex pattern match succeeds if the pattern matches ANYWHERE in the value being tested.
	a LIKE pattern match succeeds ONLY if it matches the entire value.
*/

# rewriting the above four LIKE queries with REGEXP_LIKE()
# find names starting with a 'b'
	SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b');

	/* to force a regular expression to be case-sensitive, 
	use a case-sensitive collation 'utf8mb4_0900_as_cs' (did not work) OR 
	use the BINARY keyword to make it a binary string (also did not work) OR
	specify the 'c' match control character (actually did work) */
	# match only lowercase 'b' at the beginning of a name
	SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b' COLLATE utf8mb4_0900_as_cs);
	SELECT * FROM pet WHERE REGEXP_LIKE(name, BINARY '^b');
	SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b', 'c');

# find names ending with 'fy'
	SELECT * FROM pet WHERE REGEXP_LIKE(name, 'fy$');

# find names containing a 'w'
	SELECT * FROM pet WHERE REGEXP_LIKE(name, 'w');
# NOTE: no need to put a wildcard on either side since regex will match the entire value with a match

# find names with exactly five characters
	SELECT * FROM pet WHERE REGEXP_LIKE(name, '^.....$');
	# alternatively, use the {n} ("repeat n times") operator
	SELECT * FROM pet WHERE REGEXP_LIKE(name, '^.{5}$');

# more regex infor here: https://dev.mysql.com/doc/refman/8.0/en/regexp.html


### ** 3.3.4.8 Counting Rows **
# helps answer the question "how often does a certain type of data occur in a table?"
# count pets in table
	SELECT COUNT(*) FROM pet;

# count how many pets each owner has
	# using GROUP BY will group all records to each owner
	SELECT owner, COUNT(*) FROM pet GROUP BY owner;
# NOTE: the use of COUNT(*) in conjunction with GROUP BY characterizes data under various groupings.

# number of animals per species
	SELECT species, COUNT(*) FROM pet GROUP BY species;

# number of animals per sex
	SELECT species, sex, COUNT(*) FROM pet GROUP BY species, sex;

# number of cats and dogs by sex
	SELECT species, sex, COUNT(*) FROM pet
	WHERE species = 'dog' OR species = 'cat'
	GROUP BY species, sex;

# number of animals per sex only for animals whose sex is known
	SELECT species, sex, COUNT(*) FROM pet
	WHERE sex IS NOT NULL
	GROUP BY species, sex;

/* more info on GROUP BY and aggregate functions
https://dev.mysql.com/doc/refman/8.0/en/group-by-handling.html
https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html
*/


### ** 3.3.4.9 Using More Than One Table **
# say you want a table about pet's life events
	CREATE TABLE event (
		name VARCHAR(20),
		date DATE,
		type VARCHAR(15),
		remark VARCHAR(255)
	);

# load text file into new table... (still can't figure out how to get that to work)
	LOAD DATA LOCAL INFILE 'event.txt' INTO TABLE event;

# or, with an INSERT
	INSERT INTO event VALUES
		('Fluffy', '1995-05-15', 'litter', '4 kittens, 3 female, 1 male'),
		('Buffy', '1993-06-23', 'litter', '5 puppies, 2 female, 3 male'),
		('Buffy', '1994-06-19', 'litter', '3 puppies, 3 female'),
		('Chirpy', '1999-03-21', 'vet', 'needed beak straightened'),
		('Slim', '1997-08-03', 'vet', 'broken rib'),
		('Bowser', '1991-10-12', 'kennel', NULL),
		('Fang', '1991-10-12', 'kennel', NULL),
		('Fang', '1998-08-28', 'birthday', 'Gave him a new chew toy'),
		('Claws', '1998-03-17', 'birthday', 'Gave him a new flea collar'),
		('Whistler', '1998-12-09', 'birthday', 'First birthday');

# suppose you want to find out at what age each pet had its litter
/* 	the event table has the date when each litter occured, 
 but the birth date of each mother is in the pet table.
 the query to find the mother's age requires both tables */
 # JOIN pet and event tables
 	SELECT pet.name, TIMESTAMPDIFF(YEAR, birth, date) AS age, remark
 	FROM pet INNER JOIN event
 	ON pet.name = event.name
 	WHERE event.type = 'litter';
/* NOTE: when joining info from two tables, you must specify how records in one table
can be matched to records in the other. the ON clause will match up records in the two tables
based on the name values, as specified. 

an INNER JOIN permits rows from either table to appear in the result
IF AND ONLY IF both tables meet the conditions specified by the ON clause.
if a name appears in one table but not the other, the row does not appear in the result */

# you can also join a table to itself, like to compare records in a table to other records in the same table
# to find breeding pairs among pets, join pet table with itself to produce candidates of pairs of live males and females of like species
	SELECT p1.name, p1.sex, p2.name, p2.sex, p1.species
	FROM pet AS p1 INNER JOIN pet AS p2
	ON p1.species = p2.species
	AND p1.sex = 'f' AND p1.death IS NULL
	AND p2.sex = 'm' AND p2.death IS NULL;


/* =========================================================== */
# * 3.4 Getting Information About Databases and Tables *
# list databases managed by the server
	SHOW DATABASES;

# find which database is currently selected:
	SELECT DATABASE();
	# if none is currently selected, result will be NULL
	# select which database to use with USE <DATABASE_NAME>;

# find out what tables the current database has
	SHOW TABLES;

# find out about the structure of a table, with info about each column
	DESCRIBE pet;


/* =========================================================== */
# * 3.5 Using mysql in Batch Mode *
# instead of entering each statement into mysql, you can put statements to run in a file
# tell mysql to read input from a file
	$> mysql < batch-file

# if running mysql on Windows and have special characters in the file that may cause problems, you can do this
	C:\> mysql -e "source batch-file"

# if you need to specify connection parameters on the command line
	$> mysql -h host -u user -p < batch-file

# if you want the script (file) to continue even if some statements produce errors, use --force

# if a query produces a lot of output, you can run it through a pager instead of watching it scroll off the top of your screen
	$> mysql < batch-file | more

# you can catch the output in a file for further processing
	$> mysql < batch-file > mysql.out

/* some situations do not allow for interactive use (command line, one statement at a time)
 for example, when running a query from a CRON job - you must use batch mode

/* the output format is different and more concise when running mysql in batch mode; the output of
	'SELECT DISTINCT species FROM pet' when in batch mode:
	species
	bird
	cat
	dog
	hamster
	snake
versus the output when running it in interactive mode:
	+---------+
	| species |
	+---------+
	| bird    |
	| cat     |
	| dog     |
	| hamster |
	| snake   |
	+---------+

to get interactive output format in batch mode, use 'mysql -t'

to echo the statements that are executed, use 'mysql -v'

you can also use scripts from the mysql prompt by using the 'source' command or '\' command
	mysql> source filename;
	mysql> \. filename
*/
# more info at: https://dev.mysql.com/doc/refman/8.0/en/mysql-batch-commands.html


/* =========================================================== */
# * 3.6 Examples of Common Queries *
/*
see: https://dev.mysql.com/doc/refman/8.0/en/examples.html

3.6.1 The Maximum Value for a Column
3.6.2 The Row Holding the Maximum of a Certain Column
3.6.3 Maximum of Column per Group
3.6.4 The Rows Holding the Group-wise Maximum of a Certain Column
3.6.5 Using User-Defined Variables
3.6.6 Using Foreign Keys
3.6.7 Searching on Two Keys
3.6.8 Calculating Visits Per Day
3.6.9 Using AUTO_INCREMENT
*/


/* =========================================================== */
# * 3.7 Using MySQL with Apache *
# https://dev.mysql.com/doc/refman/8.0/en/apache.html