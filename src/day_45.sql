

-- 1.Find top customers by number of orders

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) total_orders
FROM 
    challenge_50_project.clean_customers c
JOIN 
    challenge_50_project.clean_orders o ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_id,c.customer_name
ORDER BY 3 DESC
LIMIT 10;


-- 2. • Find top customers by generated revenue

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(p.payment_amount) payment_amountt
FROM 
    challenge_50_project.clean_customers c
JOIN 
    challenge_50_project.clean_orders o ON o.customer_id = c.customer_id
JOIN 
    challenge_50_project.clean_payments p ON p.order_id = o.order_id
GROUP BY 
    c.customer_id,c.customer_name
ORDER BY 3 DESC
LIMIT 10;

-- 3. • Find customers with no orders

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) total_orders
FROM 
    challenge_50_project.clean_customers c
JOIN 
    challenge_50_project.clean_orders o ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_id,c.customer_name
HAVING COUNT(o.order_id) < 1


-- 4. • Analyze new customer signup trend month-wise

SELECT 
    signup_month,
    COUNT(customer_id) total_number_of_signups

FROM
(
SELECT
    TO_CHAR(signup_date, 'Month') AS signup_month,
    customer_id
FROM
    challenge_50_project.clean_customers
)
GROUP BY signup_month
ORDER BY 2 DESC;


-- 5.Find repeat customers with multiple orders


SELECT 
    customer_name,
    repeat_customer
FROM
(
SELECT customer_name,count(customer_id) repeat_customer

FROM challenge_50_project.clean_customers

GROUP BY customer_name
)
WHERE repeat_customer > 1
ORDER BY 2  DESC
;


-- 6.Calculate customer lifetime value
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(p.payment_amount) tatal_payment_amount
FROM 
    challenge_50_project.clean_customers c
JOIN 
    challenge_50_project.clean_orders o ON o.customer_id = c.customer_id
JOIN 
    challenge_50_project.clean_payments p ON p.order_id = o.order_id
GROUP BY 
    c.customer_id,c.customer_name
ORDER BY 3 DESC
;




-- 7.Calculate average spend per customer

SELECT 
    c.customer_id,
    c.customer_name,
    ROUND(AVG(p.payment_amount),2) avg_payment_amount
FROM 
    challenge_50_project.clean_customers c
JOIN 
    challenge_50_project.clean_orders o ON o.customer_id = c.customer_id
JOIN 
    challenge_50_project.clean_payments p ON p.order_id = o.order_id
GROUP BY 
    c.customer_id,c.customer_name
ORDER BY 3 DESC
;

-- 8. • Find total customers per city

SELECT
    city,
    COUNT(customer_id) total_customers_per_city
FROM 
    challenge_50_project.clean_customers
GROUP BY
    city;

