1. SELECT s.id, s.name, p.platform_number FROM stations AS s 
INNER JOIN platforms AS p ON s.id = p.station_id ORDER BY s.name DESC;

2. SELECT s.name, p.platform_number FROM stations AS s 
INNER JOIN platforms AS p ON s.id = p.station_id WHERE s.city = 'Berlin';

3. SELECT s.id, s.name, p.platform_number FROM stations AS s 
LEFT JOIN platforms AS p ON s.id = p.station_id;

4. SELECT s.id, s.name, p.platform_number FROM stations AS s 
LEFT JOIN platforms AS p ON s.id = p.station_id WHERE p.id IS NULL;

5. SELECT s.name, COUNT(p.id) AS platform_count FROM stations AS s 
LEFT JOIN platforms AS p ON s.id = p.station_id GROUP BY s.id, s.name;

6. SELECT s.name, COUNT(p.id) FROM stations AS s 
LEFT JOIN platforms AS p ON s.id = p.station_id GROUP BY s.id, s.name 
HAVING COUNT(p.id) > 1 ORDER BY count DESC;
Better6:
SELECT
    s.name,
    COUNT(p.id) AS platform_count
FROM stations AS s
LEFT JOIN platforms AS p
    ON s.id = p.station_id
GROUP BY s.id, s.name
HAVING COUNT(p.id) > 1
ORDER BY platform_count DESC;
