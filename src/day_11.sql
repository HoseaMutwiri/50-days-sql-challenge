
-- TASK 1
--What is the employee name, department, and performance ratings?

SELECT 
    e.emp_name,
    d.dept_name,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_performance p
ON p.emp_id = e.emp_id
JOIN challenge_50.clean_departments d
ON d.dept_id = e.dept_id;

-- TASK 2
-- What is the complete profile of each employee (department,salary,performance)?

SELECT 
    e.emp_name,
    d.dept_name,
    s.salary,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
FROM challenge_50.clean_employees e
LEFT JOIN challenge_50.clean_performance p
ON p.emp_id = e.emp_id
JOIN challenge_50.clean_departments d
ON d.dept_id = e.dept_id
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id;


-- TASK 3
-- How many salary records does each employee have?

SELECT
    e.emp_id,
    e.emp_name,
    COUNT(s.salary) AS count_salary_records 
FROM challenge_50.clean_employees e
LEFT JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id
GROUP BY e.emp_id,e.emp_name
ORDER BY e.emp_id ASC;


-- TASK 4
-- What is the total salary paid to each employee?

SELECT
    e.emp_id,
    e.emp_name,
    SUM(s.salary) AS total_salary 
FROM challenge_50.clean_employees e
LEFT JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id
GROUP BY e.emp_id,e.emp_name
ORDER BY e.emp_id ASC;