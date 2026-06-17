-- List employees earning more than average salary


SELECT e.emp_name FROM challenge_50.clean_employees e
WHERE e.emp_id IN
    (SELECT s.emp_id FROM challenge_50.clean_salaries s
    WHERE s.salary > (SELECT AVG(s.salary) FROM challenge_50.clean_salaries s))


-- List employees with salary equal to maximum salary

SELECT e.emp_name FROM challenge_50.clean_employees e
WHERE e.emp_id = ALL
    (SELECT s.emp_id FROM challenge_50.clean_salaries s
    WHERE s.salary = (SELECT MAX(s.salary) FROM challenge_50.clean_salaries s))


-- List employees earning less than average

SELECT e.emp_name FROM challenge_50.clean_employees e
WHERE e.emp_id IN
    (SELECT s.emp_id FROM challenge_50.clean_salaries s
    WHERE s.salary < (SELECT AVG(s.salary) FROM challenge_50.clean_salaries s))


-- List employees with minimum salary


SELECT e.emp_name FROM challenge_50.clean_employees e
WHERE e.emp_id = ALL
    (SELECT s.emp_id FROM challenge_50.clean_salaries s
    WHERE s.salary = (SELECT MIN(s.salary) FROM challenge_50.clean_salaries s))