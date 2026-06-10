

SELECT * FROM challenge_50.clean_salaries
WHERE salary >(SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary) FROM challenge_50.clean_salaries)


UPDATE challenge_50.clean_salaries AS s
SET salary = n.salary
FROM (VALUES
    (17,35,65000),
    (37,262,97000)
) AS n(salary_id,emp_id,salary)
WHERE s.salary_id = n.salary_id
