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
    num INT(3),
    heading VARCHAR(64)
);

CREATE TABLE ddc_hundred_division(
    num INT(3),
    heading VARCHAR(64)
);

CREATE TABLE ddc_thousand_section(
    num INT(3),
    heading VARCHAR(64)
);

CREATE TABLE book_classification(
    isbn VARCHAR(13),
    main_class INT(3),
    division INT(3),
    section INT(3),
    FOREIGN KEY (isbn) REFERENCES book(isbn),
    FOREIGN KEY (main_class) REFERENCES ddc_main_class(num) ON UPDATE CASCADE,
    FOREIGN KEY (division) REFERENCES ddc_hundred_division(num) ON UPDATE CASCADE,
    FOREIGN KEY (section) REFERENCES ddc_thousand_section(num) ON UPDATE CASCADE
);