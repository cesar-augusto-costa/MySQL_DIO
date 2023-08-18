SHOW DATABASES;
USE company;
SHOW TABLES;

SELECT * FROM employee;
SELECT * FROM department;

-- PRODUTO CARTESIANO
SELECT e.Fname, e.Lname, d.Dname
FROM employee e
JOIN department d;

SELECT e.Fname, e.Lname, d.Dname
FROM employee e
CROSS JOIN department d;

-- ATRIBUTO DE CONDIÇÃO DE JUNÇÃO
SELECT e.Fname, e.Lname, d.Dname
FROM employee e
JOIN department d
ON e.Dno = d.Dnumber;