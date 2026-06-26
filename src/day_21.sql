
--• Rank employees based on salary

SELECT
    emp_id,
    salary,
    RANK()OVER(ORDER BY salary) "Rank employees based on salary"
FROM challenge_50.clean_salaries
LIMIT 10;


--•Perform department-wise ranking of employees

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    DENSE_RANK()OVER(PARTITION BY e.dept_id ORDER BY s.salary) "department-wise ranking of employees"
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id;


-- • Identify top performers based on average performance rating
SELECT 
    emp_name,
    avg_performance,
    DENSE_RANK()OVER(ORDER BY avg_performance DESC) "top performers based on average performanc"
FROM(
    SELECT
    e.emp_id,
    e.emp_name,
    ((p.rating_2022+p.rating_2023+p.rating_2024)/3) Avg_performance 
    FROM challenge_50.clean_performance p
    JOIN challenge_50.clean_employees e
    ON e.emp_id = p.emp_id
)
LIMIT 10;

-- • Find top 3 employees based on salary ranking
SELECT
    salary,
    RANK()OVER(ORDER BY salary) "top 3 employees based on salary"
FROM challenge_50.clean_salaries
ORDER BY salary DESC
LIMIT 3;

