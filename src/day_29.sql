

-- Find latest salary per employee along with total salary till that point
SELECT
emp_id,
clean_salary_date,
salary,
running_salary
FROM
(       SELECT 
        emp_id,
        salary_id,
        clean_salary_date,
        salary,
        ROW_NUMBER() OVER(PARTITION BY emp_id ORDER BY clean_salary_date) as rank_by_latest_salary,
        SUM(salary) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) as running_salary
    FROM challenge_50.clean_salaries
) AS main_data
WHERE rank_by_latest_salary = 1 ;

-- Rank employees based on salary and compare with department average salary
SELECT
    emp_id,
    clean_salary_date,
    dept_id,
    salary,
    dept_avg_salary,
    salary_diff_btwn_dept_avg_and_latest_salary
FROM
(SELECT 
    e.emp_id,
    s.clean_salary_date,
    e.dept_id,
    s.salary,
    ROW_NUMBER() OVER(
        PARTITION BY s.emp_id 
        ORDER BY clean_salary_date
        ) 
        AS rank_by_latest_salary,
    ROUND(AVG(s.salary) OVER(PARTITION BY e.dept_id),2) as dept_avg_salary,
    (ROUND(AVG(s.salary) OVER(PARTITION BY e.dept_id),2)-salary) salary_diff_btwn_dept_avg_and_latest_salary
FROM challenge_50.clean_salaries s
JOIN challenge_50.clean_employees e
ON e.emp_id = s.emp_id
)
WHERE rank_by_latest_salary = 1;


-- Check whether salary has increased or decreased compared to previous record

SELECT 
    emp_id, 
    salary_id, 
    clean_salary_date, 
    salary, 
    
    -- Next salary amount
    LEAD(salary, 1, 0) OVER(
        PARTITION BY emp_id 
        ORDER BY clean_salary_date
    ) AS latest_salary, 
    
    -- Salary trend comparison
    CASE 
        WHEN LEAD(salary, 1, 0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) > salary 
             AND LEAD(salary, 1, 0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) != 0 
             THEN 'Increased' 
             
        WHEN LEAD(salary, 1, 0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) < salary 
             AND LEAD(salary, 1, 0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) != 0 
             THEN 'Decreased' 
             
        WHEN LEAD(salary, 1, 0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) = salary 
             THEN 'No change' 
             
        WHEN LEAD(salary, 1, 0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) = 0 
             THEN 'No previous salary' 
    END AS salary_comparison 
    
FROM challenge_50.clean_salaries;
