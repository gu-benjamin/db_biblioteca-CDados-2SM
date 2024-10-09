USE db_biblioteca;

SELECT * FROM livros;
SELECT * FROM autores;
SELECT * FROM membros;
SELECT * FROM emprestimos;

-- Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor
-- com base na data de nascimento.
DELIMITER $$
CREATE FUNCTION calcularIdadeAutor(id_A INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE idade INT;

SELECT TIMESTAMPDIFF(YEAR,data_nascimento,CURDATE()) INTO idade FROM autores
WHERE id_autor = id_A;

RETURN idade;

END $$
DELIMITER ;

SELECT nome, calcularIdadeAutor(id_autor) AS 'Idade' FROM autores;
 
-- Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de
-- livros escritos por esse autor.
DELIMITER $$
CREATE FUNCTION quantidadeLivros(id_A INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE quantidade_livros INT;

SELECT COUNT(id_autor) INTO quantidade_livros FROM livros 
WHERE id_autor = id_A;

RETURN quantidade_livros;

END $$
DELIMITER ;

SELECT nome, quantidadeLivros(id_autor) AS 'Quantidade de livros' FROM autores;

-- Exercicio 3. Crie uma função que recebe duas datas e retorna o total de
-- empréstimos realizados nesse período.
DELIMITER $$
CREATE FUNCTION totalEmprestimosPeriodo(data_inicio DATE, data_fim DATE)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE quantidade_emprestimos INT;

SELECT COUNT(id_emprestimo) INTO quantidade_emprestimos FROM emprestimos 
WHERE data_emprestimo BETWEEN data_inicio AND data_fim;
RETURN quantidade_emprestimos;

END $$
DELIMITER ;

SELECT totalEmprestimosPeriodo('2024-09-01', '2024-10-31') AS 'Emprestimos entre 01/09/2024 a 31/10/2024';

-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros
-- foram emprestados.
DELIMITER $$
CREATE FUNCTION mediaDiasLivros(id_L INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
DECLARE media DECIMAL(10,2);

SELECT AVG(TIMESTAMPDIFF(YEAR, data_emprestimo, data_devolucao)) INTO media FROM emprestimos
WHERE id_livro = id_L;

RETURN media;

END $$
DELIMITER ;

SELECT titulo, mediaDiasLivros(id_livro) AS 'Média de dias emprestado' FROM livros;
