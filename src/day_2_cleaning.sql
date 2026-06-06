

-- DAY 2 TASK 2
-- FIND MISSING VALUES(NULL & EMPTY)


--NULL VALUES OR EMPTY VALUES IN CLEAN DEPARTMENT TABLE

SELECT * FROM challenge_50.clean_departments
WHERE dept_id::VARCHAR IS NULL OR TRIM(dept_id::VARCHAR) = ''
OR dept_name::VARCHAR IS NULL OR TRIM(dept_name::varchar) = '';
    
--NULL VALUES OR EMPTY VALUES IN CLEAN EMPLOYEES TABLE

SELECT * FROM challenge_50.clean_employees
WHERE emp_id::VARCHAR IS NULL OR TRIM(emp_id::VARCHAR) = ''
OR emp_name::VARCHAR IS NULL OR TRIM(emp_name::VARCHAR) = ''
OR age::VARCHAR IS NULL OR TRIM(age::VARCHAR) = ''
OR city::VARCHAR IS NULL OR TRIM(city::VARCHAR) = ''
OR dept_id::VARCHAR IS NULL OR TRIM(dept_id::VARCHAR) = ''
OR hire_date::VARCHAR IS NULL OR TRIM(hire_date::VARCHAR) = '';


--NULL VALUES OR EMPTY VALUES IN CLEAN SALARIES TABLE

SELECT * FROM challenge_50.clean_salaries
WHERE salary_id::VARCHAR IS NULL OR TRIM(salary_id::VARCHAR) = ''
OR emp_id::VARCHAR IS NULL OR TRIM(emp_id::VARCHAR) = ''
OR salary::VARCHAR IS NULL OR TRIM(salary::VARCHAR) = ''
OR salary_date::VARCHAR IS NULL OR TRIM(salary_date::VARCHAR) = '';


--NULL VALUES OR EMPTY VALUES IN CLEAN attendance TABLE

SELECT * FROM challenge_50.clean_attendance
WHERE attendance_id::VARCHAR IS NULL OR TRIM(attendance_id::VARCHAR) = ''
OR emp_id::VARCHAR IS NULL OR TRIM(emp_id::VARCHAR) = ''
OR attendance_date::VARCHAR IS NULL OR TRIM(attendance_date::VARCHAR) = ''
OR status::VARCHAR IS NULL OR TRIM(status::VARCHAR) = '';



--NULL VALUES OR EMPTY VALUES IN CLEAN PERFORMANCE TABLE


SELECT * FROM challenge_50.clean_performance
WHERE rating_2022::VARCHAR IS NULL OR TRIM(rating_2022::VARCHAR) = ''
OR emp_id::VARCHAR IS NULL OR TRIM(emp_id::VARCHAR) = ''
OR rating_2023::VARCHAR IS NULL OR TRIM(rating_2023::VARCHAR) = ''
OR rating_2024::VARCHAR IS NULL OR TRIM(rating_2024::VARCHAR) = '';