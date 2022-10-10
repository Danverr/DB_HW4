create table City (
    cityName   text constraint cityName primary key,
    region text
);

create table Station (
    stationName        text constraint stationName primary key,
    tracksCount integer,
    city        text constraint city references City
);

create table Train (
    trainNumber  serial constraint trainNumber primary key,
    length       double precision,
    startStation text constraint start references Station,
    endStation   text constraint endStation references Station
);

create table Connection (
    id          serial constraint Connection_pk primary key,
    departure   date,
    arrival     date,
    fromStation text constraint fromStation references Station,
    toStation   text constraint toStation references Station,
    train       integer constraint train references Train
);

alter table Train owner to "MARYAKHIN_205";
alter table Station owner to "MARYAKHIN_205";
alter table City owner to "MARYAKHIN_205";
alter table Connection owner to "MARYAKHIN_205";