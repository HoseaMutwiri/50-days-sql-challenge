

-- Find rank of employees within each department based on salary

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    DENSE_RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary) employee_rank
FROM challenge_50.employees e
JOIN challenge_50.salaries s
ON s.emp_id = e.emp_id;




-- Compare each employee’s salary with their department average(AboveAvg/BelowAvg/Equal)

WITH cte AS
(
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,
        ROUND(AVG(s.salary) OVER(PARTITION BY e.dept_id),2) dept_avg_salary
    FROM challenge_50.employees e
    JOIN challenge_50.salaries s
    ON s.emp_id = e.emp_id
)
SELECT 
    emp_id,
    emp_name,
    dept_id,
    salary,
    dept_avg_salary,
    CASE WHEN salary > dept_avg_salary THEN 'AboveAvg'
        WHEN salary < dept_avg_salary THEN 'BelowAvg'
        WHEN salary = dept_avg_salary THEN 'Equal'
    END saray_comparison
FROM cte;

-- Find top 3 highest paid employees in each department

SELECT * FROM
(
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,
        DENSE_RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary DESC) employee_rank
    FROM challenge_50.employees e
    JOIN challenge_50.salaries s
    ON s.emp_id = e.emp_id
)
WHERE employee_rank IN (1,2,3);

-- Find lowest salary employee in each department

SELECT * FROM
(
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,
        DENSE_RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary ASC) employee_rank
    FROM challenge_50.employees e
    JOIN challenge_50.salaries s
    ON s.emp_id = e.emp_id
)
WHERE employee_rank = 1;