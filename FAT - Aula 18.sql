-- New script in localhost.
-- Date: Oct 28, 2025
-- Time: 11:26:17 PM
-- Aula 18 - Join não idênticas e joins externas

-- Prática 9:
-- Primeira atividade

CREATE TABLE Clientes_Aula18 (
  cliente_id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(20) NOT NULL,
  score_credito INT NOT NULL
);

INSERT INTO Clientes_Aula18 (nome, score_credito) VALUES
  ('Alice', 480),
  ('Bruno', 730),
  ('Carla', 615);

CREATE TABLE Faixas_Credito_Aula18 (
  faixa_id INT PRIMARY KEY IDENTITY,
  score_min INT,
  score_max INT,
  risco VARCHAR(20)
);

INSERT INTO Faixas_Credito_Aula18 (score_min, score_max, risco) VALUES
  (0, 499, 'Alto'),
  (500, 699, 'Moderado'),
  (700, 850, 'Baixo');

-- Classifique cada cliente de acordo com o risco, com base no score de crédito.

SELECT
  c.nome Nome,
  c.score_credito Score,
  f.risco Risco
FROM Clientes_Aula18 c
JOIN Faixas_Credito_Aula18 f
  ON c.score_credito
  BETWEEN f.score_min AND f.score_max;

-- Segunda atividade:

CREATE TABLE Alunos_Aula18 (
  aluno_id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(20)
);

INSERT INTO Alunos_Aula18 (nome) VALUES
  ('Ana'),
  ('Bruno'),
  ('Carla');

CREATE TABLE Matriculas_Aula18 (
  matricula_id INT PRIMARY KEY IDENTITY,
  aluno_id INT,
  curso VARCHAR(50)
);

INSERT INTO Matriculas_Aula18 (aluno_id, curso) VALUES
  (1, 'Inglês'),
  (2, 'Espanhol');

-- Queremos listar todos os alunos, com os cursos (se houver) — ou NULL se ainda não tiverem matrícula.

SELECT
  a.nome Aluno,
  m.curso Curso
FROM Alunos_Aula18 a
LEFT JOIN Matriculas_Aula18 m
  ON a.aluno_id = m.aluno_id;

-- Terceira atividade:

CREATE TABLE Contatos_Aula18 (
  contato_id INT PRIMARY KEY IDENTITY,
  nome VARCHAR(50),
  telefone VARCHAR(20)
);

INSERT INTO Contatos_Aula18 (nome, telefone) VALUES
  ('Ana', '11999998888'),
  ('Bruno', '21988887777'),
  ('Carla', '31977776666');

CREATE TABLE Chamadas_Aula18 (
  chamada_id INT PRIMARY KEY IDENTITY,
  contato_id INT,
  duracao_seg INT
);

INSERT INTO Chamadas_Aula18 (contato_id, duracao_seg) VALUES
  (1, 200),
  (2, 180);

-- Queremos listar todos os contatos, com a duração da chamada — se tiver.

SELECT
  c.nome Nome,
  ch.duracao_seg "Duração da chamada"
FROM Contatos_Aula18 c
LEFT JOIN Chamadas_Aula18 ch
  ON c.contato_id = ch.contato_id;

-- AMBIENTAÇÃO AULA 18 PARA ATIVIDADES:

CREATE TABLE Departamento_Aula18 (
  id INT PRIMARY KEY IDENTITY,
  nome_departamento VARCHAR(100)
);

CREATE TABLE Cargo_Aula18 (
  id INT PRIMARY KEY IDENTITY,
  nome_cargo VARCHAR(100),
  salario DECIMAL(10, 2)
);

CREATE TABLE Funcionario_Aula18 (
  matricula INT PRIMARY KEY IDENTITY(100000, 1),
  id_cargo INT NOT NULL,
  id_departamento INT NOT NULL,
  nome VARCHAR(100),
  sobrenome VARCHAR(100),
  CONSTRAINT fk_a18_funcionario_cargo
    FOREIGN KEY (id_cargo) REFERENCES Cargo_Aula18(id),
  CONSTRAINT fk_a18_funcionario_departamento
    FOREIGN KEY (id_departamento) REFERENCES Departamento_Aula18(id)
);

CREATE TABLE Nivel_Cargo_Aula18 (
  id INT PRIMARY KEY IDENTITY,
  nivel VARCHAR(100),
  sal_min DECIMAL(10, 2),
  sal_max DECIMAL(10, 2)
);

