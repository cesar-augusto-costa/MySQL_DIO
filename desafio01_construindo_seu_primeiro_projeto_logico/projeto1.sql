-- Criação do banco de dados para o cenário de E-commerce

CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- criar tabela produto OBS: size - dimensão do produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(15) NOT NULL,
    classification_kids BOOL,
    category ENUM("Eletrônico","Vestimenta","Brinquedo","Alimento", "Movel") NOT NULL,
    Lname VARCHAR(20),
    avaliação FLOAT default 0,
    size VARCHAR(10)
);

-- para ser continuado no desafio
-- termine a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no esquema relacional DER
CREATE TABLE payments(
	idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto','Cartão de Debito','Cartão de Crédito', 'Cheque', 'PIX'),
    limitAvailable FLOAT,
    cash FLOAT,
    PRIMARY KEY (idClient, idPayment)
    
);

-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Processando') DEFAULT 'Pocessando', 
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 0,
    paymentCash BOOL DEFAULT false,
    idOrderPayment INT,
    CONSTRAINT fk_orders_clients FOREIGN KEY (idOrderClient) REFERENCES clients(idClient),
    CONSTRAINT fk_orders_payments FOREIGN KEY (idOrderPayment) REFERENCES payments(idPayment)
);

-- criar tabela estoque
CREATE TABLE productStorage(
	idProductStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) DEFAULT 0 NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- criar tabela vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    abstractName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    location VARCHAR(255),
    contact CHAR(11) DEFAULT 0 NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- CREATE TABLE productSeller();



-- criando o esquema de banco de dados - Script SQL - Parte 4 (10:00)

