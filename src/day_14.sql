
--List employees earning more than the department average salary.

SELECT 
    e.dept_id,
    e.emp_name,
    s.salary 
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id
WHERE salary >
    (SELECT 
    AVG(s2.salary )
    FROM challenge_50.clean_employees e2
    JOIN challenge_50.clean_salaries s2
    ON s2.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id
    )

--List employees whose salary is equal to the highest salary in their department.

SELECT 
    e.dept_id,
    e.emp_name,
    s.salary 
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id
WHERE salary =
    (SELECT 
    MAX(s2.salary )
    FROM challenge_50.clean_employees e2
    JOIN challenge_50.clean_salaries s2
    ON s2.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id
    )

--List all employees whose salary is equal to the lowest salary in their department.

SELECT 
    e.dept_id,
    e.emp_name,
    s.salary 
FROM challenge_50.clean_employees e
JOIN challenge_50.clean_salaries s
ON s.emp_id = e.emp_id
WHERE salary =
    (SELECT 
    MIN(s2.salary )
    FROM challenge_50.clean_employees e2
    JOIN challenge_50.clean_salaries s2
    ON s2.emp_id = e2.emp_id
    WHERE e2.dept_id = e.dept_id
    )
