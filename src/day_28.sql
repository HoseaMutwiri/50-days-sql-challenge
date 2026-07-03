

-- Find top 2 highest paid employees in each department
SELECT 
        emp_id,
        dept_id,
        salary,
        salary_rank_by_dept
FROM
(
    SELECT 
        e.emp_id,
        e.dept_id,
        s.salary,
        DENSE_RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary DESC) salary_rank_by_dept
    FROM challenge_50.clean_employees e
    JOIN challenge_50.clean_salaries s
    ON s.emp_id = e.emp_id
)
WHERE salary_rank_by_dept IN (1,2);



-- Calculate salary gap(difference between current salary and previous salary)

SELECT
    salary_id,
    emp_id,
    salary,
    clean_salary_date,
    LAG(salary,1,0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date) previous_salary,
    (salary - (LAG(salary,1,0) OVER(PARTITION BY emp_id ORDER BY clean_salary_date))) salary_difference
FROM challenge_50.clean_salaries;


-- Calculate performance gap(change in performance between years)

SELECT 
    emp_id,
    rating_2022,
    rating_2023,
    rating_2024,
    (rating_2023-rating_2022) performance_change_2022_and_2023,
    (rating_2024-rating_2023) performance_change_2023_and_2024
FROM challenge_50.clean_performance;


-- Filter only top performers based on ranking
WITH cte AS
(
    SELECT 
        emp_id,
        rating_2022,
        rating_2023,
        rating_2024,
        ((rating_2022+rating_2023+rating_2024)/3) avg_rating,
        DENSE_RANK() OVER(ORDER BY ((rating_2022+rating_2023+rating_2024)/3) DESC) performance_rank
    FROM challenge_50.clean_performance
)
SELECT 
    emp_id,
    avg_rating,
    performance_rank
FROM cte
LIMIT 10;