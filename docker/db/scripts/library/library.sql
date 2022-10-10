create table Book (
    isbn       serial constraint isbn primary key,
    publisher  text constraint publisher references Publisher,
    category   text constraint category_name references Category,
    year       integer,
    author     text,
    pagesCount integer
);

create table BookСopy (
    copyNumber serial constraint copyNumber primary key,
    isbn       integer not null constraint isbn references Book,
    position   integer
);

create table Category (
    name           text not null primary key,
    parentCategory text references Category
);

create table Publisher (
    name    text not null constraint name primary key,
    address text
);

create table Reader (
    id        serial constraint id primary key,
    firstName text,
    lastName  text,
    birthDate date,
    address   text
);

create table BookRental (
    readerId   integer constraint readerId references Reader,
    copyNumber integer constraint copyNumber references BookСopy,
    returnDate date
);

alter table Publisher owner to "MARYAKHIN_205";
alter table Category owner to "MARYAKHIN_205";
alter table Book owner to "MARYAKHIN_205";
alter table BookСopy owner to "MARYAKHIN_205";
alter table Reader owner to "MARYAKHIN_205";
alter table BookRental owner to "MARYAKHIN_205";

