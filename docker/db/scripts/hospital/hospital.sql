create table Room (
    roomNumber serial constraint roomNumber primary key,
    bedsCount  integer
);

create table Station (
    stationNumber serial constraint stationNumber primary key,
    name          text
);

create table StationPersonell (
    personellNumber serial constraint personellNumber primary key,
    name            text,
    station         serial constraint station references Station
);

create table Caregiver (
    personell serial constraint personell references StationPersonell,
    qualification text
);

create table Doctor (
    personell serial constraint personell references StationPersonell,
    area      text,
    rank      integer
);

create table Patient (
    patientNumber serial constraint patientNumber primary key,
    disease       text,
    name          text,
    doctor        serial constraint doctor references StationPersonell
);

create table Admission (
    room     integer constraint room references Room,
    patient  integer constraint patient references Patient,
    fromDate date,
    toDate   date
);

alter table Room owner to "MARYAKHIN_205";
alter table Patient owner to "MARYAKHIN_205";
alter table Station owner to "MARYAKHIN_205";
alter table Caregiver owner to "MARYAKHIN_205";
alter table Doctor owner to "MARYAKHIN_205";
alter table StationPersonell owner to "MARYAKHIN_205";
alter table Admission owner to "MARYAKHIN_205";

