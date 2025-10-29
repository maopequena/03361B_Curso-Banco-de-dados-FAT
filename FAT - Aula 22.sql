-- New script in localhost.
-- Date: Oct 28, 2025
-- Time: 7:16:04 PM
-- Aula 22 - Continuação de Funções internas do SQL

USE FAT_QualificaSP;

CREATE TABLE VideoGames_Aula22 (
  id INT PRIMARY KEY IDENTITY(1, 1),
  aparelho NVARCHAR(100),
  marca NVARCHAR(100),
  preco_locacao DECIMAL(10, 2)
);

CREATE TABLE Jogos_Aula22 (
  id INT PRIMARY KEY IDENTITY(1, 1),
  titulo NVARCHAR(100),
  desenvolvedora NVARCHAR(100),
  id_plataforma INT NOT NULL,
  CONSTRAINT FK_Jogos_VideoGames FOREIGN KEY (id_plataforma) REFERENCES VideoGames_Aula22(id),
  preco_locacao DECIMAL(10, 2),
);

CREATE TABLE Cliente_Aula22 (
  id INT PRIMARY KEY IDENTITY(1, 1),
  nome NVARCHAR(200) NOT NULL,
  tel_residencial NVARCHAR(20) NOT NULL,
  tel_celular NVARCHAR(20),
  email NVARCHAR(100) UNIQUE
);

CREATE TABLE AluguelJogo_Aula22 (
  id INT PRIMARY KEY IDENTITY(1, 1),
  id_cliente INT NOT NULL,
  CONSTRAINT FK_Cliente_AluguelJogo FOREIGN KEY (id_cliente) REFERENCES Cliente_Aula22(id),
  id_jogo INT,
  CONSTRAINT FK_Jogo_AluguelJogo FOREIGN KEY (id_jogo) REFERENCES Jogos_Aula22(id),
  data_locacao DATE DEFAULT CURRENT_TIMESTAMP,
  data_devolucao_est DATE DEFAULT DATEADD(day, 3, CURRENT_TIMESTAMP),
  data_devolucao_real DATE,
  devolvido SMALLINT
);

CREATE TABLE AluguelConsole_Aula22 (
  id INT PRIMARY KEY IDENTITY(1, 1),
  id_cliente INT NOT NULL,
  CONSTRAINT FK_Cliente_AluguelConsole FOREIGN KEY (id_cliente) REFERENCES Cliente_Aula22(id),
  id_console INT,
  CONSTRAINT FK_Console_AluguelConsole FOREIGN KEY (id_console) REFERENCES VideoGames_Aula22(id),
  data_locacao DATE DEFAULT CURRENT_TIMESTAMP,
  data_devolucao_est DATE DEFAULT DATEADD(day, 3, CURRENT_TIMESTAMP),
  data_devolucao_real DATE,
  devolvido SMALLINT
);

INSERT INTO VideoGames_Aula22 (aparelho, marca, preco_locacao) VALUES
  ('Atari 2600', 'Atari', 12.50),
  ('Nintendo Entertainment System (NES)', 'Nintendo', 14.00),
  ('Super Nintendo Entertainment System (SNES)', 'Nintendo', 15.50),
  ('Nintendo 64', 'Nintendo', 16.00),
  ('GameCube', 'Nintendo', 17.00),
  ('Wii', 'Nintendo', 20.00),
  ('Game Boy', 'Nintendo', 10.00),
  ('Game Boy Advance', 'Nintendo', 11.50),
  ('PlayStation', 'Sony', 15.00),
  ('PlayStation 2', 'Sony', 18.00),
  ('PlayStation 3', 'Sony', 22.00),
  ('PlayStation Portable (PSP)', 'Sony', 13.50),
  ('Sega Master System', 'Sega', 12.00),
  ('Sega Mega Drive (Genesis)', 'Sega', 13.00),
  ('Sega Saturn', 'Sega', 14.50),
  ('Sega Dreamcast', 'Sega', 16.50),
  ('Xbox', 'Microsoft', 17.00),
  ('Xbox 360', 'Microsoft', 21.00),
  ('Neo Geo', 'SNK', 19.00),
  ('3DO Interactive Multiplayer', 'Panasonic', 18.50);

