

-- Fix Space Issue (emp_name)


UPDATE challenge_50.clean_employees
SET emp_name = TRIM(emp_name);


-- FIXING DATA TYPES

ALTER TABLE challenge_50.clean_departments
ALTER COLUMN dept_id TYPE INT,
ALTER COLUMN dept_name TYPE VARCHAR(20);

-- checking the data types changes

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'challenge_50' AND table_name ='clean_departments';

-- FIXING DATA TYPES

ALTER TABLE challenge_50.clean_employees
    ALTER COLUMN emp_id TYPE INT,
    ALTER COLUMN emp_name TYPE VARCHAR(20),
    ALTER COLUMN age TYPE INT,
    ALTER COLUMN city TYPE VARCHAR(20),
    ALTER COLUMN dept_id TYPE INT;


-- DROP COLUMN 

ALTER TABLE challenge_50.clean_employees
DROP COLUMN hire_date;



-- checking the data types changes

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'challenge_50' AND table_name ='clean_employees';



-- FIXING DATA TYPES

ALTER TABLE challenge_50.clean_salaries
    DROP COLUMN salary_date,
    ALTER COLUMN salary_id TYPE INT,
    ALTER COLUMN emp_id TYPE INT,
    ALTER COLUMN salary TYPE NUMERIC,
    ALTER COLUMN clean_salary_date TYPE DATE;


-- checking the data types changes

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'challenge_50' AND table_name ='clean_salaries';



-- FIXING DATA TYPES

ALTER TABLE challenge_50.clean_attendance
    DROP COLUMN attendance_date,
    ALTER COLUMN attendance_id TYPE INT,
    ALTER COLUMN emp_id TYPE INT,
    ALTER COLUMN status TYPE VARCHAR(30),
    ALTER COLUMN clean_attendance_date TYPE DATE;


-- checking the data types changes

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'challenge_50' AND table_name ='clean_attendance';


-- FIXING DATA TYPES

ALTER TABLE challenge_50.clean_performance
    ALTER COLUMN emp_id TYPE INT,
    ALTER COLUMN rating_2022 TYPE INT,
    ALTER COLUMN rating_2023 TYPE INT,
    ALTER COLUMN rating_2024 TYPE INT;


-- checking the data types changes

SELECT
    column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'challenge_50' AND table_name ='clean_performance';
