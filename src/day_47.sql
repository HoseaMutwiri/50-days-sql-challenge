


-- 1. Find number of orders placed daily.

SELECT 
    order_date,
    COUNT(order_id) AS total_orders
FROM 
    challenge_50_project.clean_orders
GROUP BY 1
ORDER BY 2 DESC;


-- 2. Find monthly order trend.

SELECT 
    TO_CHAR(order_date,'Mon'),
    COUNT(order_id) AS total_orders
FROM 
    challenge_50_project.clean_orders
GROUP BY 1
ORDER BY 2 DESC;


-- 3. Find the highest value order.

SELECT
o.order_id,
SUM(p.payment_amount) AS order_value
FROM 
    challenge_50_project.clean_payments p
JOIN 
    challenge_50_project.clean_orders o
ON 
    p.order_id = o.order_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


-- 4. Find the lowest value order.

SELECT
o.order_id,
SUM(p.payment_amount) AS order_value
FROM 
    challenge_50_project.clean_payments p
JOIN 
    challenge_50_project.clean_orders o
ON 
    p.order_id = o.order_id
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1;

-- 5. Find average quantity per order.

SELECT
    order_id,
    ROUND(AVG(quantity),2) avg_quanity
FROM 
    challenge_50_project.clean_order_details
GROUP BY 1


-- 6. Categorize orders by quantity size (Small / Medium / Large Orders).

SELECT
    order_id,
    quantity,
    CASE WHEN quantity <=2 THEN 'Small'
        WHEN quantity <=5 THEN 'Medium'
        ELSE 'Large Orders'
    END AS order_categorize
FROM 
    challenge_50_project.clean_order_details



-- 7. Find the day with the highest number of orders.

SELECT 
    order_date,
    COUNT(order_id) AS total_orders
FROM 
    challenge_50_project.clean_orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;