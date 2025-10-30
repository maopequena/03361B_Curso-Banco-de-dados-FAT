-- New script in localhost.
-- Date: Oct 26, 2025
-- Time: 10:33:04 PM
-- Desafio Aula 17

/* Você é o analista de dados do departamento de RH e precisa criar dois relatórios complexos.
Para isso, você tem acesso a três tabelas: Funcionarios, Niveis_Salariais e Departamentos. */

USE FAT_QualificaSP;

CREATE TABLE Desafio_Aula17_Funcionarios (
  id_func INT IDENTITY(1, 1) NOT NULL,
  nome NVARCHAR(20) NOT NULL,
  salario MONEY NOT NULL,
  id_depto INT
);

INSERT INTO Desafio_Aula17_Funcionarios (nome, salario, id_depto) VALUES
  ('Ana', 4500.00, 1),
  ('Beto', 8200.00, 1),
  ('Clara', 12500.00, 2);

CREATE TABLE Desafio_Aula17_Niveis_Salariais (
  nivel NVARCHAR(20) NOT NULL,
  salario_min MONEY NOT NULL,
  salario_max MONEY NOT NULL
);

INSERT INTO Desafio_Aula17_Niveis_Salariais (nivel, salario_min, salario_max) VALUES
  ('Junior', 3000.00, 5000.00),
  ('Pleno', 5001.00, 9000.00),
  ('Senior', 9001.00, 15000.00);

CREATE TABLE Desafio_Aula17_Departamentos (
  id_depto INT IDENTITY(1, 1) NOT NULL,
  nome_depto NVARCHAR(20) NOT NULL
);

INSERT INTO Desafio_Aula17_Departamentos (nome_depto) VALUES
  ('Vendas'),
  ('TI'),
  ('Inovação');

/* Observação: note que o departamento "Inovação" foi criado recentemente
e ainda não possui funcionários alocados.
Relatório 1 (Classificação salarial - Join não-idêntica):
  crie uma consulta que mostre o nome de cada funcionário e o seu nível
  salarial (Junior, Pleno ou Senior), com base na faixa de salário
  em que ele se encontra.
  Dica: a condição do JOIN usará BETWEEN. */
SELECT
  f.nome Nome,
  ns.nivel "Nível salarial"
FROM Desafio_Aula17_Funcionarios as f
INNER JOIN Desafio_Aula17_Niveis_Salariais as ns
  ON f.salario
  BETWEEN ns.salario_min AND ns.salario_max;

/* Relatório 2 (Mapeamento de departamentos - Join externa):
  crie uma consulta que liste TODOS os departamentos da empresa e,
  ao lado, o nome dos funcionários que pertencem a cada um.
  Se um departamento não tiver funcionários, o nome do funcionário
  deve aparecer como NULL. Dica: você precisará de um OUTER JOIN. */

SELECT
  d.nome_depto Departamento,
  f.nome "Funcionário"
FROM Desafio_Aula17_Departamentos as d
LEFT JOIN Desafio_Aula17_Funcionarios as f
  ON d.id_depto = f.id_depto;