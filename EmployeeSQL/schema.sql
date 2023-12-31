﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE departments (
    dept_no VARCHAR(30)   NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30)   NOT NULL
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL PRIMARY KEY,
    salary INT   NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
    dept_no VARCHAR(30)   NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(30)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR(30)   NOT NULL PRIMARY KEY,
    title VARCHAR(30)   NOT NULL
);

CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(30)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(30)   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no, emp_title_id)
);
