-- 1. Acessar o banco de dados
CREATE DATABASE DB_Escola_Lizandra_03361B;
USE DB_Escola_Lizandra_03361B;

-- 2. Criar as tabelas aluno, professor e comentário
-- 3. Relacionar as tabelas de forma que seja possível consultar comentários e notas por professor, curso ou aluno
CREATE TABLE Aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    curso VARCHAR(100)
    -- id_comentario INT NOT NULL,
    -- id_professor INT NOT NULL,
    -- CONSTRAINT fk_IdComentario FOREIGN KEY (id_comentario) REFERENCES Comentario(id_comentario),
    -- CONSTRAINT fk_IdProfessor FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Professor (
	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(100),
    curso VARCHAR(100)
    -- id_comentario INT NOT NULL,
    -- id_aluno INT NOT NULL,
    -- CONSTRAINT fk_IdComentario FOREIGN KEY (id_comentario) REFERENCES Comentario(id_comentario),
    -- CONSTRAINT fk_IdProfessor FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    -- CONSTRAINT fk_IdAluno FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

CREATE TABLE Comentario (
	id_comentario INT PRIMARY KEY AUTO_INCREMENT,
    comentario TEXT,
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    notadoprofessor DECIMAL (3, 1),
    CONSTRAINT fk_IdAluno FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    CONSTRAINT fk_IdProfessor FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- 4. Inserir os dados conforme o cenário proposto
INSERT INTO Aluno (nome, sobrenome, curso) VALUES
	('Junio', 'Souza', 'Matemática'),
    ('Thais', 'Silva', 'Matemática'),
    ('Helena', 'Tavares', 'Ciências'),
    ('Isadora', 'Nascimento', 'Ciências'),
    ('Mia', 'Buarque', 'Matemática'),
    ('Milena', 'Cardoso', 'Inglês'),
    ('Lizandra', 'Silva', 'Inglês'),
    ('Solange', 'Oliveira', 'Ciências'),
    ('Antonio', 'Rodrigues', 'Matemática');

INSERT INTO Professor (nome_professor, curso) VALUES
	('Pezzi', 'Ciências'),
    ('Marina', 'Matemática'),
    ('Anne', 'Inglês');
    
INSERT INTO Comentario (comentario, notadoprofessor) VALUES
	('Precisa melhorar em álgebra', 6.5),
    ('Precisa melhorar em trigonometria', 7.0),
    ('Parabéns por ter estudado tanto', 10.0),
    ('Revise a estrutura das células', 8.0),
    ('Quase lá', 8.5),
    ('Needs to work on verbs', 7.0),
    ('Great work', 9.0),
    ('Revise tudo!', 5.5),
    ('Precisa melhorar em cálculo', 7.0);