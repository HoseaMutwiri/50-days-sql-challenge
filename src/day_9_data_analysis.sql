

-- Show only employees who have valid department


SELECT e.emp_id,e.emp_name,d.dept_name FROM challenge_50.clean_employees e
INNER JOIN challenge_50.clean_departments d
ON d.dept_id=e.dept_id;



-- Show all employees (even without department)

SELECT e.emp_id,e.emp_name,d.dept_name FROM challenge_50.clean_employees e
FULL OUTER JOIN challenge_50.clean_departments d
ON d.dept_id=e.dept_id;

--Find Employees Without Department

SELECT e.emp_id,e.emp_name,d.dept_name FROM challenge_50.clean_employees e
FULL OUTER JOIN challenge_50.clean_departments d
ON d.dept_id=e.dept_id
WHERE dept_name IS NULL;


--Find: Who earns how much

SELECT e.emp_id,e.emp_name,s.salary FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON e.emp_id = s.emp_id
WHERE e.emp_name IS NOT NULL AND e.emp_name !='UNKNOWN'
ORDER BY e.emp_id
;


-- Find the records where the emp_name is 'unknown'

SELECT e.emp_id,e.emp_name,s.salary FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON e.emp_id = s.emp_id
WHERE e.emp_name IS NULL OR e.emp_name ='Unknown'
ORDER BY e.emp_id
;