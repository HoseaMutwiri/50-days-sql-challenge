
-- ================================================================
-- CHANGEING DATA TYPES FOR CUSTOMERS TABLE 
-- ================================================================

ALTER TABLE challenge_50_project.clean_customers
ALTER COLUMN signup_date TYPE DATE 
USING signup_date::DATE;

ALTER TABLE challenge_50_project.clean_customers
ALTER COLUMN customer_id TYPE INT USING customer_id::INTEGER,
ADD PRIMARY KEY(customer_id);





-- ================================================================
-- CHANGEING DATA TYPES FOR ORDERS TABLE 
-- ================================================================

SELECT * FROM challenge_50_project.clean_orders

ALTER TABLE challenge_50_project.clean_orders
ALTER COLUMN order_id TYPE INT USING order_id::INTEGER,
ALTER COLUMN customer_id TYPE INT USING customer_id::INTEGER,
ALTER COLUMN order_date TYPE DATE USING order_date::DATE,
ADD PRIMARY KEY(order_id),
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id)
REFERENCES challenge_50_project.clean_customers(customer_id);




-- ================================================================
-- CHANGEING DATA TYPES FOR PAYMENTS TABLE 
-- ================================================================


ALTER TABLE challenge_50_project.clean_payments 
ALTER COLUMN payment_date TYPE DATE 
USING payment_date::DATE;

ALTER TABLE challenge_50_project.clean_payments
ALTER COLUMN payment_id TYPE INT USING payment_id::INTEGER,
ALTER COLUMN order_id TYPE INT USING payment_id::INTEGER,
ADD PRIMARY KEY(payment_id),
ADD CONSTRAINT fk_orders_id
FOREIGN KEY(order_id)
REFERENCES challenge_50_project.clean_orders(order_id)


SELECT * FROM challenge_50_project.clean_payments 




-- ================================================================
-- CHANGEING DATA TYPES FOR PRODUCTS TABLE 
-- ================================================================

SELECT * FROM challenge_50_project.clean_products;

ALTER TABLE challenge_50_project.clean_products
ALTER COLUMN product_id TYPE INT USING product_id::INTEGER,
ADD PRIMARY KEY(product_id);





-- ================================================================
-- CHANGEING DATA TYPES FOR ORDER DETAILS TABLE 
-- ================================================================

SELECT * FROM challenge_50_project.clean_order_details;

ALTER TABLE challenge_50_project.clean_order_details
ALTER COLUMN order_detail_id TYPE INT USING order_detail_id::INTEGER,
ALTER COLUMN order_id TYPE INT USING order_id::INTEGER,
ALTER COLUMN product_id TYPE INT USING product_id::INTEGER,
ADD PRIMARY KEY(order_detail_id),
ADD CONSTRAINT fk_orders_id
FOREIGN KEY(order_id)
REFERENCES challenge_50_project.clean_orders(order_id),
ADD CONSTRAINT fk_product_id
FOREIGN KEY(product_id)
REFERENCES challenge_50_project.clean_products(product_id);


