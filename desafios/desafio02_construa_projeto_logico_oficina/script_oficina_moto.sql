DROP DATABASE oficina_moto;
CREATE DATABASE oficina_moto;
USE oficina_moto;

-- Tabela para fornecedores
CREATE TABLE Fornecedores (
    IdFornecedor INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    CEP VARCHAR(20),
    TipoLogradouro VARCHAR(50),
    Logradouro VARCHAR(100),
    Numero VARCHAR(10),
    Complemento VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(50)
);

-- Tabela para telefones dos fornecedores
CREATE TABLE FornecedorTelefones (
    IdFornecedorTelefone INT PRIMARY KEY,
    IdFornecedor INT,
    TipoTelefone VARCHAR(20),
    NumeroTelefone VARCHAR(15),
    FOREIGN KEY (IdFornecedor) REFERENCES Fornecedores(IdFornecedor)
);

-- Tabela para clientes
CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    CEP VARCHAR(20),
    TipoLogradouro VARCHAR(50),
    Logradouro VARCHAR(100),
    Numero VARCHAR(10),
    Complemento VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(50)
);

-- Tabela para telefones dos clientes
CREATE TABLE ClienteTelefones (
    IdClienteTelefone INT PRIMARY KEY,
    IdCliente INT,
    TipoTelefone VARCHAR(20),
    NumeroTelefone VARCHAR(15),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

-- Tabela para peças de reposição
CREATE TABLE Pecas (
    IdPeca INT PRIMARY KEY,
    Nome VARCHAR(100),
    Marca VARCHAR(50),
    QuantidadeEmEstoque INT,
    PrecoUnitario DECIMAL(10, 2),
    IdFornecedor INT,
    FOREIGN KEY (IdFornecedor) REFERENCES Fornecedores(IdFornecedor)
);

-- Tabela para motos
CREATE TABLE Motos (
    IdMoto INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(20),
    IdCliente INT,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

-- Tabela para serviços
CREATE TABLE Servicos (
    IdServico INT PRIMARY KEY,
    Descricao VARCHAR(200),
    DataAgendamento DATE,
    DataConclusao DATE,
    Custo DECIMAL(10, 2),
    IdMoto INT,
    FOREIGN KEY (IdMoto) REFERENCES Motos(IdMoto)
);

-- Tabela para registros de peças utilizadas nos serviços
CREATE TABLE ServicoPecas (
    IdServicoPeca INT PRIMARY KEY,
    IdServico INT,
    IdPeca INT,
    QuantidadeUtilizada INT,
    FOREIGN KEY (IdServico) REFERENCES Servicos(IdServico),
    FOREIGN KEY (IdPeca) REFERENCES Pecas(IdPeca)
);


-- Inserção de registros em Fornecedores
INSERT INTO Fornecedores (IdFornecedor, Nome, Email, CEP, TipoLogradouro, Logradouro, Numero, Complemento, Bairro, Cidade, Estado)
VALUES
    (1, 'Fornecedor 1', 'fornecedor1@email.com', '12345-678', 'Rua', 'Rua Principal', '123', 'Apto 4', 'Centro', 'Cidade 1', 'Estado 1'),
    (2, 'Fornecedor 2', 'fornecedor2@email.com', '98765-432', 'Avenida', 'Avenida Central', '456', '', 'Bairro 2', 'Cidade 2', 'Estado 2'),
    (3, 'Fornecedor 3', 'fornecedor3@email.com', '54321-987', 'Rua', 'Rua das Flores', '456', '', 'Bairro 3', 'Cidade 3', 'Estado 3'),
    (4, 'Fornecedor 4', 'fornecedor4@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', '', 'Bairro 4', 'Cidade 4', 'Estado 4'),
    (5, 'Fornecedor 5', 'fornecedor5@email.com', '12345-678', 'Rua', 'Rua Principal', '123', 'Apto 4', 'Centro', 'Cidade 5', 'Estado 5'),
    (6, 'Fornecedor 6', 'fornecedor6@email.com', '98765-432', 'Avenida', 'Avenida Central', '456', '', 'Bairro 6', 'Cidade 6', 'Estado 6'),
    (7, 'Fornecedor 7', 'fornecedor7@email.com', '54321-987', 'Rua', 'Rua das Flores', '456', '', 'Bairro 7', 'Cidade 7', 'Estado 7'),
    (8, 'Fornecedor 8', 'fornecedor8@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', '', 'Bairro 8', 'Cidade 8', 'Estado 8'),
    (9, 'Fornecedor 9', 'fornecedor9@email.com', '12345-678', 'Rua', 'Rua Principal', '123', 'Apto 4', 'Centro', 'Cidade 9', 'Estado 9'),
    (10, 'Fornecedor 10', 'fornecedor10@email.com', '98765-432', 'Avenida', 'Avenida Central', '456', '', 'Bairro 10', 'Cidade 10', 'Estado 10'),
    (11, 'Fornecedor 11', 'fornecedor11@email.com', '54321-987', 'Rua', 'Rua das Flores', '456', '', 'Bairro 11', 'Cidade 11', 'Estado 11'),
    (12, 'Fornecedor 12', 'fornecedor12@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', '', 'Bairro 12', 'Cidade 12', 'Estado 12'),
    (13, 'Fornecedor 13', 'fornecedor13@email.com', '12345-678', 'Rua', 'Rua Principal', '123', 'Apto 4', 'Centro', 'Cidade 13', 'Estado 13'),
    (14, 'Fornecedor 14', 'fornecedor14@email.com', '98765-432', 'Avenida', 'Avenida Central', '456', '', 'Bairro 14', 'Cidade 14', 'Estado 14'),
    (15, 'Fornecedor 15', 'fornecedor15@email.com', '54321-987', 'Rua', 'Rua das Flores', '456', '', 'Bairro 15', 'Cidade 15', 'Estado 15'),
    (16, 'Fornecedor 16', 'fornecedor16@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', '', 'Bairro 16', 'Cidade 16', 'Estado 16'),
    (17, 'Fornecedor 17', 'fornecedor17@email.com', '12345-678', 'Rua', 'Rua Principal', '123', 'Apto 4', 'Centro', 'Cidade 17', 'Estado 17'),
    (18, 'Fornecedor 18', 'fornecedor18@email.com', '98765-432', 'Avenida', 'Avenida Central', '456', '', 'Bairro 18', 'Cidade 18', 'Estado 18'),
    (19, 'Fornecedor 19', 'fornecedor19@email.com', '54321-987', 'Rua', 'Rua das Flores', '456', '', 'Bairro 19', 'Cidade 19', 'Estado 19'),
    (20, 'Fornecedor 20', 'fornecedor20@email.com', '13579-246', 'Rua', 'Rua do Comércio', '123', 'Loja 2', 'Bairro 20', 'Cidade 20', 'Estado 20');

-- Inserção de registros em FornecedorTelefones
INSERT INTO FornecedorTelefones (IdFornecedorTelefone, IdFornecedor, TipoTelefone, NumeroTelefone)
VALUES
    (1, 1, 'Comercial', '(11) 1234-5678'),
    (2, 1, 'Celular', '(11) 98765-4321'),
    (3, 2, 'Comercial', '(22) 5555-5555'),
    (4, 3, 'Comercial', '(33) 1234-5678'),
    (5, 3, 'Celular', '(33) 98765-4321'),
    (6, 4, 'Comercial', '(44) 5555-5555'),
    (7, 4, 'Celular', '(44) 1234-5678'),
    (8, 5, 'Comercial', '(55) 98765-4321'),
    (9, 5, 'Celular', '(55) 5555-5555'),
    (10, 6, 'Comercial', '(66) 1234-5678'),
    (11, 6, 'Celular', '(66) 98765-4321'),
    (12, 7, 'Comercial', '(77) 5555-5555'),
    (13, 7, 'Celular', '(77) 1234-5678'),
    (14, 8, 'Comercial', '(88) 98765-4321'),
    (15, 8, 'Celular', '(88) 5555-5555'),
    (16, 9, 'Comercial', '(99) 1234-5678'),
    (17, 9, 'Celular', '(99) 98765-4321'),
    (18, 10, 'Comercial', '(10) 5555-5555'),
    (19, 10, 'Celular', '(10) 1234-5678'),
    (20, 11, 'Comercial', '(11) 98765-4321');

-- Inserção de registros em Clientes
INSERT INTO Clientes (IdCliente, Nome, Email, CEP, TipoLogradouro, Logradouro, Numero, Complemento, Bairro, Cidade, Estado)
VALUES
    (1, 'Cliente 1', 'cliente1@email.com', '54321-876', 'Rua', 'Rua da Esquina', '789', '', 'Centro', 'Cidade 1', 'Estado 1'),
    (2, 'Cliente 2', 'cliente2@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', 'Sala 5', 'Bairro 2', 'Cidade 2', 'Estado 2'),
    (3, 'Cliente 3', 'cliente3@email.com', '54321-876', 'Rua', 'Rua da Praça', '789', 'Apto 7', 'Centro', 'Cidade 3', 'Estado 3'),
    (4, 'Cliente 4', 'cliente4@email.com', '87654-321', 'Avenida', 'Avenida da Liberdade', '234', '', 'Bairro 4', 'Cidade 4', 'Estado 4'),
    (5, 'Cliente 5', 'cliente5@email.com', '54321-876', 'Rua', 'Rua da Esquina', '789', '', 'Centro', 'Cidade 5', 'Estado 5'),
    (6, 'Cliente 6', 'cliente6@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', 'Sala 5', 'Bairro 6', 'Cidade 6', 'Estado 6'),
    (7, 'Cliente 7', 'cliente7@email.com', '54321-876', 'Rua', 'Rua da Praça', '789', 'Apto 7', 'Centro', 'Cidade 7', 'Estado 7'),
    (8, 'Cliente 8', 'cliente8@email.com', '87654-321', 'Avenida', 'Avenida da Liberdade', '234', '', 'Bairro 8', 'Cidade 8', 'Estado 8'),
    (9, 'Cliente 9', 'cliente9@email.com', '54321-876', 'Rua', 'Rua da Esquina', '789', '', 'Centro', 'Cidade 9', 'Estado 9'),
    (10, 'Cliente 10', 'cliente10@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', 'Sala 5', 'Bairro 10', 'Cidade 10', 'Estado 10'),
    (11, 'Cliente 11', 'cliente11@email.com', '54321-876', 'Rua', 'Rua da Praça', '789', 'Apto 7', 'Centro', 'Cidade 11', 'Estado 11'),
    (12, 'Cliente 12', 'cliente12@email.com', '87654-321', 'Avenida', 'Avenida da Liberdade', '234', '', 'Bairro 12', 'Cidade 12', 'Estado 12'),
    (13, 'Cliente 13', 'cliente13@email.com', '54321-876', 'Rua', 'Rua da Esquina', '789', '', 'Centro', 'Cidade 13', 'Estado 13'),
    (14, 'Cliente 14', 'cliente14@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', 'Sala 5', 'Bairro 14', 'Cidade 14', 'Estado 14'),
    (15, 'Cliente 15', 'cliente15@email.com', '54321-876', 'Rua', 'Rua da Praça', '789', 'Apto 7', 'Centro', 'Cidade 15', 'Estado 15'),
    (16, 'Cliente 16', 'cliente16@email.com', '87654-321', 'Avenida', 'Avenida da Liberdade', '234', '', 'Bairro 16', 'Cidade 16', 'Estado 16'),
    (17, 'Cliente 17', 'cliente17@email.com', '54321-876', 'Rua', 'Rua da Esquina', '789', '', 'Centro', 'Cidade 17', 'Estado 17'),
    (18, 'Cliente 18', 'cliente18@email.com', '87654-321', 'Avenida', 'Avenida Central', '234', 'Sala 5', 'Bairro 18', 'Cidade 18', 'Estado 18'),
    (19, 'Cliente 19', 'cliente19@email.com', '54321-876', 'Rua', 'Rua da Praça', '789', 'Apto 7', 'Centro', 'Cidade 19', 'Estado 19'),
    (20, 'Cliente 20', 'cliente20@email.com', '87654-321', 'Avenida', 'Avenida da Liberdade', '234', '', 'Bairro 20', 'Cidade 20', 'Estado 20');

-- Inserção de registros em ClienteTelefones
INSERT INTO ClienteTelefones (IdClienteTelefone, IdCliente, TipoTelefone, NumeroTelefone)
VALUES
    (1, 1, 'Celular', '(99) 12345-6789'),
    (2, 1, 'Residencial', '(99) 98765-4321'),
    (3, 2, 'Celular', '(88) 5555-5555'),
    (4, 3, 'Celular', '(99) 12345-6789'),
    (5, 3, 'Residencial', '(99) 98765-4321'),
    (6, 4, 'Celular', '(88) 5555-5555'),
    (7, 4, 'Residencial', '(88) 1234-5678'),
    (8, 5, 'Celular', '(77) 98765-4321'),
    (9, 5, 'Residencial', '(77) 5555-5555'),
    (10, 6, 'Celular', '(66) 12345-6789'),
    (11, 6, 'Residencial', '(66) 98765-4321'),
    (12, 7, 'Celular', '(55) 5555-5555'),
    (13, 7, 'Residencial', '(55) 1234-5678'),
    (14, 8, 'Celular', '(44) 98765-4321'),
    (15, 8, 'Residencial', '(44) 5555-5555'),
    (16, 9, 'Celular', '(33) 12345-6789'),
    (17, 9, 'Residencial', '(33) 98765-4321'),
    (18, 10, 'Celular', '(22) 5555-5555'),
    (19, 10, 'Residencial', '(22) 1234-5678'),
    (20, 11, 'Celular', '(11) 98765-4321');

-- Inserção de registros em Pecas
INSERT INTO Pecas (IdPeca, Nome, Marca, QuantidadeEmEstoque, PrecoUnitario, IdFornecedor)
VALUES
    (1, 'Peca 1', 'Marca 1', 50, 25.00, 1),
    (2, 'Peca 2', 'Marca 2', 30, 40.00, 2),
    (3, 'Peca 3', 'Marca 3', 40, 30.00, 3),
    (4, 'Peca 4', 'Marca 4', 25, 50.00, 4),
    (5, 'Peca 5', 'Marca 5', 50, 25.00, 5),
    (6, 'Peca 6', 'Marca 6', 30, 40.00, 6),
    (7, 'Peca 7', 'Marca 7', 40, 30.00, 7),
    (8, 'Peca 8', 'Marca 8', 25, 50.00, 8),
    (9, 'Peca 9', 'Marca 9', 50, 25.00, 9),
    (10, 'Peca 10', 'Marca 10', 30, 40.00, 10),
    (11, 'Peca 11', 'Marca 11', 40, 30.00, 11),
    (12, 'Peca 12', 'Marca 12', 25, 50.00, 12),
    (13, 'Peca 13', 'Marca 13', 50, 25.00, 13),
    (14, 'Peca 14', 'Marca 14', 30, 40.00, 14),
    (15, 'Peca 15', 'Marca 15', 40, 30.00, 15),
    (16, 'Peca 16', 'Marca 16', 25, 50.00, 16),
    (17, 'Peca 17', 'Marca 17', 50, 25.00, 17),
    (18, 'Peca 18', 'Marca 18', 30, 40.00, 18),
    (19, 'Peca 19', 'Marca 19', 40, 30.00, 19),
    (20, 'Peca 20', 'Marca 20', 25, 50.00, 20);

-- Inserção de registros em Motos
INSERT INTO Motos (IdMoto, Marca, Modelo, Ano, Placa, IdCliente)
VALUES
    (1, 'Marca 1', 'Modelo 1', 2022, 'ABC-1234', 1),
    (2, 'Marca 2', 'Modelo 2', 2021, 'XYZ-5678', 2),
    (3, 'Marca 3', 'Modelo 3', 2023, 'XYZ-9876', 3),
    (4, 'Marca 4', 'Modelo 4', 2020, 'ABC-5432', 4),
    (5, 'Marca 5', 'Modelo 5', 2022, 'XYZ-5678', 5),
    (6, 'Marca 6', 'Modelo 6', 2021, 'XYZ-9876', 6),
    (7, 'Marca 7', 'Modelo 7', 2023, 'ABC-5432', 7),
    (8, 'Marca 8', 'Modelo 8', 2020, 'ABC-1234', 8),
    (9, 'Marca 9', 'Modelo 9', 2022, 'XYZ-5678', 9),
    (10, 'Marca 10', 'Modelo 10', 2021, 'XYZ-9876', 10),
    (11, 'Marca 11', 'Modelo 11', 2023, 'ABC-5432', 11),
    (12, 'Marca 12', 'Modelo 12', 2020, 'ABC-1234', 12),
    (13, 'Marca 13', 'Modelo 13', 2022, 'XYZ-5678', 13),
    (14, 'Marca 14', 'Modelo 14', 2021, 'XYZ-9876', 14),
    (15, 'Marca 15', 'Modelo 15', 2023, 'ABC-5432', 15),
    (16, 'Marca 16', 'Modelo 16', 2020, 'ABC-1234', 16),
    (17, 'Marca 17', 'Modelo 17', 2022, 'XYZ-5678', 17),
    (18, 'Marca 18', 'Modelo 18', 2021, 'XYZ-9876', 18),
    (19, 'Marca 19', 'Modelo 19', 2023, 'ABC-5432', 19),
    (20, 'Marca 20', 'Modelo 20', 2020, 'XYZ-1234', 20);

-- Inserção de registros em Servicos
INSERT INTO Servicos (IdServico, Descricao, DataAgendamento, DataConclusao, Custo, IdMoto)
VALUES
    (1, 'Troca de óleo', '2023-08-15', '2023-08-15', 50.00, 1),
    (2, 'Revisão completa', '2023-08-16', '2023-08-17', 150.00, 2),
    (3, 'Troca de filtro de ar', '2023-08-17', '2023-08-17', 30.00, 3),
    (4, 'Reparo no sistema de freios', '2023-08-18', '2023-08-19', 80.00, 4),
    (5, 'Troca de óleo', '2023-08-19', '2023-08-19', 50.00, 5),
    (6, 'Revisão completa', '2023-08-20', '2023-08-21', 150.00, 6),
    (7, 'Troca de filtro de ar', '2023-08-21', '2023-08-21', 30.00, 7),
    (8, 'Reparo no sistema de freios', '2023-08-22', '2023-08-23', 80.00, 8),
    (9, 'Troca de óleo', '2023-08-23', '2023-08-23', 50.00, 9),
    (10, 'Revisão completa', '2023-08-24', '2023-08-25', 150.00, 10),
    (11, 'Troca de filtro de ar', '2023-08-25', '2023-08-25', 30.00, 11),
    (12, 'Reparo no sistema de freios', '2023-08-26', '2023-08-27', 80.00, 12),
    (13, 'Troca de óleo', '2023-08-27', '2023-08-27', 50.00, 13),
    (14, 'Revisão completa', '2023-08-28', '2023-08-29', 150.00, 14),
    (15, 'Troca de filtro de ar', '2023-08-29', '2023-08-29', 30.00, 15),
    (16, 'Reparo no sistema de freios', '2023-08-30', '2023-08-31', 80.00, 16),
    (17, 'Troca de óleo', '2023-08-31', '2023-08-31', 50.00, 17),
    (18, 'Revisão completa', '2023-09-01', '2023-09-02', 150.00, 18),
    (19, 'Troca de filtro de ar', '2023-09-02', '2023-09-02', 30.00, 19),
    (20, 'Reparo no sistema de freios', '2023-09-03', '2023-09-04', 80.00, 20);

-- Inserção de registros em ServicoPecas
INSERT INTO ServicoPecas (IdServicoPeca, IdServico, IdPeca, QuantidadeUtilizada)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 1),
    (4, 4, 4, 3),
    (5, 5, 5, 1),
    (6, 6, 6, 2),
    (7, 7, 7, 1),
    (8, 8, 8, 2),
    (9, 9, 9, 1),
    (10, 10, 10, 2),
    (11, 11, 11, 1),
    (12, 12, 12, 3),
    (13, 13, 13, 1),
    (14, 14, 14, 2),
    (15, 15, 15, 1),
    (16, 16, 16, 2),
    (17, 17, 17, 1),
    (18, 18, 18, 2),
    (19, 19, 19, 1),
    (20, 20, 20, 3);
    
-- Recuperar todos os fornecedores:
SELECT * FROM Fornecedores;

-- Recuperar todos os clientes:
SELECT * FROM Clientes;

-- Recuperar todas as peças de reposição:
SELECT * FROM Pecas;

-- Recuperar fornecedores do estado 'Estado 1':
SELECT * FROM Fornecedores WHERE Estado = 'Estado 1';

-- Recuperar clientes da cidade 'Cidade 5':
SELECT * FROM Clientes WHERE Cidade = 'Cidade 5';

-- Recuperar peças de reposição com preço unitário superior a 50.00:
SELECT * FROM Pecas WHERE PrecoUnitario > 50.00;

-- Recuperar informações sobre motos junto com o cálculo da idade das motos:
SELECT Marca, Modelo, Ano, YEAR(NOW()) - Ano AS Idade FROM Motos;

-- Recuperar fornecedores ordenados pelo nome:
SELECT * FROM Fornecedores ORDER BY Nome;

-- Recuperar clientes ordenados pelo nome em ordem decrescente:
SELECT * FROM Clientes ORDER BY Nome DESC;

-- Recuperar a quantidade total de peças utilizadas nos serviços, apenas para peças com quantidade utilizada superior a 1:
SELECT IdPeca, SUM(QuantidadeUtilizada) AS TotalUtilizado
FROM ServicoPecas
GROUP BY IdPeca
HAVING TotalUtilizado > 1;

-- Recuperar informações sobre os serviços realizados nas motos, incluindo detalhes das motos e clientes relacionados:
SELECT S.IdServico, S.Descricao, M.Marca AS MarcaMoto, M.Modelo AS ModeloMoto, C.Nome AS NomeCliente
FROM Servicos AS S
INNER JOIN Motos AS M ON S.IdMoto = M.IdMoto
INNER JOIN Clientes AS C ON M.IdCliente = C.IdCliente;

-- Recuperar informações sobre as peças utilizadas em cada serviço, incluindo detalhes das peças:
SELECT SP.IdServico, P.Nome AS NomePeca, SP.QuantidadeUtilizada
FROM ServicoPecas AS SP
INNER JOIN Pecas AS P ON SP.IdPeca = P.IdPeca;



