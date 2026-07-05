

-- Find employees whose total salary is greater than 100000

SELECT 
    emp_id,
    SUM(salary) AS total_salary
FROM challenge_50.clean_salaries
GROUP BY emp_id
HAVING SUM(salary) > 100000;


-- ===================================================================
-- OR
-- ===================================================================


WITH cte AS
(
    SELECT emp_id,SUM(salary) AS total_salary
    FROM challenge_50.clean_salaries
    GROUP BY emp_id
)
SELECT * FROM cte WHERE total_salary>100000;

-- Show employee salary along with department average salary using CTE


WITH cte AS
(
    SELECT 
        s.emp_id,
        e.dept_id,
        s.salary,
        ROUND(AVG(s.salary) OVER(PARTITION BY e.dept_id),2) AS dept_avg_salary
    FROM challenge_50.clean_salaries AS s
    JOIN challenge_50.clean_employees AS e
    ON s.emp_id = e.emp_id
)
SELECT * FROM cte;


-- Find department with highest total salary


WITH cte2 AS
(
    SELECT 
        s.emp_id,
        e.dept_id,
        d.dept_name,
        s.salary,
        SUM(s.salary) OVER(PARTITION BY e.dept_id) AS dept_total_salary
    FROM challenge_50.clean_salaries AS s
    JOIN challenge_50.clean_employees AS e
    ON s.emp_id = e.emp_id
    JOIN challenge_50.clean_departments AS d
    ON d.dept_id = e.dept_id
)
SELECT
    dept_id,
    dept_name,
    dept_total_salary
FROM cte2
ORDER BY dept_total_salary DESC
LIMIT 1;