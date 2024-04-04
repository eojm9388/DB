SELECT * FROM artists;

SELECT COUNT(*) FROM artists;

SELECT * FROM artists
WHERE Name = 'AC/DC';

SELECT ArtistId, Name FROM artists;

SELECT * FROM artists
WHERE Name IN ('Gilberto Gil', 'Ed Motta');

SELECT * FROM artists
ORDER BY Name DESC;

SELECT * FROM artists
WHERE Name LIKE 'Vinícius%'
LIMIT 2;

SELECT * FROM artists
ORDER BY ArtistId 
LIMIT 49, 21;