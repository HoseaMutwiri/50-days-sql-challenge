
-- 1.Total Customers

SELECT 
    COUNT(*) AS total_customers  
FROM 
    challenge_50_project.clean_customers;


-- 2.Total Orders

SELECT
    COUNT(*) AS total_orders 
FROM 
    challenge_50_project.clean_orders;


-- 3.Total Revenue

SELECT 
    SUM(payment_amount) AS total_revenue 
FROM
    challenge_50_project.clean_payments;


-- 4.Avg Order Value

SELECT 
    ROUND(AVG(payment_amount),2) AS avg_revenue 
FROM
    challenge_50_project.clean_payments;



-- 5.Total Products Sold

SELECT 
    SUM(quantity) AS total_products_sold
FROM
    challenge_50_project.clean_order_details;



-- 6.Orders Per Customer

SELECT
    customer_id,
    COUNT(order_id) AS orders_per_customer
FROM 
    challenge_50_project.clean_orders
GROUP BY 
    customer_id;

    


