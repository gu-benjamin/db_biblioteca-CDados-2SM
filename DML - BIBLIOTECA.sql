USE db_biblioteca;

SET @@autocommit = ON;

SELECT * FROM autores;
SELECT * FROM livros;
SELECT * FROM membros;
SELECT * FROM emprestimos;

INSERT INTO autores VALUES
('1', 'Julio Verne', '1869-10-31'),
('2', 'Machado de Assis', '1880-08-25'),
('3', 'Monteiro Lobato', '1910-02-15');

INSERT INTO livros VALUES
('1', 'A volta ao mundo em 80 dias', '1890', '1'),
('2', 'Dom Casmurro', '1899', '2'),
('3', 'O Picapau Amarelo', '1939', '3');

INSERT INTO membros VALUES
('1', 'Jessica', '2020-05-14'),
('2', 'Claudio', '2022-08-26'),
('3', 'Vasco', '2024-09-06');

INSERT INTO emprestimos VALUES
('1', '1', '2', '2024-05-15', '2024-06-05'),
('2', '2', '1', '2024-06-07', '2024-07-07'),
('3', '3', '3', '2024-09-10', '2024-10-10'),
('4', '3', '2', '2024-09-15', '2024-10-15');
