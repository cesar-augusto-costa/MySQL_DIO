USE company;

SELECT * FROM employee;

SELECT COUNT(*) FROM employee;

SELECT COUNT(*)
FROM employee, department
WHERE Dno = Dnumber AND Dname = 'Research';

SELECT Dno, COUNT(*), ROUND(AVG(Salary),2)
FROM employee
GROUP BY Dno;

SELECT Dno, COUNT(*) AS "Número de Empregados", ROUND(AVG(Salary),2) AS "Salário Médio"
FROM employee
GROUP BY Dno;

SELECT Pnumber, Pname, COUNT(*)
FROM project, works_on
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname;

SELECT COUNT(DISTINCT Salary)
FROM employee;

SELECT SUM(Salary), MAX(Salary), MIN(Salary), ROUND(AVG(Salary),2)
FROM employee;

SELECT SUM(Salary), MAX(Salary), MIN(Salary), ROUND(AVG(Salary),2)
FROM employee JOIN department ON Dno = Dnumber
WHERE Dname = 'Research';

SELECT Lname, Fname
FROM employee
WHERE 
(
	(
    SELECT COUNT(*)
    FROM dependent
    WHERE Ssn = Essn
    ) >= 2
);

SELECT Pnumber, Pname, COUNT(*)
FROM project, works_on
WHERE Pnumber = Pno
GROUP BY Pnumber;

SELECT Pnumber, Pname, COUNT(*) AS Number_of_register, ROUND(AVG(Salary),2) AS avg_salary
FROM project, works_on, employee
WHERE Pnumber = Pno AND Ssn = Essn
GROUP BY Pnumber, Pname;

SELECT Pnumber, Pname, COUNT(*) AS Number_of_register, ROUND(AVG(Salary),2) AS avg_salary
FROM project, works_on, employee
WHERE Pnumber = Pno AND Ssn = Essn
GROUP BY Pnumber, Pname
ORDER BY COUNT(*);

SELECT Pnumber, Pname, COUNT(*) AS Number_of_register, ROUND(AVG(Salary),2) AS avg_salary
FROM project, works_on, employee
WHERE Pnumber = Pno AND Ssn = Essn
GROUP BY Pnumber
ORDER BY avg_salary ASC, AVG(Salary) DESC;

SELECT Pnumber, Pname, COUNT(*) AS Number_of_register, ROUND(AVG(Salary),2) AS avg_salary
FROM project, works_on, employee
WHERE Pnumber = Pno AND Ssn = Essn
GROUP BY Pnumber
ORDER BY AVG(Salary) DESC;

SELECT Pnumber, Pname, COUNT(*)
FROM project, works_on
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname
HAVING COUNT(*) > 2;

SELECT Dno, COUNT(*)
FROM employee
WHERE Salary > 3000
GROUP BY Dno
HAVING COUNT(*) > 1;

SELECT Dno AS Department, COUNT(*) AS NumberOfEmployee
FROM employee
WHERE Salary > 20000
AND Dno IN (
	SELECT Dno
    FROM employee
    GROUP BY Dno
    HAVING COUNT(*) > 1
)
GROUP BY Dno;


