
-- FIX DATA FORMAT ISSUE IN ALL DATA COLUMNS
-- viewing the table 
SELECT * FROM challenge_50.clean_employees


-- ADDING A NEW DATE COLUMN(clean_hire_date)

ALTER TABLE challenge_50.clean_employees
ADD COLUMN clean_hire_date DATE;


-- INSERT DATES VALUES IN THE NEWLY ADDED COLUMN

UPDATE challenge_50.clean_employees
SET clean_hire_date = CASE
    WHEN SUBSTRING(hire_date FROM 6 FOR 2)::INT > 12 OR SUBSTRING(hire_date FROM 9 FOR 2)::INT > 31 THEN NULL
    WHEN hire_date ~ '^\d{4}-\d{2}-\d{2}$' THEN TO_DATE(hire_date, 'YYYY-MM-DD')
    WHEN hire_date ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(hire_date, 'MM/DD/YYYY')
    WHEN hire_date ~ '^\d{2}-\d{2}-\d{4}$' THEN TO_DATE(hire_date, 'DD-MM-YYYY')
    ELSE NULL
    END;


-- VIEWING TABLE challenge_50.clean_attendance

SELECT * FROM challenge_50.clean_attendance


-- ADDING A NEW DATE COLUMN(clean_attendance_date)


ALTER TABLE challenge_50.clean_attendance
ADD COLUMN clean_attendance_date DATE;

-- INSERT DATES VALUES IN THE NEWLY ADDED COLUMN

UPDATE challenge_50.clean_attendance
SET clean_attendance_date = CASE
    WHEN SUBSTRING(attendance_date FROM 6 FOR 2)::INT > 12 OR SUBSTRING(attendance_date FROM 9 FOR 2)::INT > 31 THEN NULL
    WHEN attendance_date ~ '^\d{4}-\d{2}-\d{2}$' THEN TO_DATE(attendance_date, 'YYYY-MM-DD')
    WHEN attendance_date ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(attendance_date, 'MM/DD/YYYY')
    WHEN attendance_date ~ '^\d{2}-\d{2}-\d{4}$' THEN TO_DATE(attendance_date, 'DD-MM-YYYY')
    ELSE NULL
    END;



-- VIEWING TABLE challenge_50.clean_salaries

SELECT * FROM challenge_50.clean_salaries

-- ADDING A NEW DATE COLUMN(clean_salary_date)

ALTER TABLE challenge_50.clean_salaries
ADD COLUMN clean_salary_date DATE;

-- INSERT DATES VALUES IN THE NEWLY ADDED COLUMN

UPDATE challenge_50.clean_salaries
SET clean_salary_date = CASE
    WHEN SUBSTRING(salary_date FROM 6 FOR 2)::INT > 12 OR SUBSTRING(salary_date FROM 9 FOR 2)::INT > 31 THEN NULL
    WHEN salary_date ~ '^\d{4}-\d{2}-\d{2}$' THEN TO_DATE(salary_date, 'YYYY-MM-DD')
    WHEN salary_date ~ '^\d{2}/\d{2}/\d{4}$' THEN TO_DATE(salary_date, 'MM/DD/YYYY')
    WHEN salary_date ~ '^\d{2}-\d{2}-\d{4}$' THEN TO_DATE(salary_date, 'DD-MM-YYYY')
    ELSE NULL
    END;