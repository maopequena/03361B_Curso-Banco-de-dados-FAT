-- New script in localhost.
-- Date: Oct 29, 2025
-- Time: 2:44:59 AM
-- Aula 20

USE FAT_QualificaSP;

-- Atividade da aula:
-- Criar 4 tabelas: curso, aluno, disciplina, professor

CREATE TABLE Curso_Aula20 (
  id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(100) UNIQUE NOT NULL,
  total_creditos INT NOT NULL,
  carga_horaria INT NOT NULL
);

CREATE TABLE Aluno_Aula20 (
  matricula INT PRIMARY KEY IDENTITY,
  id_curso INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  CONSTRAINT FK_Aluno_Curso FOREIGN KEY (id_curso) REFERENCES Curso_Aula20(id)
);

CREATE TABLE Professor_Aula20 (
  matricula INT PRIMARY KEY IDENTITY(1,1),
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Disciplina_Aula20 (
  id INT PRIMARY KEY IDENTITY,
  id_professor INT NOT NULL,
  id_curso INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  carga_horaria INT NOT NULL,
  creditos INT NOT NULL,
  CONSTRAINT FK_Disciplina_Professor FOREIGN KEY (id_professor) REFERENCES Professor_Aula20(matricula),
  CONSTRAINT FK_Disciplina_Curso FOREIGN KEY (id_curso) REFERENCES Curso_Aula20(id),
  CONSTRAINT UQ_Disciplina_Curso UNIQUE (nome, id_curso) -- Constraint para garantir que o nome da disciplina seja único dentro de um curso
);

CREATE TABLE Aluno_Disciplina_Aula20 (
  matricula_aluno INT NOT NULL,
  id_disciplina INT NOT NULL,
  CONSTRAINT FK_AD_Aluno FOREIGN KEY (matricula_aluno) REFERENCES Aluno_Aula20(matricula),        
  CONSTRAINT FK_AD_Disciplina FOREIGN KEY (id_disciplina) REFERENCES Disciplina_Aula20(id),        
  PRIMARY KEY (matricula_aluno, id_disciplina) -- Definindo chave primária composta
);

INSERT INTO Professor_Aula20 (nome, sobrenome, email) VALUES
  ('Maria', 'Silva', 'maria.silva@escola.com'),
  ('Carlos', 'Souza', 'carlos.souza@escola.com'),
  ('Ana', 'Oliveira', 'ana.oliveira@escola.com'),
  ('Pedro', 'Santos', 'pedro.santos@escola.com'),
  ('Juliana', 'Costa', 'juliana.costa@escola.com');

INSERT INTO Curso_Aula20 (nome, total_creditos, carga_horaria) VALUES
  ('Computação', 240, 3600), 
  ('Administração', 200, 3000),
  ('Engenharia Civil', 300, 4500),
  ('Arquitetura', 220, 3300),
  ('Direito', 260, 3900);

INSERT INTO Disciplina_Aula20 (id_professor, id_curso, nome, carga_horaria, creditos) VALUES
(1, 1, 'Aplicação de Banco de Dados', 60, 4),
(2, 1, 'Análise de Dados', 60, 4),
(3, 1, 'Programação Web', 80, 5),
(4, 2, 'Contabilidade', 40, 3),
(
    (SELECT matricula FROM Professor_Aula20 WHERE nome = 'Juliana'), -- Exemplo de como a Jane fez 
    (SELECT id FROM Curso_Aula20 WHERE nome = 'Engenharia Civil'), 
    'Cálculo I', 80, 5
);

INSERT INTO Aluno_Aula20 (id_curso, nome, sobrenome, email) VALUES
(1, 'João', 'Pereira', 'joao.pereira@aluno.com'),
(1, 'Mariana', 'Alves', 'mariana.alves@aluno.com'),
(2, 'Rafaela', 'Gomes', 'rafaela.gomes@aluno.com'),
(5, 'Felipe', 'Lima', 'felipe.lima@aluno.com'),
(
    (SELECT id FROM Curso_Aula20 WHERE nome = 'Arquitetura'), -- Exemplo de como a Jane fez 
    'Gabriela', 'Nunes', 'gabriela.nunes@aluno.com'
);

INSERT INTO Aluno_Disciplina_Aula20 (matricula_aluno, id_disciplina) VALUES
(
    (SELECT matricula FROM Aluno_Aula20 WHERE nome = 'João' AND sobrenome = 'Pereira'), 
    (SELECT id FROM Disciplina_Aula20 WHERE nome = 'Aplicação de Banco de Dados')
), -- João matriculado em Aplicação de Banco de Dados
(
    (SELECT matricula FROM Aluno_Aula20 WHERE nome = 'João' AND sobrenome = 'Pereira'), 
    (SELECT id FROM Disciplina_Aula20 WHERE nome = 'Análise de Dados')
), -- João matriculado em Análise de Dados
(
    (SELECT matricula FROM Aluno_Aula20 WHERE nome = 'João' AND sobrenome = 'Pereira'), 
    (SELECT id FROM Disciplina_Aula20 WHERE nome = 'Programação Web')
), -- João matriculado em Programação Web (extra)
(
    (SELECT matricula FROM Aluno_Aula20 WHERE nome = 'Mariana' AND sobrenome = 'Alves'), 
    (SELECT id FROM Disciplina_Aula20 WHERE nome = 'Aplicação de Banco de Dados')
), -- Mariana matriculada em Aplicação de Banco de Dados
(
    (SELECT matricula FROM Aluno_Aula20 WHERE nome = 'Mariana' AND sobrenome = 'Alves'), 
    (SELECT id FROM Disciplina_Aula20 WHERE nome = 'Programação Web')
); -- Mariana matriculada em Programação Web

-- Queries da atividade:

-- 1. Uma query básica para cada tabela, mostrando todas as colunas.
SELECT * FROM Curso_Aula20;
SELECT * FROM Aluno_Aula20;
SELECT * FROM Professor_Aula20;
SELECT * FROM Disciplina_Aula20;

-- 2. Liste todas as disciplinas de "Computação" usando apenas o id do curso (sem join).
SELECT
  d.id_curso "ID Curso",
  d.id "ID Disc",
  d.nome "Nome da disciplina",
  d.carga_horaria "Carga horária",
  d.creditos "Créditos"
FROM
  Disciplina_Aula20 as d
WHERE d.id_curso = (SELECT id FROM Curso_Aula20 WHERE nome = 'Computação');

-- 3. Liste as disciplinas em que cada aluno está matriculado, com matrícula e nome do aluno, nome do curso, e nome, créditos e carga horária
-- da disciplina.
SELECT
  a.matricula "Mat. do aluno",
  CONCAT(a.nome, ' ', a.sobrenome) "Nome do aluno",
  c.nome "Curso",
  d.nome "Disciplina",
  d.creditos "Créditos",
  d.carga_horaria "Carga horária"
FROM Aluno_Aula20 as a
JOIN Aluno_Disciplina_Aula20 as ad
  ON a.matricula = ad.matricula_aluno
JOIN Disciplina_Aula20 as d
  ON ad.id_disciplina = d.id 
JOIN Curso_Aula20 as c
  ON a.id_curso = c.id;

-- No final, a Jane colocou o seguinte, que não está no exercício:
-- Listar tabelas
SELECT
    name AS NomeDaTabela
FROM
    sys.tables
WHERE
    type = 'U'
ORDER BY
    name;