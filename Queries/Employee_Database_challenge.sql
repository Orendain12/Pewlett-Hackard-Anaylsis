-- Deliverable 1


-- create a Retirement Titles table that holds all the titles of employees
-- who were born between January 1, 1952 and December 31, 1955.


-- Step 1, create a table with the Retiring Employees by Title
-- Aliases is used  to improve code efficency

SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date, 
	t.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Check results
SELECT * FROM retirement_titles;



-- Step 2
-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Check results
SELECT * FROM unique_titles;



-- Step 3
-- Count how many people by title
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

-- Check results
SELECT * FROM retiring_titles;



-- Deliverable 2


-- create a mentorship-eligibility table that holds the current employees who were born
-- between January 1, 1965 and December 31, 1965.


-- Step 1
--create a Mentorship Eligibility table that holds the employees who are eligible
-- to participate in a mentorship program.

-- Aliases is used  to improve code efficency

-- 'SELECT DISTINCT ON' is used to avoid duplicates
-- The clause 'AND (de.to_date = '9999-01-01')' is used to include only current employees

SELECT DISTINCT ON (e.emp_no) 
    e.emp_no,
	e.first_name,
    e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, t.from_date DESC;

SELECT * FROM mentorship_eligibilty;





