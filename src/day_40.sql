

-- Set the schema search path
SET search_path TO challenge_50;

-- Create temporary table for employee salary summary
CREATE TEMPORARY TABLE temporary_salary_table (
    emp_id INT, 
    total_salary NUMERIC(10, 2)
);


-- Insert aggregated salary data into temporary table

INSERT INTO temporary_salary_table(emp_id,total_salary)
SELECT 
    emp_id,
    SUM(salary)
FROM 
    challenge_50.clean_salaries
GROUP BY emp_id;

-- Join temporary table with employee table to fetch employee details
select * from temporary_salary_table;

SELECT e.emp_id, e.emp_name, t.total_salary
FROM challenge_50.clean_employees e
JOIN temporary_salary_table t
ON e.emp_id = t.emp_id;


-- Drop temporary table after usage

DROP TABLE temporary_salary_table;