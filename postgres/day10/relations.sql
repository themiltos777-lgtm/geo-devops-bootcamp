ALTER TABLE platforms
ADD CONSTRAINT fk_platform_station
FOREIGN KEY (station_id)
REFERENCES stations(id);

SELECT
    s.name,
    p.platform_number
FROM stations AS s
INNER JOIN platforms AS p
    ON s.id = p.station_id;

SELECT
    s.name,
    COUNT(p.id) AS platform_count
FROM stations AS s
LEFT JOIN platforms AS p
    ON s.id = p.station_id
GROUP BY s.id, s.name;
