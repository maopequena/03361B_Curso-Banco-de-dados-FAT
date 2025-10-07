-- Atividade prática 1

-- Pensando em um negócio de papelaria, dadas as tabelas de 
-- produtos, vendas e fornecedores, Pergunta-se quais comandos
-- para criar, inserir e visualizar os registros dessas tabelas.

CREATE DATABASE DB_Papelaria_Lizandra_03361B;
USE DB_Papelaria_Lizandra_03361B;

CREATE TABLE Produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    descricao TEXT,
    unidade VARCHAR(4) NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario FLOAT NOT NULL
);

CREATE TABLE Vendas (
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATETIME NOT NULL,
    quantidade INT NOT NULL,
    valor_total FLOAT NOT NULL
);

CREATE TABLE Fornecedores (
	id_fornecedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    contato VARCHAR(100)
);

INSERT INTO Produtos (nome_produto, descricao, unidade,
	quantidade, preco_unitario) VALUES 
    ("Clipe de papel", "Clipes de papel da marca XYZ", "cx", 20, 5.00),
    ("Papel almaço", "Papel almaço duplo da marca ABC", "flh", 100, 0.30),
    ("Papel sulfite", "Papel sulfite da marca ABC", "pct", 50, 10.00),
    ("Grampeador vermelho", "Grampeador da cor vermelha da marca DEF", "undd", 50, 12.00),
    ("Grampos para grampeador", "Grampos para grampeadores da marca DEF", "cx", 100, 8.00),
    ("Canetas azul", "Caneta esferográficas da cor azul, marca XYZ", "undd", 200, 1.00);

INSERT INTO Fornecedores (nome, telefone, email, contato) VALUES 
	("Papeis ABC", "1191234-5678", "abcpapeis@email.com.br", "Thais"),
    ("XYZ Artigos de escritório", "1195678-1234", "xyz.art.escritorio@email.com.br", "Junio"),
    ("DEF Papeis e artigos de escritório", "1192468-1357", "DEF_escritorio@email.com.br", "Helena");

INSERT INTO Vendas (data_venda, quantidade, valor_total) VALUES
	("2025-10-06 14:28:16", 1, 1.00),
    ("2025-09-05 15:29:17", 2, 0.60),
    ("2025-08-04 16:30:18", 1, 10.00),
    ("2025-07-03 17:31:19", 2, 2.00);
    
SELECT * FROM Produtos;
SELECT * FROM Fornecedores;
SELECT * FROM Vendas;