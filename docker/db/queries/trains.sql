-- а) Найдите все прямые рейсы из Москвы в Тверь.
SELECT trains.trainnumber
FROM station, (
    SELECT * FROM train, station
    WHERE train.startstation = station.stationname AND station.city = 'Москва'
) as trains
WHERE trains.endstation = station.stationname AND station.city = 'Тверь';

-- б) Найдите все многосегментные маршруты, имеющие точно однодневный трансфер из Москвы в Санкт-Петербург
--    (первое отправление и прибытие в конечную точку должны быть в одну и ту же дату).
--    Вы можете применить функцию DAY () к атрибутам Departure и Arrival, чтобы определить дату.
WITH RECURSIVE traverse AS (
        SELECT ARRAY[con.id] AS path, con.* FROM connection con, station st
        WHERE
          con.fromstation = st.stationname
          AND st.city = 'Москва'
          AND con.arrival = con.departure
    UNION ALL
        SELECT traverse.path || ARRAY[con.id], con.* FROM connection con
        INNER JOIN traverse
        ON traverse.tostation = con.fromstation AND traverse.arrival = con.departure
)
SELECT path, departure, arrival FROM traverse, station
WHERE traverse.tostation = station.stationname AND station.city = 'Санкт-Петербург';