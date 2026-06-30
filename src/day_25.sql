

-- Calculate running total salary for each employee overtime

SELECT
    salary_id,
    emp_id,
    salary,
    clean_salary_date,
    SUM(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) AS running_total
FROM challenge_50.clean_salaries;


-- Calculate running attendance count for each employee

SELECT
    emp_id,
    attendance_id,
    status,
    clean_attendance_date,
    COUNT(attendance_id) FILTER(WHERE status != 'Absent') OVER(PARTITION BY emp_id ORDER BY clean_attendance_date) AS attendance_count

FROM challenge_50.clean_attendance


-- Calculate cumulative salary for each department over time

SELECT 
    s.salary_id,
    e.emp_id,
    d.dept_id,
    d.dept_name,
    s.salary,
    s.clean_salary_date,
    SUM(s.salary) OVER(PARTITION BY d.dept_id ORDER BY s.clean_salary_date) AS cumulative_salary_each_department
FROM challenge_50.clean_salaries s
JOIN challenge_50.clean_employees e
ON s.emp_id = e.emp_id
JOIN challenge_50.clean_departments d
ON e.dept_id = d.dept_id
