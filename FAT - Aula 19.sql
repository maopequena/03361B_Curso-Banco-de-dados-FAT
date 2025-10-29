-- New script in localhost.
-- Date: Oct 29, 2025
-- Time: 1:42:47 AM
-- Aula 19 - SELECT no SQL Server

USE FAT_QualificaSP;

CREATE TABLE aluno_Aula19 (
  id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);

INSERT INTO aluno_Aula19 (nome, email) VALUES
  ('João Fernando', 'joao@gmail.com'),
  ('Maria Carvalho', 'maria@gmail.com'),
  ('Bruna dos Santos', 'bruna@gmail.com'),
  ('Pedro da Silva', 'pedro@gmail.com'),
  ('Tiago Pereira', 'tiago@gmail.com');

SELECT * FROM aluno_Aula19;

SELECT nome, email FROM aluno_Aula19;

CREATE TABLE professor_Aula19 (
  id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(100) NOT NULL,
  dtcad DATE NOT NULL,
  id_turma INT
);

INSERT INTO professor_Aula19 (nome, dtcad, id_turma) VALUES
  ('Elson Marques', '2018-03-01', 1),
  ('Pedro Botelho', '2018-03-01', 2),
  ('Janaína Braga', '2016-06-04', 2),
  ('Lucas Gonçalves', '2017-02-01', 2),
  ('Gilmar Mendes', '2017-02-01', 1);

SELECT
  p.nome Nome,
  p.dtcad AS "Data de admissão",
  id_turma AS Turma
FROM professor_Aula19 AS p;

CREATE TABLE turma_Aula19 (
  id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(100) NOT NULL
);

INSERT INTO turma_Aula19 (nome) VALUES
  ('Turma A'),
  ('Turma B');

SELECT
  p.nome as Professor,
  t.nome as Turma
FROM
  professor_Aula19 p,
  turma_Aula19 t
WHERE p.id_turma = t.id;