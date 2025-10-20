USE livraria_db_Jane;

SHOW TABLES;
DESCRIBE Autores;
INSERT INTO Autores (nome_autor) VALUES
	('Machado de Assis'),
    ('George Orwell');
    
DESCRIBE Livros;
INSERT INTO Livros (titulo_livro, id_autor) VALUES
	('Dom Casmurro', 2),
    ('A Revolução dos Bichos', 3),
	('1984', 3),
    ('A Revolução dos Bichos', 3),
    ('Memórias Póstumas de Brás Cubas', 2),
    ('Quincas Borba', 2),
    ('O Lustre', 1);

DESCRIBE Vendas;
INSERT INTO Vendas (id_livro, quantidade, data_venda) VALUES
    (1, 1, '2024-01-15'),
    (1, 1, '2024-02-20'),
    (1, 1, '2024-03-10'),
    (2, 1, '2024-01-22'),
    (2, 1, '2024-03-05'),
    (4, 1, '2024-02-14'),
    (4, 1, '2024-03-18'),
    (6, 1, '2024-01-30'),
    (6, 1, '2024-02-25'),
    (7, 1, '2024-03-20');
    
SELECT * FROM Autores;
SELECT * FROM Livros;
SELECT * FROM Vendas;

-- **Observação:** Note que o livro "Dom Casmurro" e "A Revolução dos Bichos" existem, mas ainda não possuem nenhum registro de venda.
-- O autor "Machado de Assis" também não teve livros vendidos ainda.
-- Escreva as consultas SQL para gerar os seguintes relatórios:

-- 1. **Relatório 1 (Catálogo Completo):**
	-- Crie uma consulta que mostre o **título** de cada livro e o **nome do seu respectivo autor**.
SELECT l.titulo_livro AS 'Título', a.nome_autor AS Autor
	FROM Livros AS l
    INNER JOIN Autores AS a
    ON a.id_autor = l.id_autor;

-- 2. **Relatório 2 (Itens Vendidos):**
	-- Crie uma consulta que liste apenas o **título** dos livros que foram vendidos
    -- e a **quantidade vendida** em cada transação.
    
SELECT l.titulo_livro AS 'Título', v.quantidade AS 'Qtdd vendida'
	FROM Livros AS l
    INNER JOIN Vendas as v
    ON l.id_livro = v.id_livro;

-- 3. **Relatório 3 (Detalhes da Venda):**
	-- Crie uma consulta mais completa que mostre o **título do livro vendido**,
    -- o **nome do autor** e a **quantidade vendida**.
    -- (Dica: você precisará juntar 3 tabelas!).
SELECT l.titulo_livro AS 'Título', a.nome_autor AS 'Autor', v.quantidade AS 'Qtdd vendida'
	FROM Livros AS l
	INNER JOIN Autores as a
    ON l.id_autor = a.id_autor
    INNER JOIN Vendas AS v
    ON l.id_livro = v.id_livro;

-- 4. **Relatório 4 (Status de Vendas de Todos os Livros):**
	-- Crie uma lista de **TODOS os livros** do catálogo e a **quantidade vendida**.
    -- Se um livro nunca foi vendido, a quantidade deve aparecer como `NULL`.
SELECT l.titulo_livro AS 'Título', v.quantidade AS 'Qtdd vendida'
	FROM Livros AS l
    LEFT JOIN Vendas as v
    ON l.id_livro = v.id_livro;
    
-- 5. Salve todas as suas 4 consultas `SELECT` em um único arquivo chamado `desafio_aula15.sql`.
-- 6. Faça o *commit* e *push* do arquivo para seu repositório no GitHub com a mensagem
	-- "Desafio da Aula 15 concluído".