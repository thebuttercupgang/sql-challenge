DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--creating tables for data
CREATE TABLE departments (
    dept_no VARCHAR(30) NOT NULL,
    dept_name VARCHAR(30),
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE dept_emp (
    emp_no INTEGER,
    dept_no VARCHAR(30) NOT NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	emp_no INTEGER
);

CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER
);

CREATE TABLE titles (
	title_id VARCHAR(30) NOT NULL PRIMARY KEY,
	title VARCHAR(30)
);

-- checking each table
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles;

-- establishing foreign key relationships

	--adding employee numbers
ALTER TABLE dept_emp 
	ADD CONSTRAINT fk_employees
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no);

ALTER TABLE dept_manager
	ADD CONSTRAINT fk_employees
	FOREIGN KEY (emp_no) 
	REFERENCES employees(emp_no);

ALTER TABLE salaries
	ADD CONSTRAINT fk_employees
	FOREIGN KEY (emp_no) 
	REFERENCES employees(emp_no);

	--adding title id
ALTER TABLE employees
	ADD CONSTRAINT fk_title
	FOREIGN KEY (emp_title) 
	REFERENCES titles(title_id);

	--adding dept no
ALTER TABLE dept_manager 
	ADD CONSTRAINT fk_dept_no
	FOREIGN KEY (dept_no)
	REFERENCES departments(dept_no);

ALTER TABLE dept_emp
	ADD CONSTRAINT fk_dept_no
	FOREIGN KEY (dept_no)
	REFERENCES departments(dept_no);

-- okay questions now

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries 
	ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '19860101' AND '19861231';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON dm.dept_no = d.dept_no
INNER JOIN employees AS e
	ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
INNER JOIN employees AS e
	ON de.emp_no = e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
	GROUP BY last_name
	ORDER BY COUNT(last_name) DESC









