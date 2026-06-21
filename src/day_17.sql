
--List employees with more than 2 salary records

SELECT emp_id ,COUNT(*) AS emp_count FROM
challenge_50.clean_salaries
GROUP BY emp_id
HAVING COUNT(*) >2;

-- List departments with more than 3employees

SELECT 
    dept_id,
    COUNT(*) 
FROM challenge_50.clean_employees
GROUP BY dept_id
HAVING COUNT(*) >3
ORDER BY dept_id;


-- List employees with total salary greater than 100000


SELECT 
    emp_id,
    sum(salary) AS total_salary
FROM challenge_50.clean_salaries
GROUP BY emp_id
HAVING sum(salary)> 100000
ORDER BY emp_id;


-- List departments with high average salary (greater than 50000)

SELECT 
    emp_id,
    ROUND(AVG(salary),2) AS avg_salary
FROM challenge_50.clean_salaries
GROUP BY emp_id
HAVING AVG(salary)> 50000
ORDER BY emp_id;