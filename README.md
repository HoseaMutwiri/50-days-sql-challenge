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

# Data Cleaning Documentation: Date Standardization Pipeline

## Project Overview
This document outlines the SQL migration strategy used to standardize messy date text columns into native, clean PostgreSQL `DATE` types within the `challenge_50` schema. The pipeline targets two major tables: `clean_employees` and `clean_attendance`.

---

## 🧼 1. Table: challenge_50.clean_employees

### Initial Verification
To inspect the initial state, shape, and raw text formats of the employee data:
```sql
SELECT * FROM challenge_50.clean_employees;
```

### Structural Modification
Added a native `DATE` column to store verified, properly structured records without altering original string columns:
```sql
ALTER TABLE challenge_50.clean_employees
ADD COLUMN clean_hire_date DATE;
```

### Transformation & Transformation Logic
Populated the new column using regex verification and explicit data range filtering to prevent standard out-of-range errors:
```sql
UPDATE challenge_50.clean_employees
SET clean_hire_date = CASE
    -- Safety Check: Flags impossible months (>12) or days (>31) directly as NULL
    WHEN SUBSTRING(hire_date FROM 6 FOR 2)::INT > 12 OR SUBSTRING(hire_date FROM 9 FOR 2)::INT > 31 THEN NULL
    
    -- Format Matching & Parsing
    WHEN hire_date ~ '^\d{4}-\d{2}-\d{2}\$' THEN TO_DATE(hire_date, 'YYYY-MM-DD')
    WHEN hire_date ~ '^\d{2}/\d{2}/\d{4}\$' THEN TO_DATE(hire_date, 'MM/DD/YYYY')
    WHEN hire_date ~ '^\d{2}-\d{2}-\d{4}\$' THEN TO_DATE(hire_date, 'DD-MM-YYYY')
    
    -- Fallback for unreadable or blank strings
    ELSE NULL
END;
```
---
## Day 6: Data Cleaning
### Objective: Date format fixing
### Task completed
* Identified inconsistent date formats in multiple columns (salary_date, attendance_date, hire_date)
* Detected invalid values (e.g., wrong month, incomplete year, incorrect patterns)
* Replaced incorrect dates with NULL to avoid misleading data
* Standardized all valid dates into a uniform format (YYYY-MM-DD)
* Ensured consistency across all date-related columns