INSERT INTO Jogos_Aula22 (titulo, desenvolvedora, id_plataforma, preco_locacao) VALUES
  ('Pitfall!', 'Activision', 1, 8.50),
  ('Super Mario Bros.', 'Nintendo', 2, 9.00),
  ('The Legend of Zelda: A Link to the Past', 'Nintendo', 3, 9.50),
  ('GoldenEye 007', 'Rare', 4, 10.00),
  ('Super Smash Bros. Melee', 'HAL Laboratory', 5, 10.50),
  ('The Legend of Zelda: Twilight Princess', 'Nintendo', 6, 11.00),
  ('Pokémon Red', 'Game Freak', 7, 8.00),
  ('Metroid Fusion', 'Nintendo', 8, 8.50),
  ('Final Fantasy VII', 'Square Enix', 9, 10.50),
  ('Grand Theft Auto: San Andreas', 'Rockstar Games', 10, 11.50),
  ('Uncharted: Drake’s Fortune', 'Naughty Dog', 11, 12.00),
  ('God of War: Chains of Olympus', 'Ready at Dawn', 12, 9.50),
  ('Alex Kidd in Miracle World', 'Sega', 13, 8.00),
  ('Sonic the Hedgehog', 'Sega', 14, 8.50),
  ('Nights into Dreams', 'Sega', 15, 9.00),
  ('Shenmue', 'Sega AM2', 16, 9.50),
  ('Halo: Combat Evolved', 'Bungie', 17, 10.00),
  ('Halo 3', 'Bungie', 18, 12.00),
  ('Metal Slug', 'SNK', 19, 9.50),
  ('Gex', 'Crystal Dynamics', 20, 8.50);

INSERT INTO Cliente_Aula22 (nome, tel_residencial, tel_celular, email) VALUES
  ('Carlos Eduardo Lima', '(11) 3456-7890', '(11) 98765-4321', 'carlos.lima@gmail.com'),
  ('Mariana Souza Oliveira', '(21) 2345-6789', '(21) 99876-5432', 'mariana.oliveira@yahoo.com'),
  ('Rafael Martins Pereira', '(31) 3344-5566', '(31) 99777-8899', 'rafael.martins@outlook.com'),
  ('Fernanda Costa Silva', '(41) 2233-4455', '(41) 99666-7788', 'fernanda.costa@gmail.com'),
  ('João Henrique Almeida', '(51) 4455-6677', '(51) 99111-2233', 'joao.almeida@hotmail.com'),
  ('Beatriz Ramos Nunes', '(71) 5566-7788', '(71) 98989-1212', 'beatriz.nunes@gmail.com'),
  ('Lucas Gabriel Rocha', '(61) 6677-8899', '(61) 98888-7777', 'lucas.rocha@live.com'),
  ('Patrícia Mendes Cardoso', '(81) 7788-9900', '(81) 98777-6655', 'patricia.cardoso@gmail.com'),
  ('Gustavo Ferreira Pinto', '(85) 8899-0011', '(85) 98654-3210', 'gustavo.pinto@yahoo.com'),
  ('Aline Rodrigues Santos', '(19) 9900-1122', '(19) 98555-4433', 'aline.santos@gmail.com'),
  ('Thiago Barbosa Lima', '(31) 2233-4455', '(31) 98444-3322', 'thiago.lima@hotmail.com'),
  ('Camila Duarte Moreira', '(11) 3344-5566', '(11) 98333-2211', 'camila.moreira@gmail.com'),
  ('Rodrigo Azevedo Melo', '(21) 4455-6677', '(21) 98222-1100', 'rodrigo.melo@outlook.com'),
  ('Juliana Tavares Borges', '(41) 5566-7788', '(41) 98111-0099', 'juliana.borges@gmail.com'),
  ('André Luiz Carvalho', '(51) 6677-8899', '(51) 98000-9988', 'andre.carvalho@gmail.com'),
  ('Tatiane Moura Ribeiro', '(71) 7788-9900', '(71) 97999-8877', 'tatiane.ribeiro@yahoo.com'),
  ('Eduardo Campos Freitas', '(61) 8899-0011', '(61) 97888-7766', 'eduardo.freitas@gmail.com'),
  ('Larissa Gonçalves Pires', '(81) 9900-1122', '(81) 97777-6655', 'larissa.pires@outlook.com'),
  ('Marcelo Oliveira Teixeira', '(85) 1111-2233', '(85) 97666-5544', 'marcelo.teixeira@gmail.com'),
  ('Bruna Souza Carvalho', '(19) 2222-3344', '(19) 97555-4433', 'bruna.carvalho@yahoo.com');

