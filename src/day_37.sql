

-- Create procedure with IF condition to return message based on salary

CREATE OR REPLACE PROCEDURE check_salary(IN employee_id INT,INOUT p_result TEXT DEFAULT '')

LANGUAGE plpgsql
AS $$
DECLARE
    v_salary NUMERIC;
BEGIN
    SELECT salary INTO v_salary
    FROM 
        challenge_50.clean_salaries
    WHERE 
        emp_id = employee_id;

    IF NOT FOUND THEN 
        p_result := 'Employee ID not found';
    RETURN;
    END IF;

    IF v_salary > 50000 THEN
        p_result := 'High salary';

    ELSE 
        p_result := 'Low salary';
    END IF;

END;
$$;

CALL check_salary(200);

-- Create procedure with CASE statement to categorize employees(High/Medium/Low)



CREATE OR REPLACE PROCEDURE salary_category(INOUT p_result REFCURSOR)

LANGUAGE plpgsql

AS $$

BEGIN

OPEN p_result FOR
SELECT emp_id,
salary,
CASE WHEN salary >= 70000 THEN 'High'
    WHEN salary < 70000 AND salary > 40000 THEN 'Medium'
    WHEN salary <= 40000 THEN 'Low'
END
FROM challenge_50.clean_salaries;

END;
$$;


BEGIN;
CALL salary_category('my_data');
FETCH ALL FROM my_data;
COMMIT;



-- Create procedure with aggregation to calculate total salary per employee

CREATE OR REPLACE PROCEDURE total_salary(INOUT p_results REFCURSOR)
LANGUAGE plpgsql

AS $$

BEGIN

OPEN p_results FOR
SELECT 
    emp_id,
    SUM(salary) AS total_salary_per_employee
FROM challenge_50.clean_salaries
GROUP BY emp_id
ORDER BY 2 DESC;

END;
$$;


BEGIN;
CALL total_salary('my_data2');
FETCH ALL FROM my_data2;
COMMIT;