INSERT INTO Nivel_Cargo_Aula18 (nivel, sal_min, sal_max) VALUES
  ('Junior', 3500.00, 5000.00),
  ('Pleno', 5500.00, 7000.00),
  ('Senior', 7500.00, 15000.00);

INSERT INTO Departamento_Aula18 (nome_departamento) VALUES
  ('Inovação'),
  ('Recursos Humanos'),
  ('Financeiro'),
  ('Marketing'),
  ('Tecnologia da Informação');

INSERT INTO Cargo_Aula18 (nome_cargo, salario) VALUES
  -- Departamento: Inovação
  ('Analista de Inovação Júnior', 4500.00),
  ('Analista de Inovação Pleno', 6200.00),
  ('Gerente de Inovação', 9800.00),
  ('Pesquisador de Novas Tecnologias', 7200.00),
  ('Coordenador de Projetos Inovadores', 8500.00),
  ('Estagiário de Inovação', 2000.00),
  -- Departamento: Recursos Humanos
  ('Analista de RH Júnior', 4000.00),
  ('Analista de RH Pleno', 5500.00),
  ('Coordenador de RH', 7500.00),
  ('Gerente de RH', 9500.00),
  ('Assistente de RH', 3200.00),
  ('Estagiário de RH', 1800.00),
  -- Departamento: Financeiro
  ('Analista Financeiro Júnior', 4200.00),
  ('Analista Financeiro Pleno', 5800.00),
  ('Coordenador Financeiro', 8200.00),
  ('Gerente Financeiro', 10500.00),
  ('Assistente Financeiro', 3100.00),
  ('Tesoureiro', 6800.00),
  -- Departamento: Marketing
  ('Analista de Marketing Júnior', 4100.00),
  ('Analista de Marketing Pleno', 5600.00),
  ('Coordenador de Marketing', 7800.00),
  ('Gerente de Marketing', 9800.00),
  ('Designer Gráfico', 4700.00),
  ('Estagiário de Marketing', 1900.00),
  -- Departamento: Tecnologia da Informação
  ('Desenvolvedor Júnior', 4800.00),
  ('Desenvolvedor Pleno', 6700.00),
  ('Desenvolvedor Sênior', 9100.00),
  ('Analista de Suporte Técnico', 5200.00),
  ('Gerente de TI', 11000.00),
  ('Estagiário de TI', 2100.00);

