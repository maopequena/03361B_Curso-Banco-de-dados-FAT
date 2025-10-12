CREATE DATABASE DB_DesafioAula10_Lizandra_03361B;
USE DB_DesafioAula10_Lizandra_03361B;

CREATE TABLE Produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(15) NOT NULL,
    categoria VARCHAR(15) NOT NULL,
    preco DECIMAL(7, 2) NOT NULL,
    estoque INT NOT NULL
);

ALTER TABLE Produtos MODIFY COLUMN nome_produto VARCHAR(50);

INSERT INTO Produtos (id_produto, nome_produto, categoria, preco, estoque) VALUES
	(1, 'Smartphone X', 'Eletrônicos', 2500.00, 50),
    (2, 'Fone de Ouvido Z', 'Eletrônicos', 350.00, 0),
    (3, 'Notebook Pro', 'Eletrônicos', 7800.00, 25),
    (4, 'Caneca Branca', 'Cozinha', 25.00, 200),
    (5, 'Smartwatch Y', 'Eletrônicos', 1800.00, 40),
    (6, 'Teclado Gamer', 'Eletrônicos', 650.00, 80),
    (7, 'Mouse sem Fio', 'Eletrônicos', 150.00, 120);
    
SELECT nome_produto AS Produto, preco AS Valor FROM Produtos WHERE
	categoria = 'Eletrônicos' AND estoque > 0 ORDER BY preco DESC;