INSERT INTO AluguelJogo_Aula22 (id_cliente, id_jogo, data_devolucao_real, devolvido) VALUES
  (1,  5, '2009-03-14', 1),
  (2,  1, '2009-04-08', 1),
  (3,  7, '2009-05-12', 1),
  (4, 10, '2009-06-06', 1),
  (5,  3, '2009-07-10', 1),
  (6,  8, NULL, 0),
  (7, 12, '2009-09-05', 1),
  (8, 14, '2009-09-25', 1),
  (9,  9, NULL, 0),
  (10, 6, '2009-10-25', 1),
  (11, 11, '2009-11-12', 1),
  (12,  2, NULL, 0),
  (13, 15, '2010-01-10', 1),
  (14, 16, NULL, 0),
  (15, 18, '2010-03-20', 1),
  (16, 20, NULL, 0),
  (17,  4, '2010-05-09', 1),
  (18, 13, '2010-06-12', 1),
  (19, 17, NULL, 0),
  (20, 19, NULL, 0);

INSERT INTO AluguelConsole_Aula22 (id_cliente, id_console, data_devolucao_real, devolvido)
VALUES
(1,  1, '2009-02-12', 1),
(2,  2, '2009-03-07', 1),
(3,  3, '2009-04-16', 1),
(4,  4, '2009-05-04', 1),
(5,  5, NULL, 0),
(6,  6, '2009-07-11', 1),
(7,  7, '2009-08-05', 1),
(8,  8, NULL, 0),
(9,  9, '2009-09-16', 1),
(10, 10, '2009-10-03', 1),
(11, 11, NULL, 0),
(12, 12, '2009-11-07', 1),
(13, 13, '2010-01-17', 1),
(14, 14, '2010-02-06', 1),
(15, 15, NULL, 0),
(16, 16, '2010-04-12', 1),
(17, 17, '2010-05-10', 1),
(18, 18, '2010-06-05', 1),
(19, 19, NULL, 0),
(20, 20, NULL, 0);

SELECT aj.id, c.nome, c.tel_residencial, c.email,
    j.titulo, aj.data_locacao, aj.data_devolucao_est, aj.data_devolucao_real,
    j.preco_locacao AS valor_aluguel,
    (preco_locacao*DATEDIFF(day, aj.data_locacao, aj.data_devolucao_est)) AS total_em_dias,
    GREATEST((preco_locacao*DATEDIFF(day, aj.data_devolucao_est, aj.data_devolucao_real)*1.1), 0) AS multa,
    ((preco_locacao*DATEDIFF(day, aj.data_locacao, aj.data_devolucao_est))+GREATEST((preco_locacao*DATEDIFF(day, aj.data_devolucao_est, aj.data_devolucao_real)*1.1), 0)) AS total_a_pagar
FROM AluguelJogo_Aula22 aj
    INNER JOIN Cliente_Aula22 c ON aj.id_cliente = c.id
    INNER JOIN Jogos_Aula22 j ON aj.id_jogo = j.id
WHERE aj.devolvido = 1;

SELECT aj.id, c.nome, c.tel_residencial, c.email,
    j.titulo, aj.data_locacao, aj.data_devolucao_est, aj.data_devolucao_real,
    j.preco_locacao AS valor_aluguel,
    (preco_locacao*DATEDIFF(day, aj.data_locacao, aj.data_devolucao_est)) AS total_em_dias,
    (preco_locacao*DATEDIFF(day, aj.data_devolucao_est, CURRENT_TIMESTAMP)*1.1) AS multa
FROM AluguelJogo_Aula22 aj
    INNER JOIN Cliente_Aula22 c ON aj.id_cliente = c.id
    INNER JOIN Jogos_Aula22 j ON aj.id_jogo = j.id
WHERE aj.devolvido = 0;

