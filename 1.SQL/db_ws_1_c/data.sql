SELECT * FROM songs;

SELECT genre, COUNT(*) AS count FROM songs
GROUP BY genre;

SELECT genre, COUNT(*) AS count, AVG(duration) AS averge_duration FROM songs
GROUP BY genre;