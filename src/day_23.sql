


-- Show current salary along with previous salary for each employee

SELECT 
    emp_id,
    salary,
    clean_salary_date,
    LAG(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) AS lag_salary
FROM challenge_50.clean_salaries


-- Calculate difference between current salary and previous salary

SELECT 
    emp_id,
    salary,
    clean_salary_date,
    LAG(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) AS lag_salary,
    (salary-LAG(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date)) AS salary_change
FROM challenge_50.clean_salaries;


-- Analyze attendance trend (compare current status with previous status)

WITH cte2 AS 
(
SELECT
    p.emp_id,
    c.year,
    c.rating
FROM challenge_50.clean_performance p
CROSS JOIN LATERAL(
    VALUES
        (2022,p.rating_2022),
        (2023,p.rating_2023),
        (2024,p.rating_2024)
    ) AS c(year,rating)
),cte3 AS
(SELECT *,
LAG(rating,1,0) OVER(PARTITION BY emp_id ORDER BY year) AS lag_rating

FROM cte2)
SELECT 
    *,
    LAG(lag_rating,1,0) OVER(PARTITION BY emp_id ORDER BY year) AS lag_rating_2
FROM cte3


