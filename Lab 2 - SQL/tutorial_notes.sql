# https://dev.mysql.com/doc/refman/8.0/en/tutorial.html
# Chapter 3 Tutorial

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

# extract birth month
	SELECT name, birth, MONTH(birth) FROM pet;