-- DAY 1 TASK 4 CRAEATE DATA TABLES

CREATE TABLE challenge_50.employees(
    emp_id VARCHAR(30),
    emp_name VARCHAR(30),
    age VARCHAR(30),
    city VARCHAR(30),
    dept_id VARCHAR(30),
    hire_date VARCHAR(30)
);

CREATE TABLE challenge_50.departments(
    dept_id VARCHAR(30),
    dept_name VARCHAR(30)
);

CREATE TABLE challenge_50.salaries(
    salary_id VARCHAR(15),
    emp_id VARCHAR(15),
    salary VARCHAR(15),
    salary_date VARCHAR(15)
);


CREATE TABLE challenge_50.attendance(
    attendance_id VARCHAR(15),
    emp_id VARCHAR(15),
    attendance_date VARCHAR(15),
    status VARCHAR(15)
);

CREATE TABLE challenge_50.performance(
    emp_id VARCHAR(15),
    rating_2022 VARCHAR(15),
    rating_2023 VARCHAR(15),
    rating_2024 VARCHAR(15)
);


-- =============================================================

-- CLEANING DATA PREP
-- DAY 2 TASK 1 CREATE CLEANED TABLES
--==============================================================

CREATE TABLE challenge_50.clean_employees
AS SELECT * FROM challenge_50.employees;


CREATE TABLE challenge_50.clean_departments
AS SELECT * FROM challenge_50.departments;


CREATE TABLE challenge_50.clean_salaries
AS SELECT * FROM challenge_50.salaries;

CREATE TABLE challenge_50.clean_attendance
AS SELECT * FROM challenge_50.attendance;

CREATE TABLE challenge_50.clean_performance
AS SELECT * FROM challenge_50.performance;