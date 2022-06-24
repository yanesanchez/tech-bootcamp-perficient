CREATE DATABASE library;

USE library;

CREATE TABLE book(
	isbn VARCHAR(13),
    title VARCHAR(64),
    author_first VARCHAR(64),
    author_last VARCHAR(64),
    PRIMARY KEY(isbn));


INSERT INTO book VALUES
    ("9780133943030", "Software Engineering", "Ian", "Sommerville"),
    ("9781508673873", "A Smarter Way to Learn HTML and CSS", "Mark", "Myers"),
    ("9781497408180", "A Smarter Way to Learn JavaScript", "Mark", "Myers"),
    ("9780132830317", "Absolute Java", "Walter", "Savitch"),
    ("9780131489066", "Applying UML and Patterns", "Craig", "Larman");

/* Dewey Decimal Classification
    Summaries: ###
    X## -> X = First Summary (Main Classes)
    #X# -> X = Second Summary (Hundred Division)
    ##X -> X = Third Summary (Thousand Sections)
*/

CREATE TABLE ddc_main_class(
    num INT,
    heading VARCHAR(64),
    PRIMARY KEY(num)
);

CREATE TABLE ddc_hundred_division(
    num INT,
    heading VARCHAR(64),
    PRIMARY KEY(num)
);

CREATE TABLE ddc_thousand_section(
    num INT,
    heading VARCHAR(64),
    PRIMARY KEY(num)
);

DROP TABLE ddc_main_class;
DROP TABLE ddc_hundred_division;
DROP TABLE ddc_thousand_section;

CREATE TABLE book_classification(
    isbn VARCHAR(13),
    main_class INT,
    division INT,
    section INT,
    FOREIGN KEY (isbn) REFERENCES book(isbn),
    FOREIGN KEY (main_class) REFERENCES ddc_main_class(num) ON UPDATE CASCADE,
    FOREIGN KEY (division) REFERENCES ddc_hundred_division(num) ON UPDATE CASCADE,
    FOREIGN KEY (section) REFERENCES ddc_thousand_section(num) ON UPDATE CASCADE
);

INSERT INTO ddc_main_class VALUES 
    (000, "Computer Science, Information & General Works"),
    (100, "Philosophy & Psychology"),
    (200, "Religion"),
    (300, "Social Sciences"),
    (400, "Language"),
    (500, "Science"),
    (600, "Technology"),
    (700, "Arts & Recreation"),
    (800, "Literature"),
    (900, "History & Geography");

UPDATE ddc_main_class 
SET heading = "Computer Science, Information & General Works" 
WHERE num = 000;

INSERT INTO ddc_hundred_division VALUES
    (000, "Computer Science, Knowledge & Systems"),
    (010, "Bibliographies"),
    (020, "Library & Information Sciences"),
    (030, "Encyclopedias & Books of Facts"),
    (050, "Magazines, Journals & Serials"),
    (060, "Associations, Organizations & Museums"),
    (070, "News Media, Journalism & Publishing"),
    (080, "Quotations"),
    (090, "Manuscripts & Rare Books");

INSERT INTO ddc_thousand_section VALUES
    (000, "Computer Science, Information & General Works"),
    (001, "Knowledge"),
    (002, "The Book"),
    (003, "Systems"),
    (004, "Computer Science"),
    (005, "Computer Programming, Programs & Data"),
    (006, "Special Computer Methods");

SELECT * FROM ddc_main_class;
SELECT * FROM ddc_hundred_division;
SELECT * FROM ddc_thousand_section;

INSERT INTO book_classification VALUES
    ("9780133943030", 000, 000, 004),
    ("9781508673873", 000, 000, 005),
    ("9781497408180", 000, 000, 005),
    ("9780132830317", 000, 000, 004),
    ("9780131489066", 000, 000, 004);

SELECT * FROM book_classification;

# select book title and book classification name/heading
/*  tables: book, book_classification, ddc_thousand_section
    book.isbn = book_classification.isbn
    book_classification.section = ddc_thousand_section.num
*/
/* first try (didn't work):
    SELECT book.title, ddc_thousand_section.heading
    FROM book_classification INNER JOIN ddc_thousand_section
    ON book.isbn = book_classification.isbn
    WHERE book_classification.section = ddc_thousand_section.num;
*/
SELECT title, ddc_thousand_section.heading
FROM book INNER JOIN ddc_thousand_section INNER JOIN book_classification
ON book.isbn = book_classification.isbn
WHERE book_classification.section = ddc_thousand_section.num;

UPDATE book_classification
SET section = 005
WHERE isbn = "9780132830317";