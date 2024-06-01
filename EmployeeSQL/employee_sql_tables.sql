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