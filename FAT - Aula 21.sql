-- New script in localhost.
-- Date: Oct 27, 2025
-- Time: 7:14:35 PM
-- Aula 21 - Funções internas do SQL

USE FAT_QualificaSP;

-- Biblioteca (para exemplos de funções)

CREATE TABLE Aula21_Livros (
  id INT PRIMARY KEY IDENTITY(1, 1),
  titulo NVARCHAR(100),
  autor NVARCHAR(200),
  preco DECIMAL(10, 2),
  data_publicacao DATE
);

INSERT INTO Aula21_Livros (titulo, autor, preco, data_publicacao) VALUES
  ('O Alquimista', 'Paulo Coelho', 39.90, '19880101'),
  ('Dom Casmurro', 'Machado de Assis', 29.50, '18990101'),
  ('Grande Sertão: Veredas', 'João Guimarães Rosa', 49.90, '19560101'),
  ('1984', 'George Orwell', 34.90, '19490608'),
  ('Cem Anos de Solidão', 'Gabriel García Márquez', 44.90, '19670530'),
  ('O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 59.90, '19540729'),
  ('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 49.00, '20110101'),
  ('A Revolução dos Bichos', 'George Orwell', 24.90, '19450817'),
  ('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 31.90, '18811001'),
  ('Vidas Secas', 'Graciliano Ramos', 27.90, '19380101'),
  ('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 22.90, '19430406'),
  ('Ensaio Sobre a Cegueira', 'José Saramago', 38.50, '19950101'),
  ('A Menina que Roubava Livros', 'Markus Zusak', 42.90, '20050101'),
  ('O Hobbit', 'J.R.R. Tolkien', 45.90, '19370921'),
  ('O Nome da Rosa', 'Umberto Eco', 54.90, '19800101'),
  ('A Hora da Estrela', 'Clarice Lispector', 33.90, '19770101'),
  ('Crime e Castigo', 'Fiódor Dostoiévski', 39.90, '18660101'),
  ('O Apanhador no Campo de Centeio', 'J.D. Salinger', 29.90, '19510716'),
  ('Fahrenheit 451', 'Ray Bradbury', 28.90, '19531019'),
  ('A Sangue Frio', 'Truman Capote', 46.90, '19660101'),
  ('Os Maias', 'Eça de Queirós', 32.50, '18880101'),
  ('Ulisses', 'James Joyce', 60.00, '19220202'),
  ('O Diário de Anne Frank', 'Anne Frank', 26.90, '19470625'),
  ('Coração das Trevas', 'Joseph Conrad', 34.50, '18990101'),
  ('Colapso: Como as Sociedades Escolhem o Fracasso ou o Sucesso', 'Jared Diamond', 52.90, '20050101'),
  ('O Processo', 'Franz Kafka', 30.90, '19250101'),
  ('Os Irmãos Karamázov', 'Fiódor Dostoiévski', 55.90, '18800101'),
  ('O Mundo de Sofia', 'Jostein Gaarder', 37.90, '19910101'),
  ('Cem Sonhos de Pedra', 'Irène Némirovsky', 43.90, '20010101'),
  ('O Velho e o Mar', 'Ernest Hemingway', 28.50, '19520901'),
  ('A Insustentável Leveza do Ser', 'Milan Kundera', 39.90, '19840101'),
  ('O Estrangeiro', 'Albert Camus', 31.90, '19420101'),
  ('A Montanha Mágica', 'Thomas Mann', 58.90, '19240101'),
  ('Os Miseráveis', 'Victor Hugo', 65.90, '18620101'),
  ('Guerra e Paz', 'Liev Tolstói', 69.90, '18690101'),
  ('Beloved', 'Toni Morrison', 45.90, '19870101'),
  ('A Metamorfose', 'Franz Kafka', 22.90, '19150101'),
  ('O Guia do Mochileiro das Galáxias', 'Douglas Adams', 35.90, '19791012'),
  ('Anna Karênina', 'Liev Tolstói', 59.50, '18770101'),
  ('Os Homens que Não Amavam as Mulheres', 'Stieg Larsson', 46.90, '20050101'),
  ('A Cabana', 'William P. Young', 39.00, '20070101'),
  ('Como Fazer Amigos e Influenciar Pessoas', 'Dale Carnegie', 29.90, '19360101'),
  ('A Arte da Guerra', 'Sun Tzu', 24.00, '05000101'),
  ('O Poder do Hábito', 'Charles Duhigg', 47.90, '20120101'),
  ('A Menina que Brincava com Fogo', 'Stieg Larsson', 44.90, '20060101'),
  ('Persuasão', 'Jane Austen', 33.50, '18170101'),
  ('Orgulho e Preconceito', 'Jane Austen', 34.50, '18130101'),
  ('Hamlet', 'William Shakespeare', 29.00, '16000101'),
  ('O Morro dos Ventos Uivantes', 'Emily Brontë', 32.90, '18470101'),
  ('1984 – Edição Especial', 'George Orwell', 49.90, '19490608'),
  ('Meditações', 'Marco Aurélio', 27.90, '01800101');

SELECT UPPER(titulo) FROM Aula21_Livros AS "Título em maiúsculas";

SELECT LOWER(autor) FROM Aula21_Livros AS "Autor em minúsculas";

SELECT LEN(titulo) FROM Aula21_Livros AS "Comprimento do título";

SELECT SUBSTRING(titulo, 3, 8) FROM Aula21_Livros AS "Substring do título";

SELECT LEFT(titulo, 4) FROM Aula21_Livros AS "Left do título";

SELECT RIGHT(autor, 4) FROM Aula21_Livros AS "Right do autor";

SELECT ROUND(preco, 2) FROM Aula21_Livros AS "Arredondamento do preço";

SELECT titulo, autor, CURRENT_TIMESTAMP AS "Data e hora da obtenção" FROM Aula21_Livros;
-- Exibe uma nova coluna com o timestamp atual.


CREATE TABLE Aula21_ProdutoPadaria (
    id INT PRIMARY KEY IDENTITY(1, 1),
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

INSERT INTO Aula21_ProdutoPadaria (nome, preco) VALUES
    ('Pão Francês', 0.80),
    ('Pão de Queijo', 2.50),
    ('Croissant', 4.00),
    ('Baguete', 5.50),
    ('Pão Integral', 6.00),
    ('Pão de Forma', 7.50),
    ('Rosca Doce', 4.20),
    ('Sonho com Creme', 5.00),
    ('Pão de Batata', 3.80),
    ('Enroladinho de Salsicha', 4.50),
    ('Coxinha', 5.00),
    ('Empada de Frango', 5.50),
    ('Pastel de Carne', 6.00),
    ('Pastel de Queijo', 6.00),
    ('Torta de Frango', 7.50),
    ('Torta de Palmito', 8.00),
    ('Pão Doce com Coco', 3.50),
    ('Pão Recheado com Presunto e Queijo', 5.00),
    ('Pão Australiano', 7.00),
    ('Pão de Milho', 4.80),
    ('Mini Pizza', 6.00),
    ('Esfirra de Carne', 5.00),
    ('Esfirra de Queijo', 5.00),
    ('Pão Sírio', 6.00),
    ('Bolo de Cenoura', 8.50),
    ('Bolo de Chocolate', 9.00),
    ('Bolo de Fubá', 7.50),
    ('Bolo de Milho', 8.00),
    ('Bolo de Laranja', 8.00),
    ('Bolo de Limão', 8.00),
    ('Pão com Calabresa', 5.20),
    ('Pão com Catupiry', 5.30),
    ('Torta de Morango', 9.50),
    ('Torta de Limão', 9.00),
    ('Torta de Maracujá', 9.00),
    ('Brownie', 6.00),
    ('Cookies', 4.00),
    ('Pão de Centeio', 6.50),
    ('Pão de Linhaça', 6.80),
    ('Pão Multigrãos', 7.20),
    ('Pão de Banana', 5.50),
    ('Mini Croissant de Chocolate', 3.80),
    ('Mini Pão de Queijo', 1.50),
    ('Pão de Aveia', 6.00),
    ('Empadão de Frango', 9.50),
    ('Torta de Chocolate', 10.00),
    ('Brioche', 6.50),
    ('Pão de Alho', 4.00),
    ('Pão Sovado', 5.00),
    ('Rocambole de Doce de Leite', 9.00),
    ('Rocambole de Chocolate', 9.00);

-- Mostrar os nomes dos produtos em maiúsculas

SELECT nome, UPPER(nome) AS "Nome em maiúsculas" FROM Aula21_ProdutoPadaria as app;

-- Mostrar os nomes dos produtos em minúsculas

SELECT nome, LOWER(nome) AS "Nome em minúsculas" FROM Aula21_ProdutoPadaria as app;

-- Contar quantas letras têm os nomes dos produtos

SELECT nome, LEN(nome) AS "Comprimento do nome" FROM Aula21_ProdutoPadaria as app;

-- Exibir as três primeiras letras dos nomes dos produtos

SELECT nome, LEFT(nome, 3) AS "Três primeiras letras" FROM Aula21_ProdutoPadaria as app;

-- Arredondar o preço

SELECT nome, ROUND(preco, 0) FROM Aula21_ProdutoPadaria as app;

-- Mostrar a data atual com os produtos

SELECT *, CURRENT_TIMESTAMP AS "Carimbo de data e hora", GETDATE() AS "Função GETDATE" FROM Aula21_ProdutoPadaria as app;

-- A Fernanda colocou todos os casos em um só SELECT:

SELECT
  nome,
  UPPER(nome) AS "Nome em maiúsculas",
  LOWER(nome) AS "Nome em minúsculas",
  LEN(nome) AS "Comprimento do nome",
  LEFT(nome, 3) AS "Três primeiras letras",
  SUBSTRING(nome, 1, 3) AS "Três primeiras letras usando SUBSTRING",
  preco,
  ROUND(preco, 0),
  CURRENT_TIMESTAMP AS "Carimbo de data e hora",
  GETDATE() AS "Função GETDATE"
FROM Aula21_ProdutoPadaria as app;