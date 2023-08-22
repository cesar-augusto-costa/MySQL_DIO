USE company;

-- JOIN com mais de 3 tabelas

-- project, works_on, employee
SELECT CONCAT(Fname, ' ', Lname) AS NameComplete,
	Sex, Dno AS DeptNumber, Pname AS ProjectName,
	Pno AS ProjectNumber, Hours, Plocation AS Location
FROM employee
INNER JOIN works_on ON Ssn = Essn
INNER JOIN project ON Pno = Pnumber
ORDER BY Pnumber;

SELECT CONCAT(Fname, ' ', Lname) AS NameComplete,
	Sex, Dno AS DeptNumber, Pname AS ProjectName,
	Pno AS ProjectNumber, Hours, Plocation AS Location
FROM employee
INNER JOIN works_on ON Ssn = Essn
INNER JOIN project ON Pno = Pnumber
WHERE Plocation like 'S%'
ORDER BY NameComplete;

SELECT CONCAT(Fname, ' ', Lname) AS NameComplete,
	Sex, Dname AS Department, Pname AS Project,
	Hours, Plocation AS Location
FROM employee
INNER JOIN works_on ON Ssn = Essn
INNER JOIN project ON Pno = Pnumber
INNER JOIN department ON Dnumber = Dno
WHERE Pname like 'Product%'
ORDER BY NameComplete;

-- department, dept_location, employee
SELECT * FROM department
INNER JOIN dept_locations USING(Dnumber)
INNER JOIN employee ON Dno = Dnumber;

SELECT * FROM department
INNER JOIN dept_locations USING(Dnumber)
INNER JOIN employee ON Ssn = Mgr_ssn;

SELECT Dnumber, Dname, CONCAT(Fname, ' ', Lname) AS Manager, Salary, ROUND(Salary * 0.05, 2) AS Bonus
FROM department
INNER JOIN dept_locations USING(Dnumber)
INNER JOIN employee ON Ssn = Mgr_ssn;

SELECT Dnumber, Dname, CONCAT(Fname, ' ', Lname) AS Manager, Salary, ROUND(Salary * 0.05, 2) AS Bonus
FROM department
INNER JOIN dept_locations USING(Dnumber)
INNER JOIN employee ON Ssn = Mgr_ssn
GROUP BY Dnumber;

SELECT Dnumber, Dname, CONCAT(Fname, ' ', Lname) AS Manager, Salary, ROUND(Salary * 0.05, 2) AS Bonus
FROM department
INNER JOIN dept_locations USING(Dnumber)
INNER JOIN employee ON Ssn = Mgr_ssn
GROUP BY Dnumber
HAVING COUNT(*) > 1;


SELECT Dnumber, Dname, CONCAT(Fname, ' ', Lname) AS Manager, Salary, ROUND(Salary * 0.05, 2) AS Bonus
FROM department
INNER JOIN dept_locations USING(Dnumber)
INNER JOIN (
	dependent INNER JOIN employee ON Ssn = Essn
) ON Ssn = Mgr_ssn
GROUP BY Dnumber;

-- FAZER ESSA CONSULTA
-- department, project, employee
SELECT * FROM department;
SELECT * FROM project;
SELECT * FROM employee;

SELECT *
FROM department AS d
INNER JOIN project AS p
ON d.Dnumber = p.Dnum
INNER JOIN employee AS e
ON e.Dno = p.Dnum;

-- STRAIGHT_JOIN

SELECT STRAIGHT_JOIN *
FROM customer c
INNER JOIN account a
ON a.cust_id = c.cust_id
INNER JOIN employee e
ON a.open_emp_id = e.emp_id
WHERE c.cust_type_cd = 'B';

-- SELF JOIN

-- SUBQUERIES COM JOIN

-- JOIN = INNER JOIN
SELECT *
FROM employee
JOIN dependent
ON Ssn = Essn;

SELECT *
FROM employee
INNER JOIN dependent
ON Ssn = Essn;

-- LEFT JOIN = LEFT OUTER JOIN
SELECT *
FROM employee
LEFT JOIN dependent
ON Ssn = Essn;

SELECT *
FROM employee
LEFT OUTER JOIN dependent
ON Ssn = Essn;

-- FULL OUTER JOIN = OUTER JOIN 

-- ANTI LEFT JOIN

-- ANTI RIGHT JOIN

-- ANTI OUTER JOIN


-- CROSS JOIN (PRODUTO CARTESIANO)

-- NATURAL JOIN
SELECT * FROM department
NATURAL JOIN dept_locations;



