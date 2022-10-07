CREATE SCHEMA Library;

CREATE TABLE Library.Reader (
    reader_number SERIAL PRIMARY KEY,
    name TEXT,
    surname TEXT,
    address TEXT,
    birth_year TEXT
);

CREATE TABLE Library.Publisher (
    name TEXT,
    address TEXT,
    PRIMARY KEY(name, address)
);

CREATE TABLE Library.Category (
    name TEXT PRIMARY KEY,
    sub_category TEXT REFERENCES Library.Category (name)
);

CREATE TABLE Library.Book (
    isbn TEXT PRIMARY KEY,
    year DATE,
    name TEXT,
    author TEXT,
    number_of_pages INTEGER,

    publisher_name TEXT,
    publisher_address TEXT,

    FOREIGN KEY (publisher_name, publisher_address) REFERENCES Library.Publisher(name, address)
);

CREATE TABLE Library.Instance (
    number_of_copy INTEGER,
    shelf_position INTEGER,

    book_isbn TEXT REFERENCES Library.Book(isbn),

    PRIMARY KEY (number_of_copy, book_isbn)
);

CREATE TABLE Library.Rent (
    reader_number INTEGER,
    number_of_copy INTEGER,
    isbn TEXT,

    return_date DATE,

    PRIMARY KEY (reader_number, number_of_copy, isbn),
    FOREIGN KEY (reader_number) REFERENCES Library.Reader(reader_number),
    FOREIGN KEY (number_of_copy, isbn) REFERENCES Library.Instance(number_of_copy, book_isbn)
);

CREATE TABLE Library.Category_Book (
    isbn TEXT,
    category_name TEXT,

    PRIMARY KEY (isbn, category_name),
    FOREIGN KEY (isbn) REFERENCES Library.Book(isbn),
    FOREIGN KEY (category_name) REFERENCES Library.Category(name)
);