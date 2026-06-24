

-- Categorize employees based on salary (Low /Medium / High)

SELECT 
    emp_id,
    salary,
    (CASE WHEN salary < 30000 THEN 'LOW'
        WHEN salary BETWEEN 30000 AND 60000 THEN 'MEDIUM'
        wHEN salary > 60000 THEN 'HIGH'
        ELSE 'N/A'
        END
    ) AS categories
FROM challenge_50.clean_salaries;


--• Categorize employees based on performance rating (Good/Average/Poor)

SELECT emp_id,
(
    CASE WHEN ((rating_2022+rating_2023+rating_2024)/3)>=4 THEN 'GOOD'
        WHEN ((rating_2022+rating_2023+rating_2024)/3)>=3 THEN 'AVERAGE'
        ELSE 'POOR'
        END
) AS performance_categories
FROM challenge_50.clean_performance;


-- • Categorize employees based on attendance status (Active /Inactive)



SELECT emp_id,
(
    CASE WHEN status = 'Present'THEN 'Active'
    ELSE 'inactive'
    END
)
FROM challenge_50.clean_attendance;


-- • Categorize employees based on experience level (Fresher / Mid-Level / Experienced)


SELECT 
emp_id,
clean_hire_date,
(
    CASE WHEN EXTRACT(YEAR FROM AGE(NOW(),clean_hire_date)) <2 THEN 'Fresher'
        WHEN EXTRACT(YEAR FROM AGE(NOW(),clean_hire_date)) BETWEEN 2 AND 5 THEN 'Mid-Level'
        WHEN EXTRACT(YEAR FROM AGE(NOW(),clean_hire_date)) > 5 THEN 'Experienced'
        END
) AS experience_level
FROM challenge_50.clean_employees;