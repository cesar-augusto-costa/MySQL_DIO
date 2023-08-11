USE company;

SHOW TABLES;

DESC department;
DESC dept_locations;

SELECT * FROM department;
SELECT * FROM dept_locations;

-- retira a ambiguidade através do ALIAS ou AS Statement 
SELECT Dname AS Department FROM department, dept_locations
WHERE department.Dnumber = dept_locations.Dnumber;

-- retira a ambiguidade através do ALIAS ou AS Statement 
SELECT Dname AS Department
FROM department AS d, dept_locations AS l
WHERE d.Dnumber = l.Dnumber;

SELECT Dname AS Department, l.Dlocation
FROM department AS d, dept_locations AS l
WHERE d.Dnumber = l.Dnumber;

SELECT CONCAT(Fname, ' ' , Lname) AS FullName
FROM employee;

SELECT Fname, Lname
FROM employee, department
WHERE Dname = 'Research' AND Dnumber = Dno;

SELECT CONCAT(Fname, ' ' , Lname) AS Complete_name
FROM employee, department
WHERE Dname = 'Research' AND Dnumber = Dno;

-- recolhendo o valor do INSS
SELECT Fname, Lname, Salary, ROUND(Salary * 0.11, 2) AS INSS
FROM employee;

SELECT *
FROM employee e, works_on AS w, project as p
WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber);

SELECT *
FROM employee e, works_on AS w, project as p
WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber AND p.Pname = 'ProductX');

-- Definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
SELECT CONCAT(Fname, ' ', Mname, '. ', Lname) AS Complete_name, Salary, ROUND(Salary * 1.1, 2) AS Increment_salary
FROM employee e, works_on AS w, project as p
WHERE (e.Ssn = w.Essn AND w.Pno = p.Pnumber AND p.Pname = 'ProductX');

SELECT Fname, Lname, Address
FROM employee e, department d
WHERE d.Dname = 'Research' AND d.Dnumber = e.Dno;

SELECT CONCAT(Fname, ' ', Lname) AS Employee_Name, Address
FROM employee e, department d
WHERE d.Dname = 'Research' AND d.Dnumber = e.Dno;


-- recuperando informações dos departamentos presentes em Stafford

SELECT Dname AS Department_Name, Mgr_ssn AS Manager, Address
FROM department d, dept_locations l, employee e
WHERE d.Dnumber = l.Dnumber AND l.Dlocation = 'Stafford';

SELECT Dname AS Department_Name, Mgr_ssn AS Manager, Address
FROM department d, dept_locations l, employee e
WHERE d.Dnumber = l.Dnumber AND l.Dlocation = 'Stafford' AND Mgr_ssn = e.Ssn;

SELECT Dname AS Department_Name, CONCAT(Fname, ' ', Lname) AS Manager
FROM department d, dept_locations l, employee e
WHERE d.Dnumber = l.Dnumber AND Dlocation = 'Stafford' AND Mgr_ssn = e.Ssn;

-- recuperando todos os gerentes, departamentos e seus nomes
SELECT Dname AS Department_Name, CONCAT(Fname, ' ', Lname) AS Manager, Dlocation
FROM department d, dept_locations l, employee e
WHERE d.Dnumber = l.Dnumber AND d.Mgr_ssn = e.Ssn;


SELECT Pnumber, Dnum, Lname, Address, Bdate, p.location 
FROM department d, project p, employee e
WHERE d.Dnumber = p.Dnum AND p.Plocation = 'Stafford' AND Mgr_ssn = e.Ssn;


SELECT * FROM project;
SELECT * FROM employee;
SELECT * FROM department;

SELECT CONCAT(Fname, ' ', Lname) Complete_Name, Address
FROM employee
WHERE Address like '%Houston%';

SELECT CONCAT(Fname, ' ', Lname) Complete_Name, Dname AS Departmant_Name
FROM employee, department
WHERE (Dno = Dnumber AND Address LIKE '%Houston%');

SELECT Fname, Lname, Salary
FROM employee
WHERE Salary >= 30000 AND Salary <= 40000;


SELECT Fname, Lname, Salary
FROM employee
WHERE Salary BETWEEN 30000 AND 40000;


-- Operadores Lógicos

SELECT Fname, Lname, Bdate, Address
FROM employee
WHERE Fname = 'John' AND Lname = 'Smith';

SELECT *
FROM department
WHERE Dname = 'Research' OR Dname = 'Administration';

SELECT Fname, Lname, Dname
FROM employee, department
WHERE (Dname = 'Research' OR Dname = 'Administration') AND Dnumber = Dno;
