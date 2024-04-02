CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_date DATE NOT NULL,
  total_amount REAL
);

INSERT INTO orders (order_date, total_amount)
VALUES ('2023-07-14', 10.11);

INSERT INTO orders (order_date, total_amount)
VALUES 
('2023-07-15', 7.5),
('2023-07-16', 70.1);

CREATE TABLE costomers (
  customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(10) NOT NULL,
  email VACHAR(100),
  phone VARCHAR(13) NOT NULL
);

ALTER TABLE costomers
RENAME TO customers;

INSERT INTO customers (name, email, phone)
VALUES ('허균', 'asd@naver.com', '010-1234-1324'),
('김영희', 'asd@naver.com', '010-1234-1324'),
('이철수', 'asd@naver.com', '010-1234-1324');


DELETE FROM orders
WHERE order_id = 3;

UPDATE customers
SET name = '홍길동'
WHERE customer_id = 1;

SELECT * FROM orders;
SELECT * FROM customers;
