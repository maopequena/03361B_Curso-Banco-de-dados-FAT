USE DB_03361B_Lizandra_AULA06;

-- Pensando em um negócio de uma padaria, você deverá aplicar os conceitos de joins não idênticas
-- e joins externas para resolver os seguintes desafios. Considere que você terá as tabelas
-- Venda, Desconto e Produto.

CREATE TABLE A17_Produto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    CHECK(preco > 0.0)
);

CREATE TABLE A17_Venda(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_A17_venda_produto
    FOREIGN KEY (id_produto) REFERENCES A17_Produto(id),
    CHECK(quantidade > 0)
);

CREATE TABLE A17_Desconto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_faixa VARCHAR(50),
    qtd_min INT NOT NULL,
    qtd_max INT NOT NULL,
    desconto DECIMAL(3, 2),
    CHECK(desconto >= 0.0 AND desconto <= 1.0)
);

INSERT INTO A17_Produto (nome, preco) VALUES
('Pão Francês', 0.80),
('Pão de Queijo', 2.50),
('Croissant', 4.20),
('Bolo de Cenoura com Cobertura de Chocolate', 25.00),
('Sonho de Creme', 5.50),
('Torta de Frango', 38.00),
('Coxinha de Frango', 4.00),
('Empada de Palmito', 4.50),
('Biscoito Caseiro', 3.80),
('Café Expresso', 6.00);

INSERT INTO A17_Venda (id_produto, quantidade) VALUES
(1, 5),
(3, 2),
(5, 4),
(7, 6),
(2, 3),
(6, 8),
(8, 2),
(9, 5),
(1, 4),
(2, 1),
(3, 3),
(7, 7),
(8, 1),
(9, 2),
(5, 6),
(6, 3),
(1, 2),
(2, 5),
(3, 4),
(5, 7),
(6, 1),
(7, 3),
(8, 4),
(9, 6),
(1, 8),
(2, 2),
(3, 1),
(5, 5),
(6, 4),
(7, 6),
(8, 3),
(9, 1),
(1, 7),
(2, 4),
(3, 5),
(5, 2),
(6, 7),
(7, 1),
(8, 5),
(9, 8),
(1, 3),
(2, 6),
(3, 7),
(5, 8),
(6, 5),
(7, 2),
(8, 6),
(9, 3),
(1, 1),
(2, 8);

INSERT INTO A17_Desconto (nome_faixa, qtd_min, qtd_max, desconto) VALUES
("FAIXA C", 1, 5, 0.0),
("FAIXA B", 6, 10, 0.05),
("FAIXA A", 11, 999, 0.1);

-- Desafio 1: Listar todos os produtos disponíveis, mostrando quantas vezes cada um foi vendido, mesmo que nunca tenha sido vendido.
-- Dica: será preciso uma join externa para garantir que todos os produtos sejam listados, independentemente de terem sido vendidos.

SELECT p.nome, SUM(v.quantidade)
FROM A17_Produto p
LEFT JOIN A17_Venda v
ON p.id = v.id_produto
GROUP BY p.nome;

-- SOLUÇÃO ALTERNATIVA COM NULL EXIBIDO COMO 0

SELECT p.nome, COALESCE(SUM(v.quantidade), 'Sem vendas') AS Total_vendas
FROM A17_Produto p
LEFT JOIN A17_Venda v
ON p.id = v.id_produto
GROUP BY p.nome;

-- Desafio 2: Classificar as vendas por desconto progressivo.
	-- Faixa A (+10 unidades): 10% de desconto
	-- Faixa B (entre 5 e 10 unidades): 5% de desconto
	-- Faixa C (até 5 unidades): 0% de desconto
-- Com base na quantidade de cada item, aplicar o desconto para cada venda.
-- Dica: este desafio requer uma join não idêntica para associar o preço de cada produto a uma faixa de preço predefinida.

-- NdoT: Acho que é preciso criar uma nova tabela intermediária que contenha 

SELECT v.id, p.nome, p.preco, v.quantidade, d.nome_faixa,
	ROUND(v.quantidade * p.preco, 2) AS sem_desconto,
    ROUND(v.quantidade * p.preco * (1 - d.desconto), 2) AS com_desconto
FROM A17_Venda v
JOIN A17_Produto p
	ON v.id_produto = p.id
JOIN A17_Desconto d
	ON v.quantidade
    BETWEEN d.qtd_min AND d.qtd_max;
    
-- SOLUÇÃO ALTERNATIVA COM AS FUNÇÕES CONCAT E FORMAT

SELECT v.id, p.nome, CONCAT('R$ ', FORMAT(p.preco, 2, 'pt_BR')) AS preco, v.quantidade, d.nome_faixa,
	CONCAT('R$ ', FORMAT((v.quantidade * p.preco), 2, 'pt_BR')) AS sem_desconto,
    CONCAT('R$ ', FORMAT((v.quantidade * p.preco)*(1 - d.desconto), 2, 'pt_BR')) AS com_desconto
FROM A17_Venda v
JOIN A17_Produto p
	ON v.id_produto = p.id
JOIN A17_Desconto d
	ON v.quantidade
    BETWEEN d.qtd_min AND d.qtd_max;