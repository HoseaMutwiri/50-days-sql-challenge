
--  DAY 22 TASKS

-- • Show each employee with average salary of their department
WITH cte AS
(
    SELECT 
        e.emp_id,
        e.dept_id,
        s.salary,
        ROUND(AVG(s.salary) OVER(PARTITION BY e.dept_id),2) avg_salary
    FROM challenge_50.clean_employees e
    JOIN challenge_50.clean_salaries s
    ON s.emp_id = e.emp_id
)
SELECT *
FROM cte
WHERE salary>avg_salary;


-- •Show total salary of each department for every employee
SELECT 
    e.emp_id,
    e.dept_id,
    s.salary,
    ROUND(AVG(s.salary) OVER(),2) total_salary
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id

-- • Show average performance rating of each department

WITH cte2 AS
(
    SELECT 
        e.emp_id,
        e.dept_id,
        ((p.rating_2022+p.rating_2023+p.rating_2024)/3) avg_ratings
    FROM challenge_50.clean_employees e
    JOIN challenge_50.clean_performance p
    ON p.emp_id = e.emp_id

)
SELECT 
    emp_id,
    dept_id,
    avg_ratings,
    ROUND(AVG(avg_ratings)OVER(PARTITION BY dept_id),2) avg_rating_department_wise
FROM cte2;