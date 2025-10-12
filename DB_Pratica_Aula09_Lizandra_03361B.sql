CREATE DATABASE DB_Pratica_Aula09_Lizandra_03361B;
USE DB_Pratica_Aula09_Lizandra_03361B;

SHOW TABLES;

-- AGENDA DE CONTATOS:
-- 1. Criar as tabelas Contatos (nome, telefone, email, etc.),
-- Grupos de contatos (Família, Trabalho, Amigos, etc.) e Telefones (pode haver mais um número por contato).
CREATE TABLE Contatos (
	id_contato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50),
    email VARCHAR(100),
    conjuge VARCHAR(100),
    endereco TEXT,
    data_nascimento DATE
);

CREATE TABLE Grupos_contatos (
	id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    grupo VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE Telefones (
	id_telefones INT PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(20) NOT NULL,
    id_contato INT,
    CONSTRAINT fk_id_telefone_contato FOREIGN KEY (id_contato) REFERENCES Contatos(id_contato)
);

-- Isso não foi solicitado, mas é necessário: criar uma nova tabela para relacionar as anteriores
CREATE TABLE Relacao_Telefones_Grupos (
	id_telefones INT NOT NULL,
    id_grupos INT NOT NULL,
    CONSTRAINT fk_relacao_telefones FOREIGN KEY (id_telefones) REFERENCES Telefones(id_telefones),
    CONSTRAINT fk_relacao_grupos FOREIGN KEY (id_grupos) REFERENCES Grupos_contatos(id_grupo)
);

-- 2. Inserir ao menos 2 registros por tabela.
INSERT INTO Contatos (nome, sobrenome, email, conjuge, endereco, data_nascimento) VALUES
	('Pedro', 'Gonçalves', 'pgoncalves@email.com', 'Brenda Fernandes Gonçalves',
		'Quadra QE 11 Área Especial C, 123, Guará I, Brasília, DF, 71020-631', '1981-07-26'),
    ('Vinícius', 'Monte', 'vmonte@email.com', 'Clara Barbosa Monte',
		'Rua Domingos Olímpio, 234 - Ap. B, Centro, Sobral, CE, 62011-140', '1988-08-26'),
    ('Lara', 'Cardoso Araújo', 'lcardoso@email.com', 'Paulo Araújo',
		'Rua Tenente-Coronel Cardoso, 345 - Casa 3, Centro, Campos dos Goytacazes, RJ, 28035-042', '1989-02-19'),
    ('Maria Eduarda', 'Schmidt', 'meschmidt@email.com', '',
		'Rua das Fiandeiras, 61 - Ap. 83, Vila Olímpia, São Paulo, SP, 04545-005', '1999-02-07'),
    ('Davi', 'Barros', 'dbarros@email.com', 'Marina Barros',
		'Rua Arlindo Nogueira, 456, Centro, Teresina, PI, 28035-042', '2000-10-10');

INSERT INTO Grupos_contatos (grupo, descricao) VALUES
	('Família', 'Pessoas relacionadas a mim'),
    ('Trabalho', 'Pessoas com quem trabalhei ou trabalho'),
    ('Amigos ou conhecidos', 'Outras pessoas próximas'),
    ('Saúde', 'Médicos e outros profissionais ou locais relacionados à saúde'),
    ('Saúde animal', 'Veterinários e outros profissionais ou locais relacionados
		à saúde dos meus animais');
    
INSERT INTO Telefones (telefone, id_contato) VALUES
	('(61) 2294-3304', 1),
    ('(61) 92714-3603', 1),
    ('(61) 2294-3304', 1),
    ('(61) 92714-3603', 1),
    ('(88) 3193-8182', 2),
    ('(88) 93833-2530', 2),
    ('(88) 3803-8328', 2),
    ('(88) 93833-2530', 2),
    ('(22) 3161-7446', 3),
    ('(22) 93380-3353', 3),
    ('(22) 3815-5744', 3),
    ('(22) 93380-3353', 3),
    ('(11) 3256-5377', 4),
    ('(11) 92475-3112', 4),
    ('(11) 3888-7122', 4),
    ('(11) 3844-6653', 4),
    ('(11) 92475-3112', 4),
    ('(86) 2359-3408', 5),
    ('(89) 92373-4330', 5),
    ('(89) 3487-1927', 5),
    ('(89) 92373-4330', 5);
    
INSERT INTO Relacao_Telefones_Grupos (id_telefones, id_grupos) VALUES
	(1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 1),
    (13, 1),
    (14, 1),
    (15, 1),
    (16, 1),
    (17, 1),
    (18, 4),
    (19, 4);

-- 3. Consultar os dados usando SELECT.
SELECT * FROM Contatos;
SELECT * FROM Grupos_contatos;
SELECT * FROM Telefones;
SELECT nome FROM Contatos;
SELECT * FROM Contatos WHERE nome = 'Pedro';