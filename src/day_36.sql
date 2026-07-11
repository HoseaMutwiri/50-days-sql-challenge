
-- Create a procedure to get all employee data


-- Create the Procedure
CREATE OR REPLACE PROCEDURE challenge_50.get_all_data(INOUT p_result REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_result FOR
    SELECT 
        emp_id,
        emp_name,
        age,
        city,
        dept_id
    FROM 
        challenge_50.clean_employees;
END;
$$;


-- Execute and Fetch Results (Highlight all 4 lines together)
BEGIN;
CALL challenge_50.get_all_data('my_data_cursor');
FETCH ALL FROM "my_data_cursor";
COMMIT;


-- Create a procedure with input parameter to find employee by emp_id

CREATE OR REPLACE PROCEDURE get_employee(IN emp_id_input INT,INOUT p_results REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_results FOR
    SELECT * FROM challenge_50.clean_employees
    WHERE emp_id = emp_id_input;
END;
$$;

BEGIN;
CALL get_employee(50,'my_data');
FETCH ALL FROM "my_data";
COMMIT;






-- Create a procedure using JOIN to fetch employee and salary details

CREATE OR REPLACE PROCEDURE challenge_50.get_emp_salary_data(INOUT p_result REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_result FOR
    SELECT 
        e.emp_id,
        e.emp_name,
        e.age,
        e.city,
        e.dept_id,
        e.clean_hire_date,
        s.salary,
        s.clean_salary_date
    FROM 
        challenge_50.clean_employees e
    JOIN 
        challenge_50.clean_salaries s ON e.emp_id = s.emp_id;
END;
$$;


BEGIN;
CALL challenge_50.get_emp_salary_data('my_data');
FETCH ALL FROM "my_data";
COMMIT;



-- Create a procedure for salary report (employees with salary > 50000)

CREATE PROCEDURE get_high_salaries(INOUT p_result REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN p_result FOR
    SELECT 
        e.emp_id,
        e.emp_name,
        e.age,
        e.city,
        s.salary
    FROM 
        challenge_50.clean_employees e
    JOIN 
        challenge_50.clean_salaries s ON e.emp_id = s.emp_id
    WHERE s.salary>50000;
END;
$$;


BEGIN;
CALL get_high_salaries('my_data');
FETCH ALL FROM my_data;
COMMIT;
