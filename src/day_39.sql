

-- Create BEFORE INSERT trigger to prevent negative salary insertion

-- Create the Trigger Function

CREATE OR REPLACE FUNCTION challenge_50.prevent_negative_salary_before_insert() 
RETURNS TRIGGER AS $$ 
BEGIN 
    IF NEW.salary < 0 THEN 
        NEW.salary := 0;
    END IF; 
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- Create the trigger bound to challenge_50.clean_salaries table

-- Create the Trigger

CREATE OR REPLACE TRIGGER negative_salary_insert_trigger 
BEFORE INSERT ON challenge_50.clean_salaries 
FOR EACH ROW 
EXECUTE FUNCTION challenge_50.prevent_negative_salary_before_insert();


-- Automatically convert negative salary values to 0 before inserting data
INSERT INTO challenge_50.clean_salaries 
VALUES (2500, 2004, -50000, '2026-07-14');

-- test and validate

SELECT * FROM challenge_50.clean_salaries
WHERE emp_id = 2004

-- Create AFTER UPDATE trigger to track salary changes

-- Create the log table once outside the trigger (with correct schema)
CREATE TABLE IF NOT EXISTS challenge_50.salary_update_logs (
    salary_id INT,
    employee_id INT,
    salary NUMERIC(10,2),
    clean_salary_date DATE,
    change_date TIMESTAMP,
    message TEXT
);

-- Create the Trigger Function
CREATE OR REPLACE FUNCTION challenge_50.salary_update_logs_function()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO challenge_50.salary_update_logs (salary_id, employee_id, salary, clean_salary_date, change_date, message)
    VALUES (
        OLD.salary_id,
        OLD.emp_id,
        NEW.salary,
        OLD.clean_salary_date,
        NOW(),
        'salary record updated'
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Create the Trigger

CREATE OR REPLACE TRIGGER salary_logs_trigger
AFTER UPDATE ON challenge_50.clean_salaries
FOR EACH ROW
EXECUTE FUNCTION challenge_50.salary_update_logs_function();


-- Store old salary and new salary records inside salary_logs table

-- Update the record to fire the trigger
UPDATE challenge_50.clean_salaries
SET salary = 700000
WHERE salary_id = 2;

-- View logged changes

SELECT * FROM challenge_50.salary_update_logs;


