CREATE TABLE songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(100) NOT NULL,
  artist VARCHAR(100),
  album VARCHAR(100) NOT NULL,
  genre VARCHAR(100) NOT NULL,
  duration INTEGER
);
INSERT INTO songs (title, artist, album, genre, duration)
VALUES 
('New title', 'Artist 1', 'Album 1', 'Pop', 200),
('Song 1', 'Artist 2', 'Album 2', 'Rock', 300),
('Song 2', 'Artist 3', 'Album 3', 'Hip Hop', 400),
('Song 3', 'Artist 4', 'Album 4', 'Pop', 500),
('Song 4', 'Artist 5', 'Album 5', 'R&B', 600);

SELECT * FROM songs;

UPDATE songs 
SET title = 'Song 0' 
WHERE id IN (SELECT id FROM songs LIMIT 1);

