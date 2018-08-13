DROP DATABASE IF EXISTS bamazon;
CREATE database bamazon;

USE bamazon;

CREATE TABLE products (
	item_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    price INT NULL,
    stock_quantity INT NULL,
    PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) values ('TV', 'Electronics', 150, 5);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Xbox', 'Electronics', 200, 3);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Laptop', 'Electronics', 900, 4);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Keyboard', 'Electronics', 30, 11);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Mouse', 'Electronics', 20, 7);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Monitor', 'Electronics', 200, 5);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('iPad', 'Electronics', 400, 5);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Football', 'Sports', 25, 25);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Golf Balls', 'Sports', 20, 5);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ('Putter', 'Sports', 110, 4);