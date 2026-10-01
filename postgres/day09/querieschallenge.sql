1. SELECT * FROM stations WHERE city IN ('Berlin', 'Hamburg');

2. SELECT * FROM stations WHERE name ILIKE ('%Hbf%') OR name ILIKE ('%Hauptbahnhof%');
Alternative 2. SELECT *
FROM stations
WHERE name ILIKE ANY (ARRAY['%Hbf%', '%Hauptbahnhof%']);

3. SELECT * FROM stations WHERE city != 'Berlin';

4. SELECT city, COUNT(*) AS station_count FROM stations GROUP BY city ORDER BY station_count;

5. SELECT city, COUNT(*) AS station_count FROM stations GROUP BY city ORDER BY station_count DESC;

6. SELECT * FROM stations WHERE latitude IS NULL;

7. SELECT city FROM stations GROUP BY city; Alternative 7. SELECT DISTINCT city FROM stations;
