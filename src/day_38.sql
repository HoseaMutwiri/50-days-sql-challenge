
-- Create BEFORE UPDATE trigger to prevent negative salary updates

CREATE OR REPLACE FUNCTION challenge_50.prevent_negative_salary()

RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary < 0 THEN
        NEW.salary := OLD.salary;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER salary_update_trigger
BEFORE UPDATE
ON
challenge_50.clean_salaries
FOR EACH ROW
EXECUTE FUNCTION challenge_50.prevent_negative_salary();


UPDATE challenge_50.clean_salaries
SET salary = -50000
WHERE emp_id = 164;


SELECT * FROM challenge_50.clean_salaries
WHERE emp_id = 164;




-- Create AFTER INSERT trigger to log attendance records automatically
CREATE OR REPLACE FUNCTION challenge_50.attendance_logs_update()
RETURNS TRIGGER AS $$
BEGIN
CREATE TABLE IF NOT EXISTS challenge_50.attendance_logs (
    attendance_id INT,
    emp_id INT,
    status VARCHAR(50),
    clean_attendance_date DATE,
    MESSAGE TEXT);
INSERT INTO challenge_50.attendance_logs(
    attendance_id,
    emp_id,
    status,
    clean_attendance_date,
    MESSAGE)
    VALUES(NEW.attendance_id,NEW.emp_id,NEW.status,NEW.clean_attendance_date,'attendance added');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER attendance_insert_trigger
AFTER INSERT
ON
challenge_50.clean_attendance
FOR EACH ROW
EXECUTE FUNCTION challenge_50.attendance_logs_update();


-- Store attendance activity inside attendance_logs table

INSERT INTO challenge_50.clean_attendance VALUES(2000,101,'Present','2026-07-13')


-- Test trigger execution using UPDATE and INSERT operations

UPDATE challenge_50.clean_salaries
SET salary = -50000
WHERE emp_id = 164;

SELECT * FROM challenge_50.clean_salaries
WHERE emp_id = 164;



SELECT * FROM challenge_50.attendance_logs;