SELECT aj.id, c.nome, c.tel_residencial, c.email,
    j.titulo, aj.data_locacao, aj.data_devolucao_est, aj.data_devolucao_real,
    j.preco_locacao AS valor_aluguel,
    CASE
        WHEN (aj.devolvido = 0) THEN 'SIM'
        WHEN (DATEDIFF(day, aj.data_locacao, aj.data_devolucao_real) <= 3) THEN 'NÃO'
        ELSE 'SIM'
    END AS atrasado
FROM AluguelJogo_Aula22 aj
    INNER JOIN Cliente_Aula22 c ON aj.id_cliente = c.id
    INNER JOIN Jogos_Aula22 j ON aj.id_jogo = j.id;

-----------------------------------------------------------------

-- EXERCÍCIO PRÁTICO
USE FAT_QualificaSP;

CREATE TABLE Computador_Aula22_Lanhouse (
  id INT PRIMARY KEY IDENTITY,
  identificacao VARCHAR(5),
  valor DECIMAL(5, 2) DEFAULT 2.50
);

CREATE TABLE Cliente_Aula22_Lanhouse (
  id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  telefone VARCHAR(20)
);

CREATE TABLE Sessao_Aula22_Lanhouse (
  id INT PRIMARY KEY IDENTITY,
  id_cliente INT NOT NULL,
  CONSTRAINT FK_Cliente_Sessão FOREIGN KEY (id_cliente) REFERENCES Cliente_Aula22_Lanhouse(id),
  id_computador INT NOT NULL,
  CONSTRAINT FK_Computador_Sessão FOREIGN KEY (id_computador) REFERENCES Computador_Aula22_Lanhouse(id),
  data_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
  data_fim DATETIME
);

INSERT INTO Computador_Aula22_Lanhouse (identificacao)
VALUES
  ('PC01'),
  ('PC02'),
  ('PC03'),
  ('PC04'),
  ('PC05'),
  ('PC06'),
  ('PC07'),
  ('PC08'),
  ('PC09'),
  ('PC10');

INSERT INTO Cliente_Aula22_Lanhouse (nome, email, telefone)
VALUES
  ('Ana Beatriz Silva', 'ana.silva@example.com', '(11) 91234-5678'),
  ('Carlos Mendes', 'carlos.mendes@example.com', '(21) 98876-4321'),
  ('Fernanda Oliveira', 'fernanda.oli@example.com', '(31) 98765-4321'),
  ('Rafael Costa', 'rafael.costa@example.com', '(19) 99543-2109'),
  ('Juliana Santos', 'juliana.santos@example.com', '(41) 98432-1098'),
  ('Lucas Almeida', 'lucas.almeida@example.com', '(61) 99654-3210'),
  ('Patrícia Gomes', 'patricia.gomes@example.com', '(85) 99123-4567'),
  ('Bruno Rocha', 'bruno.rocha@example.com', '(71) 98234-5678'),
  ('Mariana Pires', 'mariana.pires@example.com', '(51) 99988-7766'),
  ('Tiago Fernandes', 'tiago.fernandes@example.com', '(27) 98855-4433');

INSERT INTO Sessao_Aula22_Lanhouse (id_cliente, id_computador, data_inicio, data_fim)
VALUES
  (1, 1, '20251027 09:15', '20251027 11:45'),
  (1, 2, '20251029 15:10', NULL), -- sessão em andamento
  (2, 3, '20251027 13:00', '20251027 14:20'),
  (2, 3, '20251031 10:30', '20251031 13:10'),
  (3, 4, '20251028 08:55', '20251028 12:40'),
  (4, 5, '20251029 17:05', NULL), -- sessão em andamento
  (5, 6, '20251030 09:40', '20251030 11:00'),
  (6, 7, '20251027 14:10', '20251027 16:00'),
  (7, 8, '20251028 16:20', '20251028 19:10'),
  (8, 9, '20251029 10:15', '20251029 13:55'),
  (8, 10, '20251030 11:25', '20251030 13:00'),
  (9, 1, '20251030 15:30', NULL), -- sessão em andamento
  (9, 2, '20251031 08:00', '20251031 11:45'),
  (10, 4, '20251027 18:10', '20251027 20:00'),
  (10, 6, '20251101 09:00', '20251101 12:35'); 

