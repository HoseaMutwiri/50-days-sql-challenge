

-- Retrieve latest salary record for each employee

WITH cte AS
(
SELECT 
emp_id,
salary,
clean_salary_date,
ROW_NUMBER() OVER(PARTITION BY emp_id ORDER BY clean_salary_date DESC) AS order_rank
FROM challenge_50.clean_salaries
)
SELECT emp_id,salary,clean_salary_date FROM cte
WHERE order_rank = 1;



-- Retrieve first(oldest) salary record for each employee

SELECT * FROM
(
    SELECT 
    emp_id,
    salary,
    clean_salary_date,
    ROW_NUMBER() OVER(PARTITION BY emp_id ORDER BY clean_salary_date ASC) AS order_rank
    FROM challenge_50.clean_salaries
)
WHERE order_rank = 1;


-- Rank salary entries for each employee

SELECT 
    emp_id,
    salary,
    clean_salary_date,
    RANK() OVER(ORDER BY salary ASC) AS salary_rank
FROM challenge_50.clean_salaries


-- Get top 2 salary records per employee

WITH cte AS
(
    SELECT 
    emp_id,
    salary,
    clean_salary_date,
    ROW_NUMBER() OVER(PARTITION BY emp_id ORDER BY salary DESC) AS order_rank
    FROM challenge_50.clean_salaries
)
SELECT emp_id,salary,clean_salary_date,order_rank FROM cte
WHERE order_rank IN (1,2);
