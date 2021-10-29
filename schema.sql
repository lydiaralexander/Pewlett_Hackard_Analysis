-- creating tables for PH-EmployeesDB
create table departments(
	dept_no varchar(4) not null
	,dept_name varchar(40) not null
	,primary key (dept_no)
	,unique (dept_name)
);

--query to confirm
select * from departments

-- create table for employees
create table employees(
	emp_no integer not null
	,birth_date date not null
	,first_name varchar not null
	,last_name varchar not null
	,gender varchar not null
	,hire_date date not null
	,primary key (emp_no)
);

--query to confirm
select * from employees

-- create table for dept_managers
create table dept_managers(
	dept_no varchar(4) not null
	,emp_no integer not null
	,from_date date not null
	,to_date date not null
	,foreign key (emp_no) references employees (emp_no)
	,foreign key (dept_no) references departments (dept_no)
	,primary key (dept_no, emp_no)
);

--query to confirm
select * from dept_managers

-- create table for salaries
create table salaries(
	emp_no integer not null
	,salary integer not null
	,from_date date not null
	,to_date date not null
	,foreign key(emp_no) references employees (emp_no)
	,primary key (emp_no)
);

--query to confirm
select * from salaries

-- create table for dept_emp
create table dept_emp(
	emp_no integer not null
	,dept_no varchar not null
	,from_date date not null
	,to_date date not null
	,foreign key (emp_no) references employees (emp_no)
	,foreign key (dept_no) references departments (dept_no)
	,foreign key (dept_no) references dept_managers (dept_no)
	,primary key (emp_no, dept_no)
);

--query to confirm
select * from dept_emp

-- create table for titles
create table titles(
	emp_no integer not null
	,title varchar not null
	,from_date date not null
	,to_date date not null
	,foreign key (emp_no) references employees(emp_no)
	,primary key (emp_no)
);

--query to confirm
select * from titles