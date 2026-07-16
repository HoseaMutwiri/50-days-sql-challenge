



CREATE TABLE challenge_50_project.clean_customers
AS
(
SELECT 
    customer_id, 
    INITCAP(TRIM(customer_name)) AS customer_name, 
    INITCAP(TRIM(city)) AS city, 
    TRIM(signup_date) AS signup_date 
FROM challenge_50_project.customers
);



CREATE TABLE challenge_50_project.clean_orders
AS
(
SELECT 
    order_id,
    customer_id,
    order_date
FROM challenge_50_project.orders
);



CREATE TABLE challenge_50_project.clean_order_details
AS
(
SELECT
    order_detail_id,
    order_id,
    product_id,
    ABS(quantity::INT) AS quantity
FROM challenge_50_project.order_details
);


CREATE TABLE challenge_50_project.clean_products
AS
(
SELECT
    product_id,
    INITCAP(TRIM(product_name)) AS product_name,
    INITCAP(TRIM(category)) AS category,
    ABS(price::NUMERIC) AS price
FROM challenge_50_project.products
);



CREATE TABLE challenge_50_project.clean_payments
AS
(
SELECT
    payment_id,
    order_id,
    ABS(payment_amount::NUMERIC) AS payment_amount,
    payment_date
FROM challenge_50_project.payments
);










