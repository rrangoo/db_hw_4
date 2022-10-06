CREATE SCHEMA Library;

CREATE TABLE Library.Reader (
    Reader_number serial primary key,
    Name text,
    Sername text,
    Address text,
    Birth_year date
);

CREATE TABLE Library.Publisher (
    Name text,
    Address text,
    primary key(Name, Address)
);

CREATE TABLE Library.category (
    id serial primary key,
    subcategory int references Library.category (id),
    name text
);

CREATE TABLE Library.book (
    id serial primary key,
    Publisher_Name text references Library.Publisher (Name),
    Publisher_Address text references Library.Publisher (Address),
    category_id int references Library.category (id),
    year date,
    name text,
    author text,
    number_of_pages int
    
);

CREATE TABLE Library.instance (
    id serial primary key,
    book_id int references Library.book (id),
    number_of_copy int,
    shelf_position int
);

CREATE TABLE Library.rent (
    id serial primary key,
    reader_id int references Library.reader (id),
    instance_id int references Library.instance (id),
    date date
);
