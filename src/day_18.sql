

-- employees where avg performance rating > 4


SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    ROUND(((p.rating_2022+p.rating_2023+p.rating_2023)/3),0) AS performance_avg
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_performance p
ON p.emp_id = e.emp_id
JOIN challenge_50.clean_departments d
ON d.dept_id = e.dept_id
WHERE ROUND(((p.rating_2022+p.rating_2023+p.rating_2023)/3),0) > 4;


-- employees with more than 10 present days

SELECT 
    e.emp_id,
    e.emp_name,
    COUNT(a.status) FILTER(WHERE a.status = 'Present') AS present_days
FROM challenge_50.clean_employees e
GROUP BY e.emp_id,e.emp_name
HAVING COUNT(a.status) FILTER(WHERE a.status = 'Present')>2


-- DEPARTMENT WHERE TOTAL SALARY PAID >200000
SELECT
    d.dept_id,
    d.dept_name,
    sum(s.salary)
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_departments d
ON d.dept_id = e.dept_id
JOIN challenge_50.clean_salaries s
ON e.emp_id = s.emp_id
GROUP BY d.dept_id,d.dept_name
HAVING sum(s.salary)>200000

-- EMPLOYEES WHOSE TOTAL SALARY IS >DEPT AVG SALARY

SELECT 
e.emp_id,
e.emp_name,
SUM(s.salary) 
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id,e.emp_name
HAVING SUM(s.salary)>ANY
(SELECT avg_salary FROM
    (SELECT
        d.dept_id,
        AVG(s.salary) avg_salary
    FROM challenge_50.clean_employees e
    JOIN challenge_50.clean_departments d
    ON d.dept_id = e.dept_id
    JOIN challenge_50.clean_salaries s
    ON e.emp_id = s.emp_id
    GROUP BY d.dept_id))