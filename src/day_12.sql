-- What is the average salary in each department?

SELECT 
    d.dept_name,
    round(avg(s.salary),2) AS average_salary
FROM challenge_50.clean_departments AS d
JOIN challenge_50.clean_employees AS e
ON e.dept_id = d.dept_id
JOIN challenge_50.clean_salaries AS s
ON s.emp_id = e.emp_id
GROUP BY d.dept_name
ORDER BY average_salary;

-- How many days was each employee present?

SELECT
    e.emp_id,
    e.emp_name,
COUNT(a.clean_attendance_date) FILTER(WHERE a.status = 'Present')
FROM challenge_50.clean_employees AS e
LEFT JOIN challenge_50.clean_attendance As a
ON e.emp_id = a.emp_id
GROUP BY e.emp_id,e.emp_name
ORDER BY e.emp_id



-- Which employees belong to the same department?

SELECT 
    d.dept_name,STRING_AGG(e.emp_name , ',')
FROM challenge_50.clean_departments AS d
JOIN challenge_50.clean_employees AS e
ON e.dept_id = d.dept_id
WHERE e.emp_name != 'Unknown'
GROUP BY d.dept_name;


-- Which employees have more than one salary record?

SELECT emp_name FROM
(SELECT
    e.emp_id,
    e.emp_name,
  COUNT(s.salary) AS count_salary
FROM challenge_50.clean_employees AS e
JOIN challenge_50.clean_salaries AS s
ON s.emp_id = e.emp_id
GROUP BY e.emp_id,e.emp_name)
WHERE count_salary>1