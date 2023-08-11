-- Explorando os comando DDL

SELECT NOW() AS TIMESTAMP;

DROP DATABASE manipulation;
CREATE DATABASE IF NOT EXISTS manipulation;
USE manipulation;
SHOW TABLES;

CREATE TABLE bankAccounts (
	Id_account INT AUTO_INCREMENT PRIMARY KEY,
    Ag_num INT NOT NULL,
    Ac_num INT NOT NULL,
    Saldo FLOAT,
    CONSTRAINT identification_account_constraint UNIQUE (Ag_num, Ac_num)
);

DESC bankAccounts;

INSERT INTO bankAccounts
(Ag_num, Ac_num, Saldo)
VALUES
(156, 264358, 0);

SELECT * FROM bankAccounts;

ALTER TABLE bankAccounts ADD LimiteCredito FLOAT NOT NULL DEFAULT 500.00;

ALTER TABLE bankAccounts ADD email VARCHAR(60);

ALTER TABLE bankAccounts DROP COLUMN email;

-- ALTER TABLE nome_table MODIFY COLUMN nome_atributo tipo_dados CONDIÇÃO WHERE
-- ALTER TABLE nome_table ADD CONSTRAINT nome_constraint condições_dessa_constraint

CREATE TABLE bankClient (
	Id_client INT AUTO_INCREMENT,
    ClientAccount INT,
    CPF CHAR(11) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Renda_mensal FLOAT,
    PRIMARY KEY (Id_client, ClientAccount),
    CONSTRAINT fk_account_client FOREIGN KEY (ClientAccount) REFERENCES bankAccounts(Id_account)
    ON UPDATE CASCADE
);

INSERT INTO bankClient
(ClientAccount, CPF, RG, Nome, Endereco, Renda_mensal)
VALUES
(1, 12345678913, 123465789, 'Fulano','rua de lá', 6500.6);

SELECT * FROM bankClient;

ALTER TABLE bankClient ADD UF CHAR(2) NOT NULL DEFAULT 'RJ';

UPDATE bankClient SET UF = 'MG' WHERE Id_client = 1;

CREATE TABLE bankTransactions (
	Id_transcation INT AUTO_INCREMENT PRIMARY KEY,
    Ocorrencia DATETIME,
    Status_transaction VARCHAR(20),
    Valor_transferido FLOAT,
    Source_account INT,
    Destination_account INT,
    CONSTRAINT fk_source_transaction FOREIGN KEY (Source_account) REFERENCES bankAccounts(Id_account),
    CONSTRAINT fk_destionation_transaction FOREIGN KEY (Destination_account) REFERENCES bankAccounts(Id_account)
);

DROP TABLE bankClient;
DROP TABLE bankTransactions;
DROP TABLE bankAccounts;


