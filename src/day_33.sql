

---Update employee data using a view

CREATE VIEW challenge_50.emp_basic AS
SELECT emp_id, emp_name,city
FROM challenge_50.clean_employees


SELECT * FROM challenge_50.emp_basic
WHERE emp_id = 110;

UPDATE challenge_50.emp_basic
SET city = 'Mumbai'
WHERE emp_id = 110;

-- Create view for high salary employees(salary>50000)and fetch data from it

CREATE VIEW challenge_50.high_salaries AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id = s.emp_id
WHERE 
    s.salary > 50000;


-- Create multi-table view combining employee, department, and salary

CREATE VIEW challenge_50.multi_table AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.dept_id,
    d.dept_name,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id = s.emp_id
JOIN 
    challenge_50.clean_departments d ON d.dept_id = e.dept_id


-- Create HR dashboard view for high salary employees with department name


CREATE VIEW challenge_50.multi_table AS
SELECT 
    e.emp_name,
    d.dept_name,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id = s.emp_id
JOIN 
    challenge_50.clean_departments d ON d.dept_id = e.dept_id
WHERE 
    s.salary > 50000;