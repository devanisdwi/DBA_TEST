DROP TABLES rf_stores;
DROP INDEX idx_stores_name ON rf_stores;
DROP INDEX idx_stores_address ON rf_stores;

DROP TABLES rf_product_categories;

DROP TABLES customers;
DROP INDEX idx_customers_name ON customers;
DROP INDEX idx_customers_gender ON customers;
DROP INDEX idx_customers_address ON customers;

DROP TABLE products;
DROP INDEX idx_products_name ON products;
DROP INDEX idx_products_product_category_id ON products;
DROP INDEX idx_products_amount ON products;

DROP TABLES transactions;
DROP INDEX idx_transactions_customer_id ON transactions;
DROP INDEX idx_transactions_store_id ON transactions;
DROP INDEX idx_transactions_purchase_date ON transactions;

DROP TABLES sales;
DROP INDEX idx_sales_transaction_id ON sales;
DROP INDEX idx_sales_product_id ON sales;
DROP INDEX idx_sales_amount ON sales;

CREATE TABLE rf_stores (
	id INT NOT NULL UNIQUE,
	name VARCHAR(20) NOT NULL,
	address VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX idx_stores_name
ON rf_stores (name);
CREATE UNIQUE INDEX idx_stores_address
ON rf_stores (address);

CREATE TABLE rf_product_categories (
	id INT NOT NULL UNIQUE,
	name VARCHAR(20) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

CREATE TABLE customers (
	id VARCHAR(15) NOT NULL UNIQUE,
	name VARCHAR(50) NOT NULL,
	gender INT NOT NULL,
	address VARCHAR(50) NOT NULL,
	handphone VARCHAR(20) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

CREATE INDEX idx_customers_name
ON customers (name);
CREATE INDEX idx_customers_gender
ON customers (gender);
CREATE INDEX idx_customers_address
ON customers (address);

CREATE TABLE products (
	id INT NOT NULL UNIQUE,
	name VARCHAR(50) NOT NULL,
	product_category_id INT NOT NULL,
	amount INT NOT NULL,
	description VARCHAR(100),
	PRIMARY KEY(id),
	FOREIGN KEY (product_category_id) REFERENCES rf_product_categories(id)
);

CREATE INDEX idx_products_name
ON products (name);
CREATE INDEX idx_products_product_category_id
ON products (product_category_id);
CREATE INDEX idx_products_amount
ON products (amount);

CREATE TABLE transactions (
	id INT NOT NULL UNIQUE,
	customer_id VARCHAR(15) NOT NULL,
	store_id int NOT NULL,
	purchase_date DATETIME NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (store_id) REFERENCES rf_stores(id)
);

CREATE INDEX idx_transactions_customer_id
ON transactions (customer_id);
CREATE INDEX idx_transactions_store_id
ON transactions (store_id);
CREATE INDEX idx_transactions_purchase_date
ON transactions (purchase_date);

CREATE TABLE sales (
	id INT NOT NULL UNIQUE,
	transaction_id INT,
	product_id INT NOT NULL,
	amount INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (transaction_id) REFERENCES transactions(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE INDEX idx_sales_transaction_id
ON sales (transaction_id);
CREATE INDEX idx_sales_product_id
ON sales (product_id);
CREATE INDEX idx_sales_amount
ON sales (amount);


SHOW TABLES;