-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employee as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.
SELECT dm.emp_no, dm.dept_no, dm.from_date, dm.to_date, e.first_name, e.last_name, dp.dept_name
FROM dept_manager as dm
INNER JOIN  employee as e
ON dm.emp_no = e.emp_no
INNER JOIN  department as dp
ON dm.dept_no = dp.dept_no;

-- 4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.first_name, e.last_name, dp.dept_name
FROM dept_emp as de
INNER JOIN  employee as e
ON de.emp_no = e.emp_no
INNER JOIN  department as dp
ON de.dept_no = dp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT de.emp_no, de.dept_no, e.first_name, e.last_name, dp.dept_name
FROM dept_emp as de
INNER JOIN  employee as e
ON de.emp_no = e.emp_no
INNER JOIN  department as dp
ON de.dept_no = dp.dept_no
WHERE dept_name like 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT de.emp_no, de.dept_no, e.first_name, e.last_name, dp.dept_name
FROM dept_emp as de
INNER JOIN  employee as e
ON de.emp_no = e.emp_no
INNER JOIN  department as dp
ON de.dept_no = dp.dept_no
WHERE dept_name like 'Sales' OR dept_name like 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT COUNT(last_name), last_name
FROM employee
GROUP BY last_name;
