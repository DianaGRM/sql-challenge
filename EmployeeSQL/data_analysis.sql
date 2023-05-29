--Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary 
FROM employees
JOIN salaries as salary
   ON employees.emp_no = salary.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, dept_name.dept_name, dept_manager.emp_no, last_name.last_name, first_name.first_name
FROM dept_manager
JOIN departments as dept_name
   ON dept_manager.dept_no = dept_name.dept_no
JOIN employees as last_name
   ON dept_manager.emp_no = last_name.emp_no
JOIN employees as first_name
   ON dept_manager.emp_no = first_name.emp_no;
   
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, last_name.last_name, first_name.first_name, dept_name.dept_name
FROM dept_emp
JOIN employees as last_name
   ON dept_emp.emp_no = last_name.emp_no
JOIN employees as first_name
   ON dept_emp.emp_no = first_name.emp_no
JOIN departments as dept_name
   ON dept_emp.dept_no = dept_name.dept_no;
   

   
