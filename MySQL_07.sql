-- SUBQUERIES

USE company;

SELECT * FROM project, works_on, employee, department;

SELECT DISTINCT Pnumber
FROM project
WHERE Pnumber IN 
(
	SELECT DISTINCT Pno
	FROM works_on, employee
	WHERE (Essn = Ssn AND Lname = 'Smith')
)
OR
(
	SELECT Pnumber
	FROM project, department, employee
	WHERE Mgr_ssn = Ssn AND Lname = 'Smith' AND Dno = Dnumber
)
;

SELECT DISTINCT * 
FROM works_on
WHERE (Pno, Hours) IN
(
	SELECT Pno, Hours
    FROM works_on
    WHERE Essn=123456789
);

SELECT e.Fname, e.Lname
FROM employee AS e
WHERE EXISTS (
	SELECT *
    FROM dependent AS d
    WHERE e.Ssn = d.Essn AND Relationship = 'Spouse'
);

SELECT e.Fname, e.Lname
FROM employee AS e
WHERE EXISTS (
	SELECT *
    FROM dependent AS d
    WHERE e.Ssn = d.Essn AND Relationship = 'Son'
);


-- EMPREGADOS SEM DEPENDENTES
SELECT e.Fname, e.Lname
FROM employee AS e
WHERE NOT EXISTS (
	SELECT *
    FROM dependent AS d
    WHERE e.Ssn = d.Essn
);

SELECT e.Fname, e.Lname
FROM employee AS e
WHERE EXISTS (
	SELECT *
    FROM dependent AS d
    WHERE e.Ssn = d.Essn
)
AND EXISTS
(
	SELECT *
    FROM department AS dptt 
    WHERE e.Ssn = dptt.Mgr_ssn
);

SELECT e.Fname, e.Lname
FROM employee AS e, department as d
WHERE e.Ssn = d.Mgr_ssn
AND EXISTS
(
	SELECT *
    FROM dependent as d
    WHERE e.Ssn = d.Essn
);

SELECT Fname, Lname
FROM employee
WHERE
(
	(SELECT COUNT(*)
    FROM dependent
    WHERE Ssn = Essn) >= 2
);


SELECT DISTINCT Essn, Pno
FROM works_on
WHERE Pno in (1,2,3);