

-- create project schema

CREATE SCHEMA IF NOT EXISTS challenge_50_project;


-- create project data table guided by the ER diagram

CREATE TABLE IF NOT EXISTS challenge_50_project.customers(
    customer_id VARCHAR(50),
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date VARCHAR(50)

);


CREATE TABLE IF NOT EXISTS challenge_50_project.orders(
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_date VARCHAR(50)
);


CREATE TABLE  IF NOT EXISTS challenge_50_project.order_details(
    order_details_id VARCHAR(50),
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS challenge_50_project.products(
    product_id VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(50),
    price VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS challenge_50_project.payments(
    payment_id VARCHAR(50),
    order_id VARCHAR(50),
    payment_amount VARCHAR(50),
    payment_date VARCHAR(50)
);


-- validate data load

SELECT
    (SELECT COUNT(*) FROM challenge_50_project.customers) AS number_of_customers,
    (SELECT COUNT(*) FROM challenge_50_project.orders) AS number_of_orders,
    (SELECT COUNT(*) FROM challenge_50_project.order_details) AS number_of_order_details,
    (SELECT COUNT(*) FROM challenge_50_project.products) AS number_of_products,
    (SELECT COUNT(*) FROM challenge_50_project.payments) AS number_of_payments




