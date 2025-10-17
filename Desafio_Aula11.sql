USE locadora_db_Jane;

SHOW TABLES;

DESCRIBE Filmes;
DESCRIBE Generos;

SELECT * FROM Filmes;
SELECT * FROM Generos;

-- Use o comando 'USE locadora_db_Jane;' para selecionar a base de dados e crie uma consulta 'SELECT' para responder a cada uma das seguintes perguntas:

-- 1. **Clássicos do Século XX:** Quais filmes do catálogo foram lançados **antes do ano 2000**?
SELECT * FROM Filmes WHERE ano_lancamento <= 2000;

-- 2. **Aclamados pela Crítica:** Quais filmes têm uma nota de avaliação **maior ou igual a 8,8**?
SELECT * FROM Filmes WHERE nota_avaliacao >= 8.8;

-- 3. **Ficção Científica Moderna:** Quais filmes são do gênero **'Ficção Científica' E** foram lançados **a partir de 2010**?
SELECT f.titulo,f.ano_lancamento,g.nome_genero
FROM Filmes AS f
INNER JOIN Generos AS g
ON f.id_genero = g.id_genero
WHERE 	f.ano_lancamento = 2010
		AND g.nome_genero = 'Ficção Científica';

-- 4. **Sessão da Tarde:** Quais filmes são do gênero **'Drama' OU** do gênero **'Animação'**?
SELECT f.titulo,g.nome_genero
FROM Filmes AS f
INNER JOIN Generos AS g
ON f.id_genero = g.id_genero
WHERE 	g.nome_genero = 'Drama'
		OR g.nome_genero = 'Animação';

-- 5. **Excluindo um Título:** Liste todos os filmes, **exceto** o filme com o título 'Matrix'.
SELECT f.titulo,f.ano_lancamento,g.nome_genero,f.nota_avaliacao
FROM Filmes AS f
INNER JOIN Generos as g
ON f.id_genero = g.id_genero
WHERE f.titulo <> 'Matrix'
ORDER BY f.ano_lancamento ASC;

-- Salve todas as 5 consultas 'SELECT' em um único arquivo chamado 'desafio_aula11.sql'.
-- Faça o *commit* e o *push* do arquivo para seu repositório no GitHub com a mensagem "Desafio da Aula 11 concluído".