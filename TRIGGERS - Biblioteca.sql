USE db_biblioteca;

SELECT * FROM autores;
SELECT * FROM emprestimos;
SELECT COUNT(id_membro) FROM emprestimos WHERE id_membro = 3;
SELECT * FROM livros;
SELECT * FROM membros;

-- TRIGGERS
-- Exercicio 1. Criar uma trigger que impeça a inserção de autores com menos de 18 anos.
-- IF TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE()) < 18 THEN
-- SIGNAL SQLSTATE '45000'
-- SET MESSAGE_TEXT = 'O autor deve ter 18 anos para ser registrado!';
-- END IF;

INSERT INTO autores (id_autor, nome, data_nascimento) VALUES
('4', 'Miguel', '2007-01-01');
-- DELETE FROM autores WHERE id_autor = 4;

-- Exercicio 2. Criar uma trigger que atualize automaticamente a data de devolução para
-- 15 dias após a data de empréstimo.
-- SET NEW.data_devolucao = DATE_ADD(NEW.data_emprestimo, INTERVAL 15 DAY);

INSERT INTO emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo) VALUES
('5', '4', '3', DATE(NOW()));

-- Exercicio 3. Criar uma trigger que impeça que um membro faça mais de 3 empréstimos
-- ao mesmo tempo.
-- IF (SELECT COUNT(NEW.id_membro) FROM emprestimos) >= 3 THEN
-- SIGNAL SQLSTATE '45000'
-- SET MESSAGE_TEXT = 'Membros não podem ter mais de 3 empréstimos ao mesmo tempo!';
-- END IF;

INSERT INTO emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo) VALUES
('7','3','4', DATE(NOW()));

-- Exercicio 4. Trigger de Atualização Automática da Data de Adesão
-- SET NEW.data_adesao = DATE(NOW());

INSERT INTO membros (id_membro, nome) VALUES ('4', 'Gil');

-- Exercicio 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.
-- IF NEW.nome IN (SELECT A.nome FROM autores AS A) THEN
-- SIGNAL SQLSTATE '45000'
-- SET MESSAGE_TEXT = 'Não é possível inserir autor com nome duplicado!';
-- END IF;

INSERT INTO autores (id_autor, nome, data_nascimento) VALUES
('4', 'Julio Verne', '2000-03-14');