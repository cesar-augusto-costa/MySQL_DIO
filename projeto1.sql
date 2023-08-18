-- Criação do banco de dados para o cenário de E-commerce

CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE client(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- criar tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(15) NOT NULL,
    classification_kids BOOL,
    category ENUM("Eletrônico","Vestimenta","Brinquedo","Alimento", "Movel") NOT NULL,
    Lname VARCHAR(20),
    avaliação FLOAT default 0,
    size VARCHAR(10)
);

-- criando o esquema de banco de dados - Script SQL - Parte 2

