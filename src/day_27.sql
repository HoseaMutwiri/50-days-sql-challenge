/*
==================================================================================
Compare each employee's salary with overall average salary 
(> avg → Above Avg, < avg →
Below Avg,= avg → Equal)
==================================================================================
*/

SELECT 
    emp_id,
    salary,
    avg_salary,
    CASE WHEN salary >avg_salary THEN 'Above Avg'
        WHEN salary < avg_salary THEN 'Below Avg'
        WHEN salary = avg_salary THEN 'Equal'
    END salary_comparison
FROM
(
    SELECT
        emp_id,
        salary,
        ROUND(AVG(salary) OVER(),2) avg_salary
    FROM challenge_50.clean_salaries
);


/*
==================================================================================
Compare employee salary with total salary of all employees
(salary > 10% of total salary → High Contributor, else → Low
Contributor)
==================================================================================
*/

SELECT 
    emp_id,
    salary,
    total_salary,
    CASE WHEN ((salary*100)/total_salary) > 10 THEN 'High Contributor'
        ELSE 'Low Contributor'
    END comparison_with_total_salary
FROM
(
    SELECT
        emp_id,
        salary,
        SUM(salary) OVER() total_salary
    FROM challenge_50.clean_salaries
);


/*
==================================================================================
Compare department total salary with 
overall total salary (dept total > 30% of total →
High Dept, else → Low Dept)
==================================================================================
*/


SELECT 
    emp_id,
    salary,
    total_salary_by_dept,
    total_salary,
    CASE WHEN ((total_salary_by_dept*100)/total_salary) > 30 THEN 'High Dept'
        ELSE 'Low Dept'
    END dept_comparison_with_total_salary
FROM
(
    SELECT
        s.emp_id,
        s.salary,
        e.dept_id,
        SUM(s.salary) OVER(PARTITION BY e.dept_id) total_salary_by_dept,
        SUM(s.salary) OVER() total_salary

    FROM challenge_50.clean_salaries s
    JOIN challenge_50.clean_employees e
    ON s.emp_id = e.emp_id
);
