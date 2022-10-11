create table Category (
    name           text not null primary key,
    parentCategory text references Category
);
INSERT INTO Category VALUES
    ('Горы', NULL),
    ('Путешествия', NULL),
    ('ХЗ', NULL);

create table Publisher (
    name    text not null constraint name primary key,
    address text
);
INSERT INTO Publisher VALUES
    ('', '');

create table Reader (
    id        serial constraint id primary key,
    firstName text,
    lastName  text,
    birthDate date,
    address   text
);
INSERT INTO Reader VALUES
    (1, 'Иван', 'Иванов', '2022-01-01', 'Москва'),
    (2, 'Вася', 'Пупкин', '2022-01-01', 'Москва'),
    (3, 'Жмых', 'Пажилой', '2022-01-01', 'Питер'),
    (4, 'Дада', 'Я', '2022-01-01', 'Караганда');

create table Book (
    isbn       serial constraint isbn primary key,
    publisher  text constraint publisher references Publisher,
    year       integer,
    author     text,
    title      text,
    pagesCount integer
);
INSERT INTO Book VALUES
    (1, '', 2022, '', '1', 0),
    (2, '', 2022, '', '2', 0),
    (3, '', 2022, '', '3', 0),
    (4, '', 2022, '', '4', 0),
    (5, '', 2022, '', '5', 0);

create table BookCat (
    isbn serial constraint isbn references Book,
    category text constraint category references Category
);
INSERT INTO BookCat VALUES
    (1, 'Горы'),
    (1, 'ХЗ'),
    (2, 'Горы'),
    (2, 'Путешествия'),
    (3, 'Горы'),
    (4, 'Путешествия'),
    (4, 'ХЗ');

create table BookExemplar (
    copyNumber serial constraint copyNumber primary key,
    isbn       integer not null constraint isbn references Book,
    position   integer
);
INSERT INTO BookExemplar VALUES
    (1, 1, 0),
    (2, 2, 0),
    (3, 3, 0),
    (4, 4, 0),
    (5, 5, 0);

create table BookRental (
    readerId   integer constraint readerId references Reader,
    copyNumber integer constraint copyNumber references BookExemplar,
    returnDate date
);
INSERT INTO BookRental VALUES
    (1, 1, '2022-01-01'),
    (1, 3, NULL),
    (2, 1, NULL),
    (3, 1, '2022-01-01'),
    (4, 4, '2022-01-01');

alter table Publisher owner to "MARYAKHIN_205";
alter table Category owner to "MARYAKHIN_205";
alter table Book owner to "MARYAKHIN_205";
alter table BookExemplar owner to "MARYAKHIN_205";
alter table Reader owner to "MARYAKHIN_205";
alter table BookRental owner to "MARYAKHIN_205";
