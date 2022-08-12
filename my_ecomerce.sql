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
