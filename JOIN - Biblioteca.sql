USE db_biblioteca;

SELECT * FROM autores;
SELECT * FROM livros;
SELECT * FROM membros; 
SELECT * FROM emprestimos;

-- 1. INNER JOIN

-- Exercício 1: Liste os nomes dos membros que pegaram livros emprestados e
-- o título dos livros que eles emprestaram.
SELECT nome, titulo FROM membros AS M
INNER JOIN emprestimos AS E
ON M.id_membro = E.id_livro
INNER JOIN livros AS L
ON E.id_livro = L.id_livro;

-- Exercício 2: Liste os autores e os livros que foram emprestados.
SELECT nome, titulo FROM livros AS L
INNER JOIN autores AS A
ON L.id_autor = A.id_autor
INNER JOIN emprestimos AS E
ON L.id_livro = E.id_livro;

-- 2. LEFT / RIGHT JOIN

-- Exercício 1: Liste todos os membros, incluindo aqueles que não realizaram
-- nenhum empréstimo.
SELECT * FROM emprestimos AS E
RIGHT JOIN  membros AS M
ON E.id_membro = M.id_membro;

SELECT * FROM membros AS E
LEFT JOIN  emprestimos AS M
ON E.id_membro = M.id_membro;

-- Exercício 2: Liste todos os autores e seus livros, incluindo livros que não foram
-- emprestados.
SELECT * FROM emprestimos AS E
RIGHT JOIN livros AS L
ON E.id_livro = L.id_livro
INNER JOIN autores AS A
ON L.id_autor = A.id_autor;

SELECT * FROM livros AS L
INNER JOIN autores AS A
ON L.id_autor = A.id_autor
LEFT JOIN emprestimos AS E
ON E.id_livro = L.id_livro;

-- 3. UNION

-- Exercício 1: Liste todos os livros e seus autores, incluindo livros que não têm
-- autores associados e autores que não têm livros cadastrados.
SELECT * FROM livros AS L
LEFT JOIN autores AS A
ON L.id_autor = A.id_autor
UNION
SELECT * FROM livros AS L
RIGHT JOIN autores AS A
ON L.id_autor = A.id_autor;

-- Exercício 2: Liste todos os membros e livros emprestados, incluindo membros
-- que não pegaram livros e livros que não foram emprestados.
SELECT * FROM emprestimos AS E
INNER JOIN membros AS M
ON E.id_membro = M.id_membro
LEFT JOIN livros AS L
ON E.id_livro = L.id_livro
UNION
SELECT * FROM emprestimos AS E
INNER JOIN livros AS L
ON E.id_livro = L.id_livro
RIGHT JOIN membros AS M
ON E.id_membro = M.id_membro;

