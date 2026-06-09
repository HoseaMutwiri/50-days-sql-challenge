-- DAY 5 TASKS
-- Objective
-- Identify and fix logically incorrect or invalid values in the dataset

-- Detected invalid values from challenge_50.clean_performance

SELECT * FROM challenge_50.clean_performance
WHERE rating_2022 < 0 OR rating_2022 > 5
OR
rating_2023 < 0 OR rating_2023 > 5
OR
rating_2024 < 0 OR rating_2024 > 5;


SELECT * FROM challenge_50.clean_employees
WHERE age<18 OR age>65

-- Replaced incorrect values using client-provided data
-- The VALUES Expression Update

UPDATE challenge_50.clean_employees AS e
SET age = v.new_age
FROM (VALUES
    (20, 32),
    (24, 28),
    (44, 35),
    (65, 40),
    (66, 30),
    (67, 27),
    (110, 38),
    (134, 29),
    (147, 33),
    (188, 36),
    (216, 31),
    (223, 26),
    (266, 42),
    (295, 34),
    (318, 28),
    (347, 37),
    (360, 39),
    (387, 25),
    (420, 41),
    (428, 33),
    (440, 29),
    (460, 36),
    (466, 27),
    (469, 32),
    (471, 35)
) AS v(emp_id, new_age)
WHERE e.emp_id = v.emp_id;


-- Replaced incorrect values using client-provided data
-- The VALUES Expression Update


UPDATE challenge_50.clean_salaries AS s
SET salary = v.new_salary
FROM (VALUES
    (463, 55000),
    (142, 60000),
    (100, 45000),
    (30, 70000),
    (54, 52000),
    (310, 48000),
    (183, 51000),
    (168, 47000),
    (126, 46000),
    (206, 58000),
    (76, 49000),
    (433, 62000),
    (43, 53000),
    (324, 55000),
    (226, 51000),
    (113, 50000),
    (273, 52000),
    (200, 48000),
    (160, 47000),
    (42, 46000),
    (150, 49000),
    (45, 53000),
    (65, 54000),
    (488, 60000),
    (8, 45000),
    (121, 50000),
    (78, 47000),
    (94, 46000),
    (353, 52000)
) AS v(emp_id,new_salary)
WHERE s.emp_id=v.emp_id;
