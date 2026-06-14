-- What are the performance ratings of each employee?

SELECT 
    e.emp_id,
    e.emp_name,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024 
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_performance p
ON e.emp_id = p.emp_id;


--Which employees do not have any salary records?

SELECT 
    e.emp_id,
    e.emp_name,
    s.salary 
FROM challenge_50.clean_employees e
LEFT JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id
WHERE s.emp_id IS NULL;


--Which employees do not have any attendance records?

SELECT 
    e.emp_id,
    e.emp_name,
    a.status 
FROM challenge_50.clean_employees e
LEFT JOIN challenge_50.clean_attendance a
ON a.emp_id = e.emp_id
WHERE a.emp_id IS NULL;



-- What is the employee name, department, and salary together?

SELECT 
    e.emp_name,
    d.dept_name,
    s.salary
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_departments d
ON d.dept_id = e.dept_id
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id;