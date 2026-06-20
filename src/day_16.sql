-- Calculate total salary paid to each employee

SELECT 
    e.emp_id,
    e.emp_name, 
    sum(s.salary)
FROM
challenge_50.clean_salaries s
JOIN challenge_50.clean_employees e
ON
s.emp_id = e.emp_id
GROUP BY e.emp_id,e.emp_name;


-- Find AVG salary received by each employee 

SELECT 
    e.emp_id,
    e.emp_name, 
    AVG(s.salary)
FROM
challenge_50.clean_salaries s
JOIN challenge_50.clean_employees e
ON
s.emp_id = e.emp_id,e.emp_id
GROUP BY e.emp_id,e.emp_name;


-- Find maximum salary received by each employee 

SELECT 
    e.emp_id,
    e.emp_name, 
    MAX(s.salary)
FROM
challenge_50.clean_salaries s
JOIN challenge_50.clean_employees e
ON
s.emp_id = e.emp_id
GROUP BY e.emp_id,e.emp_name