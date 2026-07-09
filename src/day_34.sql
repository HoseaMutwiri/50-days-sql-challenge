

-- Create index on emp_id to speed up employee search


CREATE INDEX 
    idx_emp_id 
ON 
    challenge_50.clean_employees(emp_id)

-- Create index on deptid for faster department-based filtering

CREATE INDEX 
    idx_dept_id 
ON 
    challenge_50.clean_departments(dept_id)

-- Create composite index on (emp_id, salary_date) for optimized multi-column queries


CREATE INDEX 
    idx_emp_id_salary_date
ON 
    challenge_50.clean_salaries(emp_id,clean_salary_date)