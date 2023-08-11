-- union, except, intersect
CREATE DATABASE teste;
USE teste;

CREATE TABLE R(
	a CHAR(2)
);
CREATE TABLE S(
	a CHAR(2)
);

INSERT INTO R(a)
VALUES ('a1'),('a2'),('a2'),('a3');

INSERT INTO S(a)
VALUES ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

SELECT * FROM R;
SELECT * FROM S;

SELECT * FROM S WHERE a NOT IN (SELECT a FROM R);

