-- Desafio Aula 09

 -- Objetivo: Escreva um único script SQL que execute as 5 etapas a seguir e,
 -- ao final, envie o arquivo .sql para seu GitHub.

-- Etapas do Script:

-- 1. CRIAR: Crie um banco de dados chamado meu_dia_a_dia_SEU_NOME
-- (em SEU_NOME substitua pelo seu nome) e, dentro dele, uma tabela tarefas com as colunas:
    -- id (INT, Chave Primária, Auto-incremento)
    -- descricao (VARCHAR(200), Obrigatório)
    -- status (VARCHAR(20))
CREATE DATABASE meu_dia_a_dia_Lizandra;
USE meu_dia_a_dia_Lizandra;

CREATE TABLE tarefas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    status VARCHAR(20)
);
    
-- 2. INSERIR: Insira 3 tarefas na tabela, todas com o status inicial 'Pendente'.
INSERT INTO tarefas (descricao, status) VALUES
	('Criar o banco de dados', 'Pendente'),
    ('Inserir dados no banco de dados', 'Pendente'),
    ('Atualizar o banco de dados', 'Pendente');

-- 3. ATUALIZAR: Altere o status de uma tarefa para 'Em Andamento' e de outra para 'Concluído'.
UPDATE tarefas SET status = 'Em andamento' WHERE id = 2;
UPDATE tarefas SET status = 'Concluído' WHERE id = 1;

-- 4. ALTERAR: Adicione uma nova coluna prioridade (INT) à tabela.
-- Em seguida, use UPDATE para definir a prioridade 1 para a tarefa que ainda está pendente.
ALTER TABLE tarefas ADD COLUMN prioridade VARCHAR(20);
UPDATE tarefas SET prioridade = 1 WHERE id = 3;

-- 5. VERIFICAR: Inclua um SELECT * FROM tarefas; no final do script para exibir o resultado.
SELECT * FROM tarefas;