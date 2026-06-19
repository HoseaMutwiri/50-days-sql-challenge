

-- List employees with salary records (atleast once)

SELECT 
e.emp_id,
e.emp_name 
FROM challenge_50.clean_employees e
WHERE EXISTS 
    (SELECT 1 FROM challenge_50.clean_salaries s
    WHERE e.emp_id = s.emp_id)
ORDER BY e.emp_id;



-- List employees without salary records

SELECT e.emp_id,e.emp_name
FROM challenge_50.clean_employees e
WHERE NOT EXISTS 
    (SELECT 1 FROM challenge_50.clean_salaries s WHERE s.emp_id = e.emp_id)

ORDER BY e.emp_id;



-- List employees with attendance records

SELECT e.emp_id,e.emp_name
FROM challenge_50.clean_employees e
WHERE EXISTS 
    (SELECT 1 FROM challenge_50.clean_attendance a WHERE a.emp_id = e.emp_id)

ORDER BY e.emp_id;



-- List employees without attendance records


SELECT e.emp_id,e.emp_name
FROM challenge_50.clean_employees e
WHERE NOT EXISTS 
    (SELECT 1 FROM challenge_50.clean_attendance a WHERE a.emp_id = e.emp_id)

ORDER BY e.emp_id;