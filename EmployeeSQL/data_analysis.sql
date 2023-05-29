--Data Analysis

--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary 
FROM employees
JOIN salaries as salary
   ON employees.emp_no = salary.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, dept_name.dept_name, dept_manager.emp_no, last_name.last_name, first_name.first_name
FROM dept_manager
JOIN departments as dept_name
   ON dept_manager.dept_no = dept_name.dept_no
JOIN employees as last_name
   ON dept_manager.emp_no = last_name.emp_no
JOIN employees as first_name
   ON dept_manager.emp_no = first_name.emp_no;
   
--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, last_name.last_name, first_name.first_name, dept_name.dept_name
FROM dept_emp
JOIN employees as last_name
   ON dept_emp.emp_no = last_name.emp_no
JOIN employees as first_name
   ON dept_emp.emp_no = first_name.emp_no
JOIN departments as dept_name
   ON dept_emp.dept_no = dept_name.dept_no;
   
--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees WHERE first_name = 'Hercules' AND LEFT(last_name,1)='B'

--6.List each employee in the Sales department, including their employee number, last name, and first name. 
SELECT dept_emp.emp_no, last_name.last_name, first_name.first_name
FROM dept_emp 
JOIN employees as last_name
   ON dept_emp.emp_no = last_name.emp_no
JOIN employees as first_name
   ON dept_emp.emp_no = first_name.emp_no
WHERE dept_emp.dept_no = 'd007';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT dept_emp.emp_no, last_name.last_name, first_name.first_name, dept_name.dept_name
FROM dept_emp
JOIN employees as last_name
   ON dept_emp.emp_no = last_name.emp_no
JOIN employees as first_name
   ON dept_emp.emp_no = first_name.emp_no
JOIN departments as dept_name
   ON dept_emp.dept_no = dept_name.dept_no
WHERE dept_emp.dept_no ='d007' OR dept_emp.dept_no ='d005';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, count(*) AS counts FROM employees GROUP BY 1 ORDER BY counts DESC;