

-- Analyze query performance before applying index using EXPLAIN ANALYZE


EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id =s.emp_id;


-- Apply index on join columns and compare performance after indexing

-- create salary column index

CREATE INDEX idx_salary ON challenge_50.clean_salaries(salary)

-- Run the query after indexing

EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id =s.emp_id;


--Analyze query using multiple conditions (emp_id, salary_date) and optimize using composite index

EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id =s.emp_id
WHERE 
    e.emp_id IN (101,43,97) AND s.clean_salary_date = '2024-01-01';

-- create a composite index on clean_salary_date and emp_id

CREATE INDEX 
    idx_emp_id_salary_dates 
ON 
    challenge_50.clean_salaries(emp_id,clean_salary_date);


--

EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id =s.emp_id
WHERE 
    e.emp_id IN (101,43,97) AND s.clean_salary_date = '2024-01-01';

-- Compare query performance before and after applying index on emp_id

