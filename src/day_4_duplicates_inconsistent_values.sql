
-- TASK 1 DELETE DUPLICATE FROM TABLE challenge_50.clean_employees

DELETE FROM challenge_50.clean_employees
WHERE ctid IN 
    (WITH duplicates AS 
    (
    SELECT ctid,emp_id,emp_name,
        ROW_NUMBER() OVER(PARTITION BY emp_id,emp_name) as rownum
    FROM challenge_50.clean_employees
    ) SELECT ctid FROM duplicates
    WHERE rownum >1); 

-- DELETE DUPLICATE FROM TABLE challenge_50.clean_salaries
DELETE FROM challenge_50.clean_salaries
WHERE ctid IN(
WITH salaries_dup AS(
SELECT ctid,salary_id,
ROW_NUMBER() OVER(PARTITION BY salary_id) as rownum
FROM challenge_50.clean_salaries)
SELECT ctid FROM salaries_dup
WHERE rownum > 1);




-- DELETE DUPLICATE FROM TABLE challenge_50.clean_performance

DELETE FROM challenge_50.clean_performance
WHERE ctid IN (
WITH perform_dup AS(
SELECT ctid,emp_id,rating_2022,rating_2023,rating_2024,
ROW_NUMBER() OVER(PARTITION BY emp_id,rating_2022,rating_2023,rating_2024) AS rownum
FROM challenge_50.clean_performance)
SELECT ctid FROM perform_dup
WHERE rownum > 1);


-- TASK 2 HANDLE inconsistent VALUES

-- Standardizing inconsistent VALUES OF TABLE EMPLOYEE ,DEPARTMENTS,AND ATTENDANCE

SELECT DISTINCT(dept_name) 
FROM challenge_50.clean_departments;

UPDATE challenge_50.clean_departments
SET dept_name = TRIM(UPPER(dept_name));


SELECT DISTINCT(status)
FROM challenge_50.clean_attendance;

UPDATE challenge_50.clean_attendance
SET status = TRIM(INITCAP(status));


SELECT DISTINCT(city) FROM challenge_50.clean_employees;

UPDATE challenge_50.clean_employees
SET city = TRIM(INITCAP(city)),
    emp_name = TRIM(INITCAP(emp_name));


UPDATE challenge_50.clean_employees
SET city = (CASE 
            WHEN city IN ('Dlhi','New Delhi','Dlehi Ncr') THEN 'Dlehi'
            WHEN city IN('Hydbd') THEN 'Hyderabad'
            WHEN city IN('Bangalore') THEN 'Bengaluru'
            ELSE city
            END);