-- SELECT PARA TESTE DOS INSERTS, ignorar
SELECT 
  c.nome AS Cliente,
  comp.identificacao AS Computador,
  s.data_inicio, s.data_fim
FROM Sessao_Aula22_Lanhouse s
JOIN Cliente_Aula22_Lanhouse c ON s.id_cliente = c.id
JOIN Computador_Aula22_Lanhouse comp ON s.id_computador = comp.id
ORDER BY s.data_inicio;


-- ATIVIDADE 1: LISTAR TODAS AS SESSÕES AINDA NÃO FINALIZADAS
-- id da sessão, nome e email do usuário e identificador do computador
SELECT
  sal.id ID,
  cal.nome Nome,
  cal.email Email,
  comp.identificacao Computador
FROM Sessao_Aula22_Lanhouse as sal
JOIN Cliente_Aula22_Lanhouse as cal 
  ON sal.id_cliente = cal.id
JOIN Computador_Aula22_Lanhouse as comp
  ON sal.id_computador = comp.id
WHERE sal.data_fim IS NULL;

-- BÔNUS: SOMENTE SESSÕES FINALIZADAS:
SELECT
  sal.id ID,
  cal.nome Nome,
  cal.email Email,
  comp.identificacao Computador
FROM Sessao_Aula22_Lanhouse as sal
JOIN Cliente_Aula22_Lanhouse as cal 
  ON sal.id_cliente = cal.id
JOIN Computador_Aula22_Lanhouse as comp
  ON sal.id_computador = comp.id
WHERE sal.data_fim IS NOT NULL;

-- ATIVIDADE 2: LISTAR TODAS AS SESSÕES FINALIZADAS E QUANTAS HORAS CADA SESSÃO DUROU
-- id da sessão, nome e email do usuário, identificador do computador e horas usadas
SELECT
  sal.id ID,
  cal.nome Nome,
  cal.email Email,
  comp.identificacao Computador,
  DATEDIFF(hour, sal.data_inicio, sal.data_fim) AS "Horas em uso"
FROM Sessao_Aula22_Lanhouse as sal
JOIN Cliente_Aula22_Lanhouse as cal
  ON sal.id_cliente = cal.id
JOIN Computador_Aula22_Lanhouse as comp
  ON sal.id_computador = comp.id
WHERE sal.data_fim IS NOT NULL;

-- ATIVIDADE 3: LISTAR TODAS AS SESSÕES NÃO FINALIZADAS E O VALOR DEVIDO PELA SESSÃO
-- id da sessão, nome e email do usuário, identificador do computador e valor total

-- Estou assumindo que, aqui, o Uriel quis dizer que são as sessões "FINALIZADAS".
-- Ou era para adicionar o CURRENT_TIMESTAMP e refazer?
SELECT
  sal.id ID,
  cal.nome Nome,
  cal.email Email,
  comp.identificacao Computador,
  FORMAT((DATEDIFF(hour, sal.data_inicio, sal.data_fim) * comp.valor), 'C', 'pt-BR') AS "Valor devido"
FROM Sessao_Aula22_Lanhouse as sal
JOIN Cliente_Aula22_Lanhouse as cal
  ON sal.id_cliente = cal.id
JOIN Computador_Aula22_Lanhouse as comp
  ON sal.id_computador = comp.id
WHERE sal.data_fim IS NOT NULL;

-- BÔNUS: VIEW COM TODAS AS INFORMAÇÕES:
CREATE VIEW [Lanhouse] AS
SELECT
  sal.id ID,
  cal.nome Nome,
  cal.email Email,
  comp.identificacao Computador,
  DATEDIFF(hour, sal.data_inicio, sal.data_fim) AS "Horas em uso",
  FORMAT((DATEDIFF(hour, sal.data_inicio, sal.data_fim) * comp.valor), 'C', 'pt-BR') AS "Valor devido"
FROM Sessao_Aula22_Lanhouse as sal
JOIN Cliente_Aula22_Lanhouse as cal
  ON sal.id_cliente = cal.id
JOIN Computador_Aula22_Lanhouse as comp
  ON sal.id_computador = comp.id;

SELECT * FROM [Lanhouse];