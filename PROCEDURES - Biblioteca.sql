USE db_biblioteca;

-- EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.
DELIMITER $$
CREATE PROCEDURE inserirAutor(
IN nome_p VARCHAR(255),
IN data_nascimento_p DATE
)
BEGIN

INSERT INTO autores (nome, data_nascimento)
VALUES (nome_p, data_nascimento_p);

END $$
DELIMITER ;

CALL inserirAutor('Barack Obama', '1980-01-01');
SELECT * FROM autores;

-- EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um
-- empréstimo já registrado.
DELIMITER $$
CREATE PROCEDURE atualizarDevolucao(
IN id_emp_p INT,
IN nova_devolucao_p DATE
)
BEGIN

UPDATE emprestimos SET data_devolucao = nova_devolucao_p WHERE id_emprestimo = id_emp_p;

END $$
DELIMITER ;

SELECT * FROM emprestimos;
CALL atualizarDevolucao('6', '2024-10-30');

-- EXERCICIO 3. Crie uma stored procedure que consulte todos os livros emprestados
-- por um determinado membro, retornando os títulos dos livros e as datas de
-- empréstimo.
DELIMITER $$
CREATE PROCEDURE livrosMembro(
IN id_membro_p INT
)
BEGIN

SELECT titulo, data_emprestimo FROM emprestimos AS E
INNER JOIN livros AS L ON E.id_livro = L.id_livro
WHERE id_membro = id_membro_p; 

END $$
DELIMITER ;

SELECT * FROM membros;
SELECT * FROM emprestimos;
CALL livrosMembro(3);

-- EXERCICIO 4. Crie uma stored procedure que registre um novo empréstimo,
-- verificando se o membro e o livro existem.
DELIMITER $$
CREATE PROCEDURE novoEmprestimo(
IN id_membro_p INT,
IN id_livro_p INT,
IN data_emprestimo_p DATE
)
BEGIN

IF id_membro_p NOT IN (SELECT id_membro FROM membros) AND id_livro_p NOT IN (SELECT id_livro FROM livros) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Erro. Membro ou livro inserido não existe!';
ELSE
INSERT INTO emprestimos(id_membro, id_livro, data_emprestimo) 
VALUES(id_membro_p, id_livro_p, data_emprestimo_p);
END IF;

END $$
DELIMITER ;

SELECT * FROM membros;
SELECT * FROM emprestimos;
SELECT * FROM livros;

CALL novoEmprestimo(2,10, DATE(NOW()));

