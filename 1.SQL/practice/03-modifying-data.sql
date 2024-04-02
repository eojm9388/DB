-- 공통
SELECT * FROM articles;
DROP TABLE articles;
PRAGMA table_info('articles');

CREATE TABLE articles (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 title VARCHAR(100) NOT NULL,
 content VARCHAR(200) NOT NULL,
 createdAt DATE NOT NULL
);

-- 1. Insert data into table
INSERT INTO articles (title, content, createdAt)
VALUES ('hello', 'world', '2000-01-01'); 

INSERT INTO articles (title, content, createdAt)
VALUES ('hello', 'DB', '2000-01-01'); 

INSERT INTO articles (title, content, createdAt)
VALUES 
  ('python', 'clear', '2000-01-01'),
  ('algo', 'clear', '2000-01-01'),
  ('hello', 'DB', '2000-01-01');

INSERT INTO articles (title, content, createdAt)
VALUES ('mytitle', 'mycontent', DATE());

-- 2. Update data in table
UPDATE articles SET title = 'Update Title'
WHERE rowid = 1;

UPDATE 
  articles
SET 
  title = 'update Title',
  content = 'update content'
WHERE 
  id = 2;

UPDATE 
  articles
SET
  title = 'JAVA'
WHERE
  content LIKE '___ar';

-- 3. Delete data from table
DELETE FROM
  articles
WHERE 
  id = 6;

INSERT INTO
  articles (title, content, createdAt)
VALUES
  ('new_title', 'new_content', DATE());


DELETE FROM 
  articles
WHERE id IN (
  SELECT id FROM articles
  ORDER BY createdAt ASC
  LIMIT 2
);


SELECT * FROM articles;
