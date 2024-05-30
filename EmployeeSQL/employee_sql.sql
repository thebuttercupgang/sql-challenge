--creating tables for data
CREATE TABLE departments (
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR(10),
	dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
	emp_no INTEGER PRIMARY KEY,
	dept_name VARCHAR(30) FOREIGN KEY REFERENCES departments(dept_name)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) FOREIGN KEY REFERENCES departments(dept_no),
	emp_no INTEGER FOREIGN KEY REFERENCES dept_emp(emp_no)
);

CREATE TABLE employees (
	emp_no INT FOREIGN KEY REFERENCES dept_emp(emp_no),
	emp_title VARCHAR(30),
	birth_date VARCHAR(8),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date VARCHAR(8)
);

CREATE TABLE salaries (
	emp_no INTEGER FOREIGN KEY REFERENCES dept_emp(emp_no),
	salary INTEGER
);

CREATE TABLE titles (
	id SERIAL PRIMARY KEY,
	title_id VARCHAR(30),
	title VARCHAR(30)
);


