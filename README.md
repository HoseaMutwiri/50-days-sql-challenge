# 50 DAYS SQL - PRACTICE CHALLENGE


![CHALLENGE POSTER](datasets/results_images/qt=q_27.webp)

[Datapencil challenge](https://datapencil.org/50-days-sql-challenge)
## Day 1: Project Setup

### Objective
Set up the SQL project environment and prepare the dataset for analysis.

### Tasks Completed
- Created project folder structure (dataset, SQL_QUERIES, screenshots)
- Set up SQL database (hr_project)
- Created tables for HR dataset
- Imported messy dataset into database

### Tools Used
- PostgreSQL
- VS Code
- GitHub
- Python 3.13.3

### Outcome
Successfully completed project setup. Ready to start data cleaning and analysis from Day 2.

## Day 2: Data Audit (Messiness Detection)

### Objective
Identify data issues across all tables and columns.

### Tasks Completed
Created cleaned tables
Identified NULL and empty values

### Results/Findings
**Employees and performance** table have empty and NULL values


## Day 3: Data Cleaning (Handling Missing Values)

### Objective
Clean the dataset by handling missing values across multiple tables.

### Tasks Completed
- Created cleaned versions of tables (employees_clean, departments_clean, performance_clean)
- Converted empty values into NULL for consistency
- Replaced NULL and empty values with appropriate defaults

### Key Learning
- NULL and empty values are different but both need to be handled
- Data should not be cleaned directly in raw tables
- Business rules are important while filling missing values


## Day 4: Data Cleaning (Handling Inconsistent Text)
### Objective
* Clean the dataset by fixing inconsistent text values across columns.

### Tasks Completed
1. Identified inconsistent text formats (e.g., HR, hr, Hr)
2. Standardized text using functions like `UPPER()`, `LOWER()`, `INITCAP()`
3. Trimmed extra spaces using TRIM()
4. Replaced incorrect spellings and variations
5. Ensured uniform naming conventions across tables

### Key Learning
* Text inconsistency affects grouping and analysis
* Same values with different formats behave as different data
* Standardization is critical before applying aggregations

## Day 5: Data Cleaning (Handling Invalid Values)
### Objective
* Identify and fix logically incorrect or invalid values in the dataset.
### Tasks Completed
1. Detected invalid values (negative salary, invalid age, incorrect ratings)
2. Applied business rules to define valid ranges
3. Replaced incorrect values using client-provided data
4. Ensured no assumption-based fixes were applied
### Key Learning
* Invalid values are not always missing but logically incorrect
* Data should be corrected using trusted sources (client/system)
* Never blindly manipulate values without business context

## Day 6: Data Cleaning (Outlier Detection & Handling)
### Objective
* Identify and handle extreme values (outliers) in the dataset.

### Outlier Analysis & Updates

1. High Earners Query (Above 75th Percentile)

* This query filters the dataset to identify all employees whose salaries are strictly greater than the **75th percentile (Q3)**. It uses an aggregate subquery with `PERCENTILE_CONT` to dynamically calculate the threshold.

```sql
SELECT * 
FROM challenge_50.clean_salaries
WHERE salary > (
    SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary) 
    FROM challenge_50.clean_salaries
);
```

2. Bulk Salary Updates
* This script performs a targeted batch update on specific employee records. It uses a virtual table constructor (`VALUES`) to scale updates efficiently without executing multiple separate `UPDATE` statements.

```sql
UPDATE challenge_50.clean_salaries AS s
SET salary = n.salary
FROM (VALUES
    (17, 35, 65000),
    (37, 262, 97000)
) AS n(salary_id, emp_id, salary)
WHERE s.salary_id = n.salary_id;
```


### Key Learning
* Not all outliers are errors — some are meaningful


---
## Day 7: Data Cleaning
### Objective: Date format fixing
### Task completed
* Identified inconsistent date formats in multiple columns (salary_date, attendance_date, hire_date)
* Detected invalid values (e.g., wrong month, incomplete year, incorrect patterns)
* Replaced incorrect dates with NULL to avoid misleading data
* Standardized all valid dates into a uniform format (YYYY-MM-DD)
* Ensured consistency across all date-related columns

---
## Day 8: Data Cleaning

### Objective:Fix Datatype & Fix Space Issue

* Removed unwanted spaces using `TRIM()` to ensure consistency
* Checked data types across all tables **(employees, departments, salary, performance, attendance)**
* Converted columns to appropriate data types **(INT, VARCHAR, DATE, NUMERIC)**
* Validating data types conversion

---
## Day 9: SQL Tasks
1.  Show only employees who have a valid department
2.  Show all employees (even without department)
3.  Find employees without department
4.  Find who earns how much
5.  List salary records paid to unknown names

---

## Day 10: Joins and Data Analysis

This file contains the SQL queries for the Day 10 challenges, focusing on table joins.


**1. Question:** What are the performance ratings of each employee?

```sql
SELECT 
    e.emp_id, 
    e.emp_name, 
    p.rating_2022, 
    p.rating_2023, 
    p.rating_2024 
FROM challenge_50.clean_employees e 
JOIN challenge_50.clean_performance p ON e.emp_id = p.emp_id;
```

**2. Question:** Which employees do not have any salary records?
```sql
SELECT 
    e.emp_id, 
    e.emp_name, 
    s.salary 
FROM challenge_50.clean_employees e 
LEFT JOIN challenge_50.clean_salaries s ON s.emp_id = e.emp_id 
WHERE s.emp_id IS NULL;
```

**3. Question:** Which employees do not have any attendance records?
```sql
SELECT 
    e.emp_id, 
    e.emp_name, 
    a.status 
FROM challenge_50.clean_employees e 
LEFT JOIN challenge_50.clean_attendance a ON a.emp_id = e.emp_id 
WHERE a.emp_id IS NULL;
```

**4. Question:** What is the employee name, department, and salary together?
```sql
SELECT 
    e.emp_name, 
    d.dept_name, 
    s.salary 
FROM challenge_50.clean_employees e 
JOIN challenge_50.clean_departments d ON d.dept_id = e.dept_id 
JOIN challenge_50.clean_salaries s ON s.emp_id = e.emp_id;
```

---

## Day 11 of the 50-Day SQL Challenge.
The focus of today's challenge istable joins `(INNER JOIN and LEFT JOIN)`, data aggregation`(COUNT, SUM)`, and grouping techniques to extract meaningful employee insights.

### Tasks and Solutions

**Task 1: Employee Performance Overview**

Goal:Retrieve the employee name, department, and performance ratings for the years 2022, 2023, and 2024.

```sql
SELECT 
    e.emp_name, 
    d.dept_name, 
    p.rating_2022, 
    p.rating_2023, 
    p.rating_2024 
FROM challenge_50.clean_employees e 
JOIN challenge_50.clean_performance p ON p.emp_id = e.emp_id 
JOIN challenge_50.clean_departments d ON d.dept_id = e.dept_id;
```

**Task 2: Complete Employee Profile** 

Goal:Build a comprehensive profile for each employee, including their department, salary details, and historical performance ratings.
```sql
SELECT 
    e.emp_name, 
    d.dept_name, 
    s.salary, 
    p.rating_2022, 
    p.rating_2023, 
    p.rating_2024 
FROM challenge_50.clean_employees e 
LEFT JOIN challenge_50.clean_performance p ON p.emp_id = e.emp_id 
JOIN challenge_50.clean_departments d ON d.dept_id = e.dept_id 
JOIN challenge_50.clean_salaries s ON s.emp_id = e.emp_id;
```

**Task 3: Salary Record Count per Employee**

Goal:Determine how many individual salary history records exist for each employee, ordered by their unique employee ID.

```sql
SELECT 
    e.emp_id, 
    e.emp_name, 
    COUNT(s.salary) AS count_salary_records 
FROM challenge_50.clean_employees e 
LEFT JOIN challenge_50.clean_salaries s ON s.emp_id = e.emp_id 
GROUP BY e.emp_id, e.emp_name 
ORDER BY e.emp_id ASC;
```

**Task 4: Total Salary Expenditure per Employee**

Goal: Calculate the cumulative total salary paid out to each employee across all of their available historical records.

```sql
SELECT 
    e.emp_id, 
    e.emp_name, 
    SUM(s.salary) AS total_salary 
FROM challenge_50.clean_employees e 
LEFT JOIN challenge_50.clean_salaries s ON s.emp_id = e.emp_id 
GROUP BY e.emp_id, e.emp_name 
ORDER BY e.emp_id ASC;
```

---
## Day 12: of the 50-Day SQL Challenge.

This file contains the SQL queries for the Day 10 challenges

---

## Task 1: Average Salary by Department
**Goal:** Calculate the average salary for each department and sort the results from lowest to highest.

```sql
SELECT 
    d.dept_name, 
    ROUND(AVG(s.salary), 2) AS average_salary 
FROM challenge_50.clean_departments AS d 
JOIN challenge_50.clean_employees AS e ON e.dept_id = d.dept_id 
JOIN challenge_50.clean_salaries AS s ON s.emp_id = e.emp_id 
GROUP BY d.dept_name 
ORDER BY average_salary;
```

---

### Task 2: Employee Attendance Tracking
**Goal:** Count how many days each employee was present using a conditional block.

```sql
SELECT 
    e.emp_id, 
    e.emp_name, 
    COUNT(a.clean_attendance_date) FILTER(WHERE a.status = 'Present') AS days_present 
FROM challenge_50.clean_employees AS e 
LEFT JOIN challenge_50.clean_attendance AS a ON e.emp_id = a.emp_id 
GROUP BY e.emp_id, e.emp_name 
ORDER BY e.emp_id;
```

---

### Task 3: Department Roster Grouping
**Goal:** Collect and string-aggregate all active employee names who belong to the same department.

```sql
SELECT 
    d.dept_name,
    STRING_AGG(e.emp_name, ', ') AS employees
FROM challenge_50.clean_departments AS d 
JOIN challenge_50.clean_employees AS e ON e.dept_id = d.dept_id 
WHERE e.emp_name != 'Unknown' 
GROUP BY d.dept_name;
```

---

### Task 4: Multi Salary Record Detection
**Goal:** Identify employees who have more than one historical salary entry without using slow nested subqueries.


```sql
SELECT 
    e.emp_name 
FROM challenge_50.clean_employees AS e 
JOIN challenge_50.clean_salaries AS s ON s.emp_id = e.emp_id 
GROUP BY e.emp_id, e.emp_name 
HAVING COUNT(s.salary) > 1;
```
---
## Day 13 of the 50-Day SQL Challenge.

This challenge focuses on using nested subqueries and aggregate functions (`AVG`, `MAX`, `MIN`) to filter employee records based on salary thresholds from a separate table.

---

### 1. Employees Earning More Than Average Salary
Retrieves names of employees whose salary is strictly above the company-wide average.

```sql
-- List employees earning more than average salary 
SELECT e.emp_name 
FROM challenge_50.clean_employees e 
WHERE e.emp_id IN (
    SELECT s.emp_id 
    FROM challenge_50.clean_salaries s 
    WHERE s.salary > (
        SELECT AVG(s.salary) 
        FROM challenge_50.clean_salaries s
    )
);
```

### Concept Breakdown
* **Inner Subquery**: Calculates the statistical average salary.
* **Outer Subquery**: Filters for employee IDs associated with above-average salaries.
* **Main Query**: Matches those IDs to return human-readable employee names.

---

### 2. Employees with Maximum Salary
Retrieves names of employees who earn the absolute highest salary in the database.

```sql
-- List employees with salary equal to maximum salary 
SELECT e.emp_name 
FROM challenge_50.clean_employees e 
WHERE e.emp_id = ALL (
    SELECT s.emp_id 
    FROM challenge_50.clean_salaries s 
    WHERE s.salary = (
        SELECT MAX(s.salary) 
        FROM challenge_50.clean_salaries s
    )
);
```

### Concept Breakdown
* **Inner Subquery**: Finds the highest numeric salary value.
* **ALL Operator**: Evaluates the main query condition against every row returned by the subquery. *(Note: If multiple employees share the max salary, `= ALL` will fail. Using `IN` is safer here).*

---

### 3. Employees Earning Less Than Average Salary
Retrieves names of employees whose salary falls below the company-wide average.

```sql
-- List employees earning less than average 
SELECT e.emp_name 
FROM challenge_50.clean_employees e 
WHERE e.emp_id IN (
    SELECT s.emp_id 
    FROM challenge_50.clean_salaries s 
    WHERE s.salary < (
        SELECT AVG(s.salary) 
        FROM challenge_50.clean_salaries s
    )
);
```

### Concept Breakdown
* **Aggregate Filter**: Operates identically to the first query, but reverses the comparison logic using the less-than (`<`) operator.

---

### 4. Employees with Minimum Salary
Retrieves names of employees earning the absolute lowest salary in the database.

```sql
-- List employees with minimum salary 
SELECT e.emp_name 
FROM challenge_50.clean_employees e 
WHERE e.emp_id = ALL (
    SELECT s.emp_id 
    FROM challenge_50.clean_salaries s 
    WHERE s.salary = (
        SELECT MIN(s.salary) 
        FROM challenge_50.clean_salaries s
    )
);
```

### Concept Breakdown
* **Aggregate Filter**: Uses `MIN` to isolate the lowest pay scale record across the dataset.

---

### Core SQL Summary
* **Table Aliasing**: `clean_employees e` and `clean_salaries s` prevent column ambiguity.
* **Subquery Nesting**: Data flows from the deepest query block upward to the final `SELECT` statement.
