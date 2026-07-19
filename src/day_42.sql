



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

SELECT 
customer_id,
count(ctid) 
FROM challenge_50_project.clean_customers
GROUP BY customer_id
HAVING count(ctid) > 1; 


UPDATE challenge_50_project.clean_customers
SET city = 'UNKOWN'
WHERE city IS NULL;

UPDATE challenge_50_project.clean_customers
SET customer_name = 'UNKOWN'
WHERE customer_name IS NULL;

UPDATE challenge_50_project.clean_customers
SET signup_date = '2024-01-01'
WHERE signup_date IS NULL;


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

UPDATE challenge_50_project.clean_products
SET product_name = 'UNKOWN'
WHERE product_name IS NULL;

UPDATE challenge_50_project.clean_products
SET category = 'UNKOWN'
WHERE category IS NULL;


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










