create table City (
    cityName text constraint cityName primary key,
    region   text
);
INSERT INTO City VALUES
    ('Москва', ''),
    ('a', ''),
    ('b', ''),
    ('c', ''),
    ('Санкт-Петербург', ''),
    ('Тверь', '');

create table Station (
    stationName text constraint stationName primary key,
    tracksCount integer,
    city        text constraint city references City
);
INSERT INTO Station VALUES
    ('Москва1', 1, 'Москва'),
    ('a1', 1, 'a'),
    ('b1', 1, 'b'),
    ('c1', 1, 'c'),
    ('Санкт-Петербург1', 1, 'Санкт-Петербург'),
    ('Тверь1', 1, 'Тверь');

create table Train (
    trainNumber  serial constraint trainNumber primary key,
    length       double precision,
    startStation text constraint start references Station,
    endStation   text constraint endStation references Station
);
INSERT INTO Train VALUES
    (1, 1, 'a1', 'b1'),
    (2, 1, 'a1', 'b1'),
    (3, 1, 'Москва1', 'Тверь1');

create table Connection (
    id          serial constraint Connection_pk primary key,
    departure   date,
    arrival     date,
    fromStation text constraint fromStation references Station,
    toStation   text constraint toStation references Station,
    train       integer constraint train references Train
);
INSERT INTO Connection VALUES
    (1, '2022-10-11', '2022-10-11', 'Москва1', 'a1', 1),
    (2, '2022-10-11', '2022-10-11', 'a1', 'b1', 1),
    (3, '2022-10-11', '2022-10-11', 'a1', 'c1', 2),
    (4, '2022-10-11', '2022-10-11', 'b1', 'c1', 1),
    (5, '2022-10-11', '2022-10-11', 'c1', 'Санкт-Петербург1', 1);

alter table Train owner to "MARYAKHIN_205";
alter table Station owner to "MARYAKHIN_205";
alter table City owner to "MARYAKHIN_205";
alter table Connection owner to "MARYAKHIN_205";
