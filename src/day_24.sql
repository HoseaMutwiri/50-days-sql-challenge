

-- Show current salary along with next salary for each employee


SELECT 
    emp_id,
    salary_id,
    clean_salary_date,
    salary,
    LEAD(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) as next_salary
FROM challenge_50.clean_salaries;


-- Compare current salary with next salary for growth analysiS


SELECT 
    emp_id,
    salary_id,
    clean_salary_date,
    salary,
    next_salary,
    CONCAT(ROUND((((next_salary - salary)/salary)*100),2),'%') as salary_growth
FROM
(   
    SELECT 
        emp_id,
        salary_id,
        clean_salary_date,
        salary,
        LEAD(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) as next_salary
    FROM challenge_50.clean_salarieS
);


-- Predict attendance trend by comparing current and next status

SELECT
    attendance_id,
    emp_id,
    clean_attendance_date,
    status,
    LEAD(status) OVER(PARTITION BY emp_id ORDER BY clean_attendance_date) as next_attandance_status
FROM challenge_50.clean_attendance;