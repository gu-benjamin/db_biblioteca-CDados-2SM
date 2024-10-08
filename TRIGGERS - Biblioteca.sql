USE db_biblioteca;

SELECT * FROM autores;
SELECT * FROM emprestimos;
SELECT * FROM livros;
SELECT * FROM membros;

-- TRIGGERS
-- Exercicio 1. Criar uma trigger que impeça a inserção de autores com menos de 18 anos.

-- CREATE DEFINER=`root`@`localhost` TRIGGER `autores_BEFORE_INSERT` BEFORE INSERT ON `autores` FOR EACH ROW IF TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE()) < 18 THEN
-- SIGNAL SQLSTATE '45000'
-- SET MESSAGE_TEXT = 'O autor deve ter 18 anos para ser registrado!';
-- END IF
INSERT INTO autores (id_autor, nome, data_nascimento) VALUES
('4', 'Miguel', '2007-01-01');

-- Exercicio 2. Criar uma trigger que atualize automaticamente a data de devolução para
-- 15 dias após a data de empréstimo.

-- CREATE DEFINER=`root`@`localhost` TRIGGER `emprestimos_BEFORE_INSERT` BEFORE INSERT ON `emprestimos` FOR EACH ROW BEGIN
-- SET NEW.data_devolucao = DATE_ADD(NEW.data_emprestimo, INTERVAL 15 DAY);
-- END

INSERT INTO emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo) VALUES
('5', '4', '3', DATE(NOW()));

-- Exercicio 3. Criar uma trigger que impeça que um membro faça mais de 3 empréstimos
-- ao mesmo tempo.

-- A fazer.. 

-- Exercicio 4. Trigger de Atualização Automática da Data de Adesão

-- CREATE DEFINER=`root`@`localhost` TRIGGER `membros_BEFORE_INSERT` BEFORE INSERT ON `membros` FOR EACH ROW BEGIN
-- SET NEW.data_adesao = DATE(NOW());
-- END

INSERT INTO membros (id_membro, nome) VALUES ('4', 'Gil');


-- Exercicio 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.

-- IF NEW.nome = (SELECT nome FROM autores) THEN
-- SIGNAL SQLSTATE '45000'
-- SET MESSAGE_TEXT = 'Não é possível inserir autor com nome duplicado!';
-- END IF;