USE db_biblioteca;

SELECT * FROM autores;
SELECT * FROM emprestimos;
SELECT * FROM livros;
SELECT * FROM membros;

-- a. O livro com a data de publicação mais antigo
SELECT * FROM livros WHERE ano_publicacao = (SELECT MIN(ano_publicacao) FROM livros);

-- b. O livro com a data de publicação mais recente
SELECT * FROM livros WHERE ano_publicacao = (SELECT MAX(ano_publicacao) FROM livros);

-- c. A quantidade de livros cadastrados no banco de dados
SELECT COUNT(id_livro) AS 'Livros registrados' FROM livros;

-- d. Consulte apenas os livros que possuam a data de devolução em 18-07-2024
SELECT * FROM livros WHERE id_livro = 
(SELECT id_livro FROM emprestimos WHERE data_devolucao = '2024-07-18');

-- e. Ordene o nome dos autores em ordem crescente
SELECT nome FROM autores ORDER BY nome ASC;

-- f. Ordene o nome dos livros em ordem decrescente
SELECT nome FROM autores ORDER BY nome DESC;

-- SUBQUERIES
-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos
-- de publicação de todos os livros cadastrados.
SELECT * FROM autores 
WHERE id_autor = (SELECT id_autor FROM livros 
WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM livros));

-- b. Encontre os membros que realizaram mais de um empréstimo.
SELECT * FROM membros WHERE id_membro = (SELECT id_membro FROM emprestimos 
GROUP BY id_membro HAVING COUNT(id_emprestimo) > 1);

-- c. Liste os livros que foram emprestados ao menos uma vez.
SELECT * FROM livros WHERE id_livro = (SELECT id_livro FROM emprestimos 
GROUP BY id_livro HAVING COUNT(id_emprestimo) > 1);

-- d. Consulte os livros que ainda não foram emprestados.
SELECT * FROM livros WHERE id_livro = (SELECT id_livro FROM emprestimos 
GROUP BY id_livro HAVING COUNT(id_emprestimo) < 1);
