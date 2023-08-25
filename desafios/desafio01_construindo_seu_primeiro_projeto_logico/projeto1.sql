-- Criação do banco de dados para o cenário de E-commerce
DROP DATABASE ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(255),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
DESC clients;

-- criar tabela produto OBS: size - dimensão do produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(30) NOT NULL,
    classification_kids BOOL DEFAULT false,
    category ENUM("Eletrônicos","Vestimentas","Brinquedos","Alimentos", "Móveis") NOT NULL,
    Lname VARCHAR(20),
    avaliação FLOAT default 0,
    size VARCHAR(10)
);
DESC product;

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
DESC payments;

-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Processando') DEFAULT 'Processando', 
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 0,
    paymentCash BOOLEAN DEFAULT false,
    CONSTRAINT fk_orders_clients FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
    ON UPDATE CASCADE
);
DESC orders;

-- criar tabela estoque
CREATE TABLE productStorage(
	idProductStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);
DESC productStorage;

-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) DEFAULT 0 NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);
DESC supplier;

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
DESC seller;

CREATE TABLE productSeller(
	idSeller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);
DESC productSeller;

-- criar tabela produto/pedido
CREATE TABLE productOrder(
	idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productOrder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);
DESC productOrder;

CREATE TABLE storageLocation(
	idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storageLocation_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storageLocation_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProductStorage)
);
DESC storageLocation;

CREATE TABLE productSupplier(
	idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);
DESC productSupplier;

-- VERIFICAR A QUANTIDADE DE TABELAS
SHOW TABLES;

-- VERIFICAR AS CONSTRAINTS
USE information_schema;
SHOW TABLES;
DESC referential_constraints;

SELECT * 
FROM referential_constraints
WHERE constraint_schema = "ecommerce";

USE ecommerce;

DESCRIBE clients;
DESCRIBE product;
DESCRIBE payments;
DESCRIBE orders;
DESCRIBE productStorage;
DESCRIBE supplier;
DESCRIBE seller;
DESCRIBE productSeller;
DESCRIBE productOrder;
DESCRIBE storageLocation;
DESCRIBE productSupplier;


DESC clients;
-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO clients
(Fname, Minit, Lname, CPF, Address) 
VALUES
('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');


insert into product
(Pname, classification_kids, category, avaliação, size)
VALUES
('Fone de ouvido',false,'Eletrônicos','4',null),
('Barbie Elsa',true,'Brinquedos','3',null),
('Body Carters',true,'Vestimentas','5',null),
('Microfone Vedo - Youtuber',False,'Eletrônicos','4',null),
('Sofá retrátil',False,'Móveis','3','3x57x80'),
('Farinha de arroz',False,'Alimentos','2',null),
('Fire Stick Amazon',False,'Eletrônicos','3',null);

select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

delete from orders where idOrderClient in  (1,2,3,4);
insert into orders
(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
VALUES 
(1,default,'compra via aplicativo',null,1),
(2,default,'compra via aplicativo',50,0),
(3,'Confirmado',null,null,1),
(4,default,'compra via web site',150,0),
(2,default,'compra via aplicativo',null,1);
					
select * from orders;

DESC productOrder;
-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;
insert into productOrder
(idPOproduct, idPOorder, poQuantity, poStatus)
VALUES
(1,1,2,null),
(2,1,1,null),
(3,2,1,null);

-- storageLocation,quantity
insert into productStorage
(storageLocation,quantity)
VALUES 
('Rio de Janeiro',1000),
('Rio de Janeiro',500),
('São Paulo',10),
('São Paulo',100),
('São Paulo',10),
('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation
(idLproduct, idLstorage, location)
VALUES
(1,2,'RJ'),
(2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier
(SocialName, CNPJ, contact)
VALUES 
('Almeida e filhos', 123456789123456,'21985474'),
('Eletrônicos Silva',854519649143457,'21985484'),
('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier
(idPsSupplier, idPsProduct, quantity)
VALUES
(1,1,500),
(1,2,400),
(2,4,633),
(3,3,5),
(2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller
(SocialName, abstractName, CNPJ, CPF, location, contact)
VALUES 
('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller
(idSeller, idProduct, prodQuantity)
VALUES 
(1,6,80),
(2,7,10);

select * from productSeller;

-- Recuperar a quantidade de clientes.
select count(*) from clients;

-- Recuperar os pedidos feitos pelos clientes.
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;

select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status
from clients c, orders o where c.idClient = idOrderClient;
        
select * from orders;
        
-- Recupera a quantidade de clientes registrados que fizeram pedido.
select count(*) from clients c, orders o 
where c.idClient = idOrderClient;

select * from clients
left outer join orders
ON idClient = idOrderClient;

select * from product;
select * from clients;

-- recuperação de pedido com produto associado
select * from clients c 
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder;

-- recuperar quantos pedidos foram feitos por clientes
select Fname, count(*) as Number_of_orders from clients c 
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
group by idClient;
        
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
inner join orders o ON c.idClient = o.idOrderClient
group by idClient; 


-- mostrar todos os produtos ?
select * from product;

-- mostrar todos os produtos que são Eletrônicos ?
select * from product where category = "Eletrônicos";

-- mostrar todos os produtos ordenado pelo nome ?
select * from product
order by Pname asc;

-- mostrar a quantidade de produtos por categoria ?
select category, count(*) as quantity from product
group by category;

-- mostrar a quantidade de produtos por categoria que tenha mais de 1 produto ?
select category, count(*) as quantity from product
group by category
having quantity > 1;


-- mostrar o produto que o cliente comprou com a categoria, quantidade e o status ?
select Fname, Pname, category, poQuantity, orderStatus from clients c
inner join orders o on o.idOrderClient = c.idClient
inner join productOrder po on po.idPOorder = o.idOrder
inner join product p on p.idProduct = po.idPOproduct;




