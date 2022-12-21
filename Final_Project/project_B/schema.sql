CREATE DATABASE company;

USE company

CREATE TABLE product
        name VARCHAR(50),
		id INT PRIMARY KEY AUTO_INCREMENT,
		description VARCHAR(255),
        quantity INT,
        category VARCHAR(255)

CREATE TABLE customer
        name VARCHAR(50),
		age INT NOT NULL,
		id INT PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR(255),
        prod_purchased INT,
        store_purchase VARCHAR(255),
        way_purchased VARCHAR(255),
		FOREIGN KEY (prod_purchased) REFERENCES product(id)

CREATE TABLE staff
        name VARCHAR(50),
		id INT PRIMARY KEY AUTO_INCREMENT,
        department VARCHAR(255),
        products_sold VARCHAR(255),
        store_location VARCHAR(255)
