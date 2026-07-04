

-- Create a temporary result set using CTE and filter data from it

WITH cte_salaries AS
(
    SELECT
        emp_id,
        salary,
        clean_salary_date
    FROM challenge_50.clean_salaries
)
SELECT * FROM cte_salaries;

-- Combine employees and salaries using CTE

WITH cte_salaries_and_employees AS
(
    SELECT
        s.emp_id,
        s.salary,
        e.dept_id,
        s.clean_salary_date,
        e.clean_hire_date
    FROM challenge_50.clean_salaries AS s
    JOIN challenge_50.clean_employees AS e
    ON e.emp_id = s.emp_id
)
SELECT * FROM cte_salaries_and_employees;

-- Calculate department average salary using CTE

WITH cte_salaries_and_employees AS
(
    SELECT
        e.dept_id,
        d.dept_name,
        s.salary,
        ROUND(AVG(s.salary) OVER(PARTITION BY e.dept_id),2) AS dept_avg_salary,
        ROW_NUMBER() OVER(PARTITION BY e.dept_id) AS rank_dept
    FROM challenge_50.clean_salaries AS s
    JOIN challenge_50.clean_employees AS e
    ON e.emp_id = s.emp_id
    JOIN challenge_50.clean_departments AS d
    ON e.dept_id = d.dept_id
)
SELECT 
    dept_name,
    dept_avg_salary
FROM cte_salaries_and_employees
WHERE rank_dept = 1;



-- Find employees earning more than department average using CTE

WITH cte_salaries_and_employees AS
(
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        d.dept_name,
        s.salary,
        ROUND(s.salary - AVG(s.salary) OVER(
                                            PARTITION BY e.dept_id),2)
                                             AS diff_salary_dept_avg_salary
    FROM challenge_50.clean_salaries AS s
    JOIN challenge_50.clean_employees AS e
    ON e.emp_id = s.emp_id
    JOIN challenge_50.clean_departments AS d
    ON e.dept_id = d.dept_id
)
SELECT
    emp_name,
    diff_salary_dept_avg_salary
FROM cte_salaries_and_employees
WHERE diff_salary_dept_avg_salary > 0