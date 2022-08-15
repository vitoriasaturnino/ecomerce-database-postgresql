-- criando o banco de dados 
CREATE DATABASE ecomerce;

-- tabela de produtos
CREATE TABLE products(
	id int PRIMARY KEY,
	name varchar(60),
	description varchar(150),
	category varchar(40),
	price numeric(10,2),
	in_stock boolean
);

SELECT * FROM products;

CREATE TABLE customers (
	id int PRIMARY KEY,
	name varchar(100) NOT NULL,
	email varchar(60) NOT NULL UNIQUE,
	cpf varchar(11) NOT NULL UNIQUE,
	birthday date
);

SELECT * FROM customers;

CREATE TABLE address (
	id int PRIMARY KEY,
	address varchar(100),
	city varchar(100),
	state varchar(2),
	CONSTRAINT address_fk FOREIGN KEY (id) REFERENCES customers
);

SELECT * FROM address;

SELECT * FROM customers c INNER JOIN address a on a.id = c.id;


CREATE TABLE orders (
	id int PRIMARY KEY,
	customers_id int,
	status varchar(30),
	date date,
	CONSTRAINT customer_id_fk FOREIGN KEY (id) REFERENCES customers
);

SELECT * FROM orders;

SELECT o.id, c.name, o.status, o.date FROM customers c INNER JOIN orders o on c.id = o.id;

CREATE TABLE order_items (
	order_id int,
	product_id int,
	quantity int,
	CONSTRAINT order_items_pk PRIMARY KEY (order_id, product_id),
	CONSTRAINT order_items_id_fk FOREIGN KEY (order_id) REFERENCES orders(id),
	CONSTRAINT order_items_product_id_fk FOREIGN KEY (product_id) REFERENCES products(id)
);

SELECT * FROM orders;

-- INNER JOIN informa no pedido, o nome do cliennte, informações do peliddo e endereços
SELECT o.id, c.name, o.status, o.date, oi.quantity, a.address, a.city, a.state FROM customers c INNER JOIN orders o on c.id = o.id INNER JOIN order_items oi on oi.order_id = o.id INNER JOIN address a on a.id = c.id;
