SHOW DATABASES;
SHOW SCHEMAS;

USE information_schema;
SHOW TABLES;
DESC information_schema.table_constraints;
SELECT * FROM information_schema.table_constraints;

DROP DATABASE first_example;
CREATE DATABASE IF NOT EXISTS first_example;

USE first_example;
SHOW TABLES;

CREATE TABLE person(
	person_id SMALLINT UNSIGNED,
	firt_name VARCHAR(20),
	last_name VARCHAR(20),
	gender enum('M','F'),
	birth_date DATE,
	street VARCHAR(30),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
);

DESC person;

CREATE TABLE favorite_food(
	person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favorite_food FOREIGN KEY (person_id)
    REFERENCES person(person_id)
);

DESC favorite_food;

SELECT * FROM information_schema.table_constraints
WHERE constraint_schema = 'first_example';

SELECT * FROM information_schema.table_constraints
WHERE table_name = 'person';

DESC person;
INSERT INTO person VALUES (
	'1','Carolina','Silva','F', '1979-08-21',
    'Rua Tal', 'Cidade J', 'RJ', 'Brasil','26054-89'
);

INSERT INTO person VALUES (
	'2','Cesar','Costa','M', '1993-04-23',
    'Rua Feliz', 'Campinas', 'SP', 'Brasil','13000-000'
),
(
	3,'Ana','Beatriz','F', '1993-04-23',
    'Rua Feliz', 'Campinas', 'SP', 'Brasil','13000-000'
);

SELECT * FROM person;

DELETE FROM person WHERE person_id = 2;

DELETE FROM person WHERE person_id = 2 OR person_id = 3 OR person_id = 4;

DESC favorite_food;
INSERT INTO favorite_food VALUES (
	'2', 'Pizza'
);
INSERT INTO favorite_food VALUES (
	1, 'Lasanha'
),
(
	3, 'Carne Assada'
);

SELECT * FROM favorite_food;
