DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "Department_Employees";
DROP TABLE IF EXISTS "Managers";
DROP TABLE IF EXISTS "Employees";
DROP TABLE IF EXISTS "Salaries";
DROP TABLE IF EXISTS "Titles";





CREATE TABLE Departments (
    dept_number VARCHAR(30)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
	CONSTRAINT pk_Departments PRIMARY KEY (
        dept_number
     )
);

CREATE TABLE Department_Employees (
    emp_number INT   NOT NULL,
	dept_number VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Managers (
    dept_number VARCHAR(30)   NOT NULL,
    emp_number INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Employees (
    emp_number INTEGER   NOT NULL,
    birthday DATE   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    gender VARCHAR(20)   NOT NULL,
    hire_Date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_number
     )
);

CREATE TABLE Salaries (
    emp_number INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Titles (
    emp_number INTEGER   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

ALTER TABLE Department_employees ADD CONSTRAINT fk_Department_dept_number FOREIGN KEY(dept_number)
REFERENCES Departments (dept_number);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_number FOREIGN KEY(emp_number)
REFERENCES Employees (emp_number);

ALTER TABLE Managers ADD CONSTRAINT fk_Managers_dept_number FOREIGN KEY(dept_number)
REFERENCES Departments (dept_number);

ALTER TABLE Managers ADD CONSTRAINT fk_Managers_emp_number FOREIGN KEY(emp_number)
REFERENCES Employees (emp_number);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_number FOREIGN KEY(emp_number)
REFERENCES Employees (emp_number);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_number FOREIGN KEY(emp_number)
REFERENCES Employees (emp_number);



