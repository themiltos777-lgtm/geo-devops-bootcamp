EXPLAIN ANALYZE
SELECT *
FROM stations
WHERE city = 'Berlin';

INSERT INTO stations (
    name,
    city,
    latitude,
    longitude
)
SELECT
    'Test Station ' || n,
    CASE
        WHEN n % 4 = 0 THEN 'Berlin'
        WHEN n % 4 = 1 THEN 'Hamburg'
        WHEN n % 4 = 2 THEN 'München'
        ELSE 'Köln'
    END,
    52.0,
    13.0
FROM generate_series(1, 20000) AS n;

CREATE INDEX idx_stations_city
ON stations(city);
