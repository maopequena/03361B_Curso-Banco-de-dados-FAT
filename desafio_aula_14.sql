USE DB_PraticaFAT_Lizandra_03361B;

CREATE TABLE Desafio_Aula14_Clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome_cliente VARCHAR(100) NOT NULL
);

INSERT INTO Desafio_Aula14_Clientes (id_cliente, nome_cliente) VALUES
  (1, 'Ana Silva'),
  (2, 'Bruno Costa'),
  (3, 'Carla Reis');

CREATE TABLE Desafio_Aula14_Pedidos (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  produto_nome VARCHAR(100) NOT NULL,
  cliente_id INT
) AUTO_INCREMENT = 101;

INSERT INTO Desafio_Aula14_Pedidos
	(id_pedido, produto_nome, cliente_id) VALUES
	(101, 'Notebook', 2),
	(102, 'Mouse', 1),
	(103, 'Teclado', 2);

-- Seu gerente pediu dois relatórios distintos. Para cada um, você precisa decidir qual tipo de JOIN usar.
-- Relatório 1 (clientes ativos): crie uma consulta que retorne uma lista contendo apenas os clientes que já fizeram algum pedido, mostrando o nome do cliente e o nome do produto que compraram.
SELECT c.nome_cliente, p.produto_nome
	FROM Desafio_Aula14_Clientes AS c
	INNER JOIN Desafio_Aula14_Pedidos AS p
    ON c.id_cliente = p.cliente_id;

-- Relatório 2 (lista completa de clientes): crie uma consulta que retorne uma lista de todos os clientes cadastrados, mostrando o nome do cliente e o produto que compraram. Se um cliente nunca comprou nada, o nome do produto deve aparecer como NULL.
SELECT c.nome_cliente, p.produto_nome
	FROM Desafio_Aula14_Clientes AS c
	LEFT JOIN Desafio_Aula14_Pedidos AS p
    ON c.id_cliente = p.cliente_id;