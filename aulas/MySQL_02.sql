DROP TABLE dept_locations;
DROP TABLE works_on;
DROP TABLE project;
DROP TABLE department;
DROP TABLE dependent;
DROP TABLE employee;

CREATE SCHEMA IF NOT EXISTS company;
USE company;

-- restrição atribuida a um domínio (MySQL não tem suporte)
-- create domain D_num as int check(D_num > 0 and D_num < 21)

CREATE TABLE employee (
	Fname VARCHAR(15) NOT NULL,
    Mname CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL,
    CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn)
);

ALTER TABLE employee
ADD CONSTRAINT fk_employeee
FOREIGN KEY (Super_ssn)
REFERENCES employee (Ssn)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE employee
MODIFY Dno INT NOT NULL
DEFAULT 1;

CREATE TABLE department (
	Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE,
    Dept_create_date DATE,
    CONSTRAINT chk_date_department CHECK (Dept_create_date < Mgr_start_date), 
    CONSTRAINT pk_department PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_department UNIQUE (Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

-- modificar uma constraint: drop e add

ALTER TABLE department
DROP CONSTRAINT department_ibfk_1;

ALTER TABLE department
ADD CONSTRAINT fk_dept
FOREIGN KEY (Mgr_ssn)
REFERENCES employee(Ssn)
ON UPDATE CASCADE;

CREATE TABLE dept_locations (
	Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES department(Dnumber)
);

ALTER TABLE dept_locations DROP CONSTRAINT fk_dept_locations;

ALTER TABLE dept_locations
ADD CONSTRAINT fk_dept_locations
FOREIGN KEY (Dnumber)
REFERENCES department (Dnumber)
ON DELETE CASCADE
ON UPDATE CASCADE;

CREATE TABLE project (
	Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT unique_project UNIQUE (Pname),
    CONSTRAINT fk_departament_project_dnum FOREIGN KEY (Dnum) REFERENCES department(Dnumber)
);

CREATE TABLE works_on (
	Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_employee_works_on_essn FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    CONSTRAINT fk_project_works_on_pno FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE dependent (
	Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(8),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent_essn FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

SHOW TABLES;

DESC dept_locations;
DESC works_on;
DESC project;
DESC department;
DESC dependent;
DESC employee;

SHOW CHARACTER SET;

SELECT Salary
FROM employee;

SELECT ALL Salary
FROM employee;

SELECT DISTINCT Salary
FROM employee;

SELECT Bdate, Address
FROM employee
WHERE Fname = 'John' AND Mname = 'B' AND Lname = 'Smith';

-- INSERT INTO table (atributos) VALUES ();

SELECT * FROM information_schema.table_constraints
WHERE CONSTRAINT_SCHEMA = 'company';

SELECT * FROM information_schema.referential_constraints
WHERE CONSTRAINT_SCHEMA = 'company';
