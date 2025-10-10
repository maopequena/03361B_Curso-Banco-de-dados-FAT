-- Você foi contratado para criar o banco de dados
-- de uma locadora de carros. O sistema precisa armazenar
-- informações sobre os clientes, os automóveis disponíveis
-- e as locações realizadas. 

-- 1. Criar um banco de dados e as tabelas com seus respectivos relacionamentos

CREATE DATABASE DB_LocadoraCarros_Lizandra_03361B;
USE DB_LocadoraCarros_Lizandra_03361B;

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

 CREATE TABLE automoveis (
	id_automovel INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    tipo VARCHAR(50)
 );

CREATE TABLE locacoes (
	id_datalocacao INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_automovel INT NOT NULL,
    data_iniciolocacao DATE NOT NULL,
    data_finallocacao DATE NOT NULL,
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_id_automovel FOREIGN KEY (id_automovel) REFERENCES automoveis(id_automovel)
);

-- 2. Inserir os dados nas respectivas tabelas;
INSERT INTO clientes (nome, sobrenome, telefone, email) VALUES
	('Pedro', 'Gonçalves', '(11) 4321-5678', 'pgoncalves@email.com'),
    ('Brenda', 'Fernandes', '(11) 7654-0123', 'bfernandes@email.com'),
    ('Vinicius', 'Monte', '(11) 5432-4567', 'vmonte@email.com'),
    ('Clara', 'Barbosa', '(11) 8765-9012', 'cbarbosa@email.com'),
    ('Paulo', 'Araujo', '(11) 6543-3456', 'paraujo@email.com'),
    ('Lara', 'Cardoso', '(11) 9876-8901', 'lcardoso@email.com'),
    ('Diogo', 'Martins', '(11) 7654-2345', 'dmartins@email.com'),
    ('Marina', 'Azevedo', '(11) 90987-7890', 'mazevedo@email.com'),
    ('Vitor', 'Schmidt', '(11) 8765-1234', 'vschmidt@email.com'),
    ('Yasmin', 'Correia', '(11) 91098-6789', 'ycorreia@email.com');
    
INSERT INTO automoveis (marca, modelo, tipo) VALUES
	('Fiat', 'Argo', 'Hatchback'),
    ('Fiat', 'Cronos', 'Sedan'),
    ('Fiat', 'Ducato', 'SUV'),
    ('Volkswagen', 'Amarok', 'Picape'),
    ('Volkswagen', 'Jetta', 'Sedan'),
    ('Volkswagen', 'Nivus', 'Hatchback'),
    ('Toyota', 'Corolla', 'Sedan'),
    ('Toyota', 'Hilux', 'Picape'),
    ('Toyota', 'RAV4', 'SUV'),
    ('Hyundai', 'Creta', 'SUV'),
    ('Hyundai', 'HB20', 'Hatchback'),
    ('Hyundai', 'HB20', 'Sedan'),
    ('Hyundai', 'Palisade', 'SUV');
    
INSERT INTO locacoes (id_cliente, id_automovel, data_iniciolocacao, data_finallocacao) VALUES
	(1, 12, '2013-01-14', '2013-01-21'),
    (2, 10, '2015-02-01', '2015-02-10'),
    (3, 8, '2015-03-17', '2015-03-18'),
    (4, 6, '2016-11-27', '2016-12-10'),
    (5, 4, '2017-09-11', '2017-09-19'),
    (6, 2, '2018-04-21', '2018-04-27'),
    (7, 11, '2019-03-05', '2019-03-10'),
    (8, 9, '2019-10-25', '2019-10-29'),
    (9, 7, '2020-08-30', '2020-09-09'),
    (10, 5, '2020-11-20', '2020-11-27');

-- 3. Consultar todos os clientes cadastrados.
SELECT * FROM clientes;

-- 4. Consultar todos os automóveis disponíveis.
SELECT * FROM automoveis;

-- 5. Consultar informações sobre o cliente e o automóvel locado, incluindo a data de início e fim da locação, a marca e o modelo do automóvel.
SELECT * FROM locacoes ORDER BY id_automovel;

-- 6. Consultar informações sobre os automóveis locados em uma data específica, incluindo a marca e o modelo.
SELECT * FROM locacoes WHERE data_iniciolocacao >= '2015-01-01';