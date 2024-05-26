create table if not exists members(
    id serial primary key,
    name text,
    age int
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES members(id),
    product TEXT NOT NULL,
    amount INTEGER NOT NULL
);

CREATE VIEW member_orders AS
SELECT
    members.id AS member_id,
    members.name AS member_name,
    members.age AS member_age,
    orders.id AS order_id,
    orders.product,
    orders.amount
FROM
    members
JOIN
    orders ON members.id = orders.member_id;

INSERT INTO members (name, age) VALUES
('Alice', 20),
('Bob', 21);

INSERT INTO orders (member_id, product, amount) VALUES
(1, 'Laptop', 1500),
(1, 'Mouse', 50),
(2, 'Keyboard', 100);