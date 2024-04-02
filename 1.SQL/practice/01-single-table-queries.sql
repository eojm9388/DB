-- 01. Querying data
SELECT LastName FROM employees;
SELECT LastName, FirstName FROM employees;
SELECT * FROM employees;
SELECT FirstName AS '이름' FROM employees;

SELECT 
  Name, 
  Milliseconds / 60000 AS '재생 시간(분)'
FROM 
  tracks;


-- 02. Sorting data

SELECT FirstName AS '이름' FROM employees
ORDER BY FirstName DESC;

SELECT Country, City FROM customers
ORDER BY Country DESC, City ASC;

SELECT 
  Name, 
  Milliseconds / 60000 AS '재생 시간(분)'
FROM 
  tracks
ORDER BY Milliseconds DESC; 

-- NULL 정렬 예시
SELECT ReportsTo FROM employees
ORDER BY ReportsTo;

-- 03. Filtering data
SELECT DISTINCT Country FROM customers
ORDER BY Country;

SELECT LastName, FirstName, City FROM customers
WHERE City = 'Prague'
ORDER BY LastName;

SELECT LastName, FirstName, City FROM customers
WHERE City != 'Prague'
ORDER BY LastName;

SELECT LastName, FirstName, Company, Country FROM customers
WHERE Company IS NULL AND Country = 'USA';

SELECT LastName, FirstName, Company, Country FROM customers
WHERE Company IS NULL OR Country = 'USA';

SELECT Name, Bytes FROM tracks
-- WHERE Bytes >= 100000 AND Bytes <= 500000;
WHERE Bytes BETWEEN 100000 AND 500000;

SELECT Name, Bytes FROM tracks
WHERE Bytes BETWEEN 100000 AND 500000
ORDER BY Bytes ASC;

SELECT LastName, FirstName, Country FROM customers
WHERE Country IN ('Canada', 'Germany', 'France');

SELECT LastName, FirstName FROM customers
WHERE LastName LIKE '%son';

SELECT LastName, FirstName FROM customers
WHERE FirstName LIKE '___a';

SELECT TrackId, Name, Bytes FROM tracks
ORDER BY Bytes DESC
LIMIT 3, 4;

-- 04. Grouping data
SELECT Country, COUNT(*) AS '인원수' FROM customers
GROUP BY Country;

SELECT Composer, AVG(Bytes) from tracks
GROUP BY Composer
ORDER BY AVG(Bytes) DESC;

SELECT Composer, AVG(Milliseconds/60000) AS play_time from tracks
WHERE play_time < 10
GROUP BY Composer;