INSERT INTO Funcionario_Aula18 (id_cargo, id_departamento, nome, sobrenome) VALUES
  -- Departamento: Recursos Humanos (id_departamento = 2)
  (7, 2, 'Ana', 'Souza'),
  (8, 2, 'Bruno', 'Moraes'),
  (9, 2, 'Carla', 'Santos'),
  (10, 2, 'Daniel', 'Ferreira'),
  (11, 2, 'Eduarda', 'Lima'),
  (12, 2, 'Felipe', 'Rocha'),
  (7, 2, 'Gabriela', 'Oliveira'),
  (8, 2, 'Henrique', 'Pereira'),
  (9, 2, 'Isabela', 'Monteiro'),
  (10, 2, 'João', 'Martins'),
  (11, 2, 'Karen', 'Costa'),
  (12, 2, 'Lucas', 'Barbosa'),
  (7, 2, 'Mariana', 'Gomes'),
  (8, 2, 'Nathalia', 'Ribeiro'),
  (9, 2, 'Otávio', 'Fernandes'),
  (10, 2, 'Paula', 'Silva'),
  (11, 2, 'Rafael', 'Carvalho'),
  (12, 2, 'Sofia', 'Araújo'),
  (7, 2, 'Tiago', 'Nascimento'),
  (8, 2, 'Vanessa', 'Castro'),
  -- Departamento: Financeiro (id_departamento = 3)
  (13, 3, 'André', 'Rodrigues'),
  (14, 3, 'Bianca', 'Cardoso'),
  (15, 3, 'Caio', 'Mendes'),
  (16, 3, 'Denise', 'Lopes'),
  (17, 3, 'Elias', 'Gonçalves'),
  (18, 3, 'Fernanda', 'Dias'),
  (13, 3, 'Guilherme', 'Teixeira'),
  (14, 3, 'Helena', 'Souza'),
  (15, 3, 'Igor', 'Cavalcante'),
  (16, 3, 'Juliana', 'Nunes'),
  (17, 3, 'Kevin', 'Farias'),
  (18, 3, 'Larissa', 'Machado'),
  (13, 3, 'Marcelo', 'Pinto'),
  (14, 3, 'Natália', 'Rezende'),
  (15, 3, 'Otto', 'Siqueira'),
  (16, 3, 'Patrícia', 'Freitas'),
  (17, 3, 'Renato', 'Correia'),
  (18, 3, 'Simone', 'Barros'),
  (13, 3, 'Thiago', 'Peixoto'),
  (14, 3, 'Viviane', 'Carneiro'),
  -- Departamento: Marketing (id_departamento = 4)
  (19, 4, 'Aline', 'Araújo'),
  (20, 4, 'Bernardo', 'Queiroz'),
  (21, 4, 'Camila', 'Xavier'),
  (22, 4, 'Diego', 'Andrade'),
  (23, 4, 'Esther', 'Leal'),
  (24, 4, 'Fábio', 'Tavares'),
  (19, 4, 'Giovana', 'Almeida'),
  (20, 4, 'Hugo', 'Campos'),
  (21, 4, 'Ingrid', 'Ferraz'),
  (22, 4, 'Joana', 'Rezende'),
  (23, 4, 'Kaique', 'Vasconcelos'),
  (24, 4, 'Larissa', 'Meireles'),
  (19, 4, 'Marcos', 'Prado'),
  (20, 4, 'Nina', 'Costa'),
  (21, 4, 'Otávia', 'Moreira'),
  (22, 4, 'Pedro', 'Sampaio'),
  (23, 4, 'Quésia', 'Ramos'),
  (24, 4, 'Rogério', 'Furtado'),
  (19, 4, 'Samuel', 'Pereira'),
  (20, 4, 'Talita', 'Assis'),
  -- Departamento: Tecnologia da Informação (id_departamento = 5)
  (25, 5, 'Alex', 'Moraes'),
  (26, 5, 'Bruna', 'Dias'),
  (27, 5, 'Carlos', 'Henrique'),
  (28, 5, 'Daniela', 'Souza'),
  (29, 5, 'Eduardo', 'Gomes'),
  (30, 5, 'Fernanda', 'Silveira'),
  (25, 5, 'Gabriel', 'Rocha'),
  (26, 5, 'Helena', 'Ferreira'),
  (27, 5, 'Ismael', 'Lima'),
  (28, 5, 'Jéssica', 'Carvalho'),
  (29, 5, 'Kleber', 'Machado'),
  (30, 5, 'Letícia', 'Costa'),
  (25, 5, 'Matheus', 'Pereira'),
  (26, 5, 'Nicole', 'Barbosa'),
  (27, 5, 'Otávio', 'Oliveira'),
  (28, 5, 'Patrícia', 'Ribeiro'),
  (29, 5, 'Rogério', 'Fernandes'),
  (30, 5, 'Sabrina', 'Freitas'),
  (25, 5, 'Tiago', 'Santos'),
  (26, 5, 'Vitória', 'Alves');

-- Desafio 1: Join externa
-- O RH precisa de um relatório que liste TODOS os departamentos e quantos funcionários trabalham em cada um.
-- Dica: o nome do funcionário deve aparecer como NULL para o departamento sem funcionários.

SELECT *
FROM Departamento_Aula18 as d
LEFT JOIN Funcionario_Aula18 as f
  ON d.id = f.id_departamento;

-- Desafio 2: Join não idêntica
-- O RH quer um relatório que mostre o nome de cada funcionário e seu nível salarial.
-- Dica: é preciso usar BETWEEN

SELECT
  CONCAT(f.nome, ' ', f.sobrenome) AS "Nome do funcionário",
  c.salario "Salário",
  nc.nivel "Nível salarial"
FROM Funcionario_Aula18 as f
JOIN Cargo_Aula18 as c
  ON f.id_cargo = c.id
JOIN Nivel_Cargo_Aula18 as nc
  ON c.salario
  BETWEEN nc.sal_min AND nc.sal_max;

-- Desafio 3: Combinando conceitos
-- O RH pediu uma lista específica: o nome de TODOS os funcionários do nível "Pleno" que trabalham no departamento
-- "Financeiro".
-- Dica: JOIN de 3 tabelas, WHERE

SELECT
  CONCAT(f.nome, ' ', f.sobrenome) AS "Nome do funcionário",
  d.nome_departamento Departamento,
  c.salario "Salário",
  nc.nivel "Nível salarial"
FROM Funcionario_Aula18 as f
JOIN Cargo_Aula18 as c
  ON f.id_cargo = c.id
JOIN Departamento_Aula18 as d
  ON f.id_departamento = d.id
JOIN Nivel_Cargo_Aula18 as nc
  ON c.salario
  BETWEEN nc.sal_min AND nc.sal_max
  WHERE nc.nivel = 'Pleno' AND f.id_departamento = 3;