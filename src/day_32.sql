-- Create employee view to store reusable employee details

CREATE VIEW challenge_50.employees_view AS
SELECT
    emp_id,
    emp_name,
    city,
    dept_id
FROM 
    challenge_50.clean_employees;


-- Create Salary view to store Salary-related data

CREATE VIEW challenge_50.salary_view AS
SELECT 
    emp_id,
    salary,
    clean_salary_date
FROM 
    challenge_50.clean_salaries;

-- Create joined view combining employee and salary details

CREATE VIEW challenge_50.emp_salary_view AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary
FROM 
    challenge_50.clean_employees e
JOIN 
    challenge_50.clean_salaries s ON e.emp_id = s.emp_id;

-- Use created view to filter employees with salary greater than 50000

SELECT 
    emp_id,
    emp_name,
    salary
FROM 
    challenge_50.emp_salary_view
WHERE 
    salary > 50000

