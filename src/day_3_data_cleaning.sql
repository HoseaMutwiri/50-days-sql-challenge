
-- DAY 3 TASK 1 
-- HANDLE NULL + EMPTY VALUES

-- WHERE EMP NAME IS EMPTY OR NULL REPLACE WITH UNKNOWN

UPDATE challenge_50.clean_employees
SET emp_name = 'UNKNOWN'
WHERE (emp_name::VARCHAR IS NULL) OR (TRIM(emp_name::VARCHAR) = '');


-- WHERE EMP_ID = 13 REPLACE CITY WITH DELHI

UPDATE challenge_50.clean_employees
SET city = 'Delhi'
WHERE emp_id = 13;


-- WHERE CITY IS EMPTY OR NULL REPLACE WITH Dlehi NCR

UPDATE challenge_50.clean_employees
SET city = 'Dlehi NCR'
WHERE (city::VARCHAR IS NULL) OR (TRIM(city::VARCHAR) = '');


-- PERFORMAMCE TABLE WHERE RATING 2023 IS NULL OR EMPTY REPLACE WITH 0

UPDATE challenge_50.clean_performance
SET rating_2023 = 0
WHERE (rating_2023::VARCHAR IS NULL) OR (TRIM(rating_2023::VARCHAR) = '');



-- ============================================================================

--TASK 2 
-- Find Duplicate RoWS

-- ============================================================================
-- Table employees has duplicates

SELECT emp_id,emp_name,COUNT(*) AS count FROM challenge_50.clean_employees
GROUP BY emp_id,emp_name
HAVING COUNT(*) > 1;



-- TABLE DEPARTMENTS HAS NO DUPLICATES
SELECT dept_id,dept_name,COUNT(*) AS count FROM challenge_50.clean_departments
GROUP BY dept_id,dept_name
HAVING COUNT(*) > 1;


-- TABLE DEPARTMENTS HAS NO DUPLICATES
        
SELECT attendance_id,COUNT(*) AS count_dup
FROM challenge_50.clean_attendance
GROUP BY attendance_id
HAVING COUNT(*) > 1;

-- TABLE SALARIES HAS DUPLICATES

SELECT salary_id,COUNT(*) AS count_dub
FROM challenge_50.clean_salaries
GROUP BY salary_id,emp_id
HAVING COUNT(*) > 1;