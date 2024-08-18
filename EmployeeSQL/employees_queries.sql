employees_queries.sql
--1) List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no,
		emp.last_name,
		emp.first_name,
		emp.sex,
		sal.salary
FROM employees as emp
	LEFT JOIN salaries as sal
	ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

--2) List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no,
		d.dept_name,
		dm.emp_no,
		emp.last_name,
		emp.first_name
FROM dept_manager as dm
INNER JOIN departments as d
ON (dm.dept_no = d.dept_no)
INNER JOIN employees as emp	
ON (dm.emp_no = emp.emp_no)
ORDER BY emp.emp_no;

--4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT emp.emp_no,
		emp.last_name,
		emp.first_name,
		d.dept_name
FROM employees as emp
INNER JOIN dept_emp as de
ON emp.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY emp.emp_no;

--5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6) List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no,
		emp.last_name,
		emp.first_name,
		d.dept_name
FROM employees as emp
INNER JOIN dept_emp as de
ON emp.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY emp.emp_no;

--7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no,
		emp.last_name,
		emp.first_name,
		d.dept_name
FROM employees as emp
INNER JOIN dept_emp as de
ON emp.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY emp.emp_no;

--8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;