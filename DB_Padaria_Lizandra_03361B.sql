USE DB_03361B_Lizandra_AULA06;

CREATE TABLE produtos_aula8 (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2)
);

CREATE TABLE fornecedores_aula8 (
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE vendas_aula8 (
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_venda DATE,
    CONSTRAINT fk_venda_produto FOREIGN KEY (id_produto) REFERENCES produtos_aula8(id)
);

INSERT INTO produtos_aula8 (nome, preco_unit) VALUES
	('bolo simples', 5.00),
    ('bolo de fubá', 4.00),
    ('bolo de chocolate', 7.00),
    ('pão caseiro', 6.00),
    ('pão francês', 0.10),
    ('café com leite', 1.00);
    
INSERT INTO fornecedores_aula8 (nome) VALUES
	('Fornecedor A'),
    ('Fornecedor B'),
    ('Fornecedor C');
    
INSERT INTO vendas_aula8 (id_produto, quantidade, data_venda) VALUES
	(1, 2, '2025-10-08'),
    (2, 1, '2025-10-08'),
    (3, 1, '2025-10-08'),
    (1, 1, '2025-10-07'),
    (2, 1, '2025-10-07'),
    (3, 2, '2025-10-07'),
    (4, 1, '2025-10-08'),
    (4, 2, '2025-10-07'),
    (5, 8, '2025-10-08'),
    (5, 10, '2025-10-07'),
    (6, 12, '2025-10-08'),
    (6, 9, '2025-10-07'),
    (1, 1, '2025-06-03'),
    (2, 2, '2025-06-03'),
    (3, 2, '2025-06-03'),
    (4, 2, '2025-06-03'),
    (5, 10, '2025-06-03'),
    (6, 8, '2025-06-03');
    
SELECT id_produto, SUM(quantidade) FROM vendas_aula8 GROUP BY id_produto;
SELECT id_produto, SUM(quantidade) FROM vendas_aula8 WHERE id_produto = 1;
SELECT * FROM vendas_aula8 WHERE data_venda = '2025-10-07';

-- 1. Listar todos os produtos cadastrados:
SELECT * FROM produtos_aula8;
-- 2. Listar total de unidades vendidas por produto:
SELECT id_produto, SUM(quantidade) FROM vendas_aula8 GROUP BY id_produto;
-- 3. Listar o total de vendas do Bolo de Fubá:
SELECT id_produto, SUM(quantidade) FROM vendas_aula8 WHERE id_produto = 2;
-- 4. Listar o total de vendas do Bolo de Chocolate:
SELECT id_produto, SUM(quantidade) FROM vendas_aula8 WHERE id_produto = 3;
-- 5. Produtos vendidos em 2025-06-03
SELECT * FROM vendas_aula8 WHERE data_venda = '2025-06-03';