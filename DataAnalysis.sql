--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.first_name, employees.last_name, employees.gender, employees.emp_number, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_number=salaries.emp_number;
--2. List employees who were hired in 1986.
SELECT * FROM employees;
SELECT employees.emp_number, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND
      hire_date < '1987-01-01'
	  ORDER BY "hire_date" ASC;
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT * FROM managers;
SELECT * FROM departments;
SELECT * FROM department_employees;
SELECT * FROM employees;


SELECT
   managers.dept_number, 
   managers.emp_number, 
   managers.from_date, 
   managers.to_date,
   employees.first_name,
   employees.last_name,
   departments.dept_name
FROM
   managers
INNER JOIN employees ON employees.emp_number = managers.emp_number
INNER JOIN departments ON departments.dept_number = managers.dept_number;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
   department_employees.emp_number, 
   employees.first_name,
   employees.last_name,
   departments.dept_name
FROM
   employees
INNER JOIN department_employees ON employees.emp_number = department_employees.emp_number
INNER JOIN departments ON departments.dept_number = department_employees.dept_number;
--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
   first_name,
   last_name
FROM
   employees
WHERE
   first_name LIKE 'Hercules%' AND last_name LIKE 'B%';
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	department_employees.emp_number, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM
   employees
INNER JOIN department_employees ON employees.emp_number = department_employees.emp_number
INNER JOIN departments ON departments.dept_number = department_employees.dept_number
WHERE
	departments.dept_name LIKE 'Sales';
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	department_employees.emp_number, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM
   employees
INNER JOIN department_employees ON employees.emp_number = department_employees.emp_number
INNER JOIN departments ON departments.dept_number = department_employees.dept_number
WHERE
	departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE 'Development';
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	COUNT(*), last_name
FROM
	employees
GROUP BY
	last_name
ORDER BY
	COUNT(*) DESC;