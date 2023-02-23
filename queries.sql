/* queries */

--Run commands
-- @C:\csy2038\as2\queries.sql

/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/









SELECT en.experience_nature_id,e.experience_name,en.duration,en.category
FROM experience_natures en, experiences e
WHERE en.experience_nature_id=e.experience_id;

SELECT l.location_id, f.facility_name, f.services, f.description
FROM locations l, TABLE(l.facility) f;


SELECT e.experience_name, a.name, a.description, a.category
FROM experiences e, TABLE(e.activity) a
WHERE e.experience_name = 'Skiing in the Rockies';

SELECT e.experience_name, a.name, a.description, a.category
FROM experiences e, TABLE(e.activity) a
WHERE a.category = 'Water Sports';

SELECT e.experience_name, a.name, a.description, a.category
FROM experiences e, TABLE(e.activity) a
WHERE a.name = 'Ski Rental';

--querey deref
SELECT ambassador_id, DEREF(address) from ambassadors;

--query using dot
SELECT ambassador_id, a.address.country
FROM ambassadors a
WHERE a.address.country = 'USA';

--quering varray coloumns

SELECT l.location_id, f.facility_name, f.services
FROM locations l, TABLE(l.facility) f;

SELECT l.location_id, f.facility_name, f.services
FROM locations l, TABLE(l.facility) f
WHERE f.description='Nature stay';

--querying table with nested tables

SELECT a.name, e.price
FROM experiences e , TABLE(e.activity)a;

SELECT facility.*
FROM locations, TABLE(locations.facility) facility;


--more queries using set
SELECT experience_name, experience_id FROM experiences
UNION 
SELECT ambassador_name,ambassador_id FROM ambassadors;

SELECT ambassador_id FROM experience_ambassadors
INTERSECT
SELECT ambassador_id FROM ambassadors;

SELECT experience_id FROM experiences
MINUS
SELECT experience_id FROM experience_ambassadors;

--using function
SELECT ambassador_name, COUNT(experience_id) as experiences_led
FROM ambassadors a
JOIN experience_ambassadors ea ON a.ambassador_id = ea.ambassador_id
GROUP BY ambassador_name;

SELECT SUM(price) as total_price FROM experiences;

SELECT AVG(price) as avg_price FROM experiences;

SELECT MAX(price) as max_price FROM experiences;

SELECT MIN(price) as min_price FROM experiences;

--group by
SELECT category, COUNT(*) 
FROM experience_natures
GROUP BY category;




--using having
SELECT experience_name, price
FROM experiences
GROUP BY experience_name,price
HAVING price > 200;

--subqueries
SELECT experience_name
FROM experiences
WHERE price > (SELECT AVG(price) FROM experiences);

SELECT experience_name
FROM experiences e
WHERE NOT EXISTS (SELECT * FROM experience_ambassadors ea WHERE ea.experience_id = e.experience_id);


--inner 

SELECT e.experience_name, a.ambassador_name
FROM experiences e
INNER JOIN experience_ambassadors ea ON e.experience_id = ea.experience_id
INNER JOIN ambassadors a ON ea.ambassador_id = a.ambassador_id;

--left join
SELECT e.experience_name, a.ambassador_name
FROM experiences e
LEFT JOIN experience_ambassadors ea ON e.experience_id = ea.experience_id
LEFT JOIN ambassadors a ON ea.ambassador_id = a.ambassador_id;
--outer join
SELECT e.experience_name, a.ambassador_name
FROM experiences e
JOIN experience_ambassadors ea
ON e.experience_id = ea.experience_id
JOIN ambassadors a
ON ea.ambassador_id = a.ambassador_id;

