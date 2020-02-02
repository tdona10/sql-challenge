-- Data Analysis --
-- Employee number, last name, first name, gender, and salary.
SELECT  empl.emp_no,
        empl.last_name,
        empl.first_name,
        empl.gender,
        sal.salary
FROM employees as empl
    JOIN salaries as sal
    ON (empl.emp_no = sal.emp_no)
ORDER BY empl.emp_no;

-- Employees hired in 1986
SELECT first_name, last_name,hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- For each Department Manager:department number, department name,employee number, last name, 
-- first name, and start and end employment dates.
SELECT  dmgr.dept_no,
        dept.dept_name,
        dmgr.emp_no,
        empl.last_name,
        empl.first_name,
        dmgr.from_date,
        dmgr.to_date
FROM dept_manager AS dmgr
    JOIN departments AS dept
        ON (dmgr.dept_no = dept.dept_no)
    JOIN employees AS empl
        ON (dmgr.emp_no = empl.emp_no);

-- For each employee department:employee number, last name, first name, and department name.
SELECT  empl.emp_no,
        empl.last_name,
        empl.first_name,
        dept.dept_name
FROM employees AS empl
    INNER JOIN dept_emp AS de
        ON (empl.emp_no = de.emp_no)
    INNER JOIN departments AS dept
        ON (de.dept_no = dept.dept_no)
ORDER BY empl.emp_no;

-- List of all employees whose first name is "Hercules" and last name begins with "B"
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department:employee number, last name, first name, and department name.
SELECT  empl.emp_no,
        empl.last_name,
        empl.first_name,
        dept.dept_name
FROM employees AS empl
    JOIN dept_emp AS de
        ON (empl.emp_no = de.emp_no)
    JOIN departments AS dept
        ON (de.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales'
ORDER BY empl.emp_no;

-- List all employees in Sales and Development departments:employee number, last name, first name, and department name
SELECT  empl.emp_no,
        empl.last_name,
        empl.first_name,
        dept.dept_name
FROM employees AS empl
    JOIN dept_emp AS de
        ON (empl.emp_no = de.emp_no)
    JOIN departments AS dept
        ON (de.dept_no = dept.dept_no)
WHERE dept.dept_name IN ('Sales', 'Development')
ORDER BY empl.emp_no;

-- The frequency of employee last names in descending order.
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
