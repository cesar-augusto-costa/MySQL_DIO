USE company;

SELECT *
FROM employee
ORDER BY Dno;

SELECT *
FROM employeeS
ORDER BY Fname;

-- Departamento e Gerente
SELECT DISTINCT d.Dname, CONCAT(e.Fname,' ', e.Lname) AS Manager, Address
FROM department AS d, employee AS e, works_on as w, project p
WHERE d.Dnumber = e.Dno AND e.Ssn = d.Mgr_ssn AND w.Pno = p.Pnumber
ORDER BY d.Dname, Manager;


-- recupera todos os empregados e projetos 
SELECT DISTINCT d.Dname AS Department, CONCAT(e.Fname,' ', e.Lname) AS Employee, p.Pname AS Project_Name, Address
FROM department d, employee e, works_on w, project p
WHERE d.Dnumber = e.Dno AND e.Ssn = w.Essn AND w.Pno = p.Pnumber
ORDER BY Department, Employee;

SELECT DISTINCT d.Dname AS Department, CONCAT(e.Fname,' ', e.Lname) AS Employee, p.Pname AS Project_Name, Address
FROM department d, employee e, works_on w, project p
WHERE d.Dnumber = e.Dno AND e.Ssn = w.Essn AND w.Pno = p.Pnumber
ORDER BY Department DESC, Employee ASC;



