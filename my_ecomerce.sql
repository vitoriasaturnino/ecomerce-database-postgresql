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
