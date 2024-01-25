BEGIN;

CREATE TABLE customers (
    customer_id serial PRIMARY KEY,
    customer_name varchar,
    city varchar
);


CREATE TABLE orders (
    order_id serial PRIMARY KEY,
    customer_id int,
	order_date date,
	total_amount float,
	FOREIGN KEY(customer_id) 
      REFERENCES customers(customer_id)
);

SAVEPOINT create_customers_orders;



INSERT INTO customers(customer_name, city)
VALUES 
('John Doe', 'New York'),
('Jane Smith', 'Los Angeles'),
('David Johnson', 'Chicago');

SElECT *
FROM customers;

SAVEPOINT customers;

RELEASE SAVEPOINT create_customers_orders;

INSERT INTO orders(customer_id ,order_date, total_amount)
VALUES 
(1, '2022-01-10', 100.00),
(1, '2022-02-15', 150.00),
(2, '2022-03-20', 200.00),
(3, '2022-03-20', 50.00);

SElECT *
FROM orders;

COMMIT;

SELECT customers.customer_name, COUNT(orders.customer_id) AS total_orders
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name