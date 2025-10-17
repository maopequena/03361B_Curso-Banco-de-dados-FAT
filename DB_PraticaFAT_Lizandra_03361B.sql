CREATE DATABASE DB_PraticaFAT_Lizandra_03361B;

USE DB_PraticaFAT_Lizandra_03361B;

CREATE TABLE Alunos (
	matricula_aluno INT(6) ZEROFILL PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 100000;

CREATE TABLE Professores (
	matricula_prof INT(6) ZEROFILL PRIMARY KEY AUTO_INCREMENT,
    nome_prof VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    titulacao VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 200000;

CREATE TABLE Disciplina (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_prof INT(6) ZEROFILL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    carga_horaria INT NOT NULL,
    CONSTRAINT FK_id_prof FOREIGN KEY (id_prof) REFERENCES Professores(matricula_prof)
);

CREATE TABLE Aluno_Disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_aluno INT(6) ZEROFILL NOT NULL,
    id_disciplina INT NOT NULL,
    data_matricula DATE,
    nota DECIMAL(4,2),
    CONSTRAINT FK_matricula_aluno FOREIGN KEY (matricula_aluno) REFERENCES Alunos(matricula_aluno),
    CONSTRAINT FK_id_disciplina FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id)
);

INSERT INTO Alunos (nome_aluno, email, telefone) VALUES
('Kara Danvers', 'kara.danvers@email.com.br', '(11) 98765-4321'),
('Iris West', 'iris.west@email.com.br', '(11) 97654-3210'),
('Thea Queen', 'thea.queen@email.com.br', '(11) 96543-2109'),
('Cisco Ramon', 'cisco.ramon@email.com.br', '(11) 95432-1098'),
('Caitlin Snow', 'caitlin.snow@email.com.br', '(11) 94321-0987'),
('John Diggle', 'john.diggle@email.com.br', '(11) 93210-9876'),
('Jordan Kent', 'jordan.kent@email.com.br', '(11) 92109-8765'),
('Jonathan Kent', 'jonathan.kent@email.com.br', '(11) 91098-7654'),
('Laurel Lance', 'laurel.lance@email.com.br', '(11) 90987-6543'),
('Roy Harper', 'roy.harper@email.com.br', '(11) 99876-5432');

INSERT INTO Professores (nome_prof, email, titulacao) VALUES
('Oliver Queen', 'oliver.queen@email.com.br', 'Doutorado'),
('Barry Allen', 'barry.allen@email.com.br', 'Mestrado'),
('Clark Kent', 'clark.kent@email.com.br', 'Doutorado'),
('Lois Lane', 'lois.lane@email.com.br', 'Mestrado'),
('Felicity Smoak', 'felicity.smoak@email.com.br', 'Doutorado');

INSERT INTO Disciplina (id_prof, nome, carga_horaria) VALUES
(200000, 'Programação I', 80),
(200001, 'Algoritmos Avançados', 60),
(200002, 'Banco de Dados', 80),
(200003, 'Jornalismo Digital', 60),
(200004, 'Segurança da Informação', 80),
(200000, 'Estrutura de Dados', 80),
(200001, 'Computação', 60),
(200002, 'Sistemas Distribuídos', 80);

-- Inserindo matrículas dos alunos nas disciplinas
INSERT INTO Aluno_Disciplina (matricula_aluno, id_disciplina, data_matricula, nota) VALUES
(100000, 1, '2025-02-01', 8.5),
(100001, 1, '2025-02-01', 7.8),
(100003, 1, '2025-02-02', 9.5),
(100005, 1, '2025-02-03', 7.9),
(100007, 1, '2025-02-04', 8.1),
(100002, 2, '2025-02-02', 7.5),
(100003, 2, '2025-02-02', 9.8),
(100007, 2, '2025-02-04', 7.7),
(100000, 3, '2025-02-01', 9.0),
(100004, 3, '2025-02-03', 9.7),
(100006, 3, '2025-02-04', 8.6),
(100001, 4, '2025-02-01', 9.2),
(100007, 4, '2025-02-04', 8.5),
(100008, 4, '2025-02-05', 9.6),
(100000, 5, '2025-02-01', 8.7),
(100002, 5, '2025-02-02', 8.9),
(100004, 5, '2025-02-03', 9.1),
(100005, 5, '2025-02-03', 8.0),
(100008, 5, '2025-02-05', 8.2),
(100002, 6, '2025-02-02', 7.2),
(100005, 6, '2025-02-03', 8.4),
(100008, 6, '2025-02-05', 7.8),
(100003, 7, '2025-02-02', 9.3),
(100006, 7, '2025-02-04', 9.4),
(100001, 8, '2025-02-01', 8.3),
(100004, 8, '2025-02-03', 8.8),
(100006, 8, '2025-02-04', 8.9);

SELECT * FROM Alunos;
SELECT * FROM Professores;
SELECT * FROM Disciplina;
SELECT * FROM Aluno_Disciplina;

-- Mostrar o professor de cada disciplina
SELECT p.nome_prof, d.nome
FROM Professores AS p
INNER JOIN Disciplina AS d
ON p.matricula_prof = d.id_prof;

-- Mostrar todos os alunos matriculados na disciplina "Computação"
SELECT a.nome_aluno, d.nome FROM Alunos AS a 
INNER JOIN Aluno_Disciplina AS ad ON a.matricula_aluno = ad.matricula_aluno
INNER JOIN Disciplina AS d ON ad.id_disciplina = d.id
WHERE d.nome = 'Computação';

-- Mostrar todos os alunos não matriculados em uma disciplina
SELECT a.nome_aluno FROM Alunos AS a
LEFT JOIN Aluno_Disciplina AS ad
ON a.matricula_aluno = ad.matricula_aluno
WHERE ad.matricula_aluno IS NULL;

-- (Desafio) Mostrar a contagem de alunos por disciplina e o nome do docente desta
-- Usar COUNT()? GROUP BY?
-- Confesso que, para esse desafio, fui no Claude... Todos os outros foram na tentativa e erro...
SELECT d.nome, p.nome_prof, COUNT(ad.matricula_aluno) AS total_alunos
FROM Disciplina AS d
INNER JOIN Professores AS p ON d.id_prof = p.matricula_prof
LEFT JOIN Aluno_Disciplina AS ad ON d.id = ad.id_disciplina
GROUP BY d.id, d.nome, p.nome_prof;