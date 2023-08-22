SHOW DATABASES;
USE company;
SHOW TABLES;

DESC department;
DESC dependent;
DESC dept_locations;
DESC employee;
DESC project;
DESC works_on;

-- TABELAS USADAS
DESC employee;
DESC works_on;
SELECT * FROM employee;
SELECT * FROM works_on;

-- JOIN Statement
-- BOAS PRATICAS
-- NÃO USAR SOMENTE JOIN
-- DEIXAR CLARO QUAL TIPO ESTA USANDO

-- JOIN -> CROSS JOIN (PRODUTO CARTESIANO - MULTIPLICAÇÃO ENTRE OS REGISTROS)

SELECT *
FROM employee
JOIN works_on;

SELECT *
FROM employee
CROSS JOIN works_on;

-- JOIN ON -> INNER JOIN ON

SELECT *
FROM employee, works_on
WHERE Ssn = Essn;

SELECT *
FROM employee
JOIN works_on
ON Ssn = Essn;

SELECT *
FROM employee
INNER JOIN works_on
ON Ssn = Essn;

-- JOIN ON -> INNER JOIN ON

SELECT *
FROM employee
JOIN department
ON Ssn = Mgr_ssn;

SELECT Fname, Lname, Address
FROM (employee JOIN department on Dno = Dnumber)
WHERE Dname = 'Research';



SELECT * FROM dept_locations;
SELECT * FROM department;

-- JOIN USING

SELECT Dname, Dept_create_date, Dlocation
FROM department d
JOIN dept_locations l
ON d.Dnumber = l.Dnumber;

SELECT Dname AS Department, Dept_create_date AS StartDate, Dlocation AS Location
FROM department
JOIN dept_locations
USING (Dnumber)
ORDER BY Department;

-- CROSS JOIN - PRODUTO CARTESIANO

SELECT * 
FROM department
CROSS JOIN dept_locations;



