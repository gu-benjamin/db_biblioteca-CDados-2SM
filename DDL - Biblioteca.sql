CREATE DATABASE db_biblioteca;
USE db_biblioteca;

CREATE TABLE autores(
id_autor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
data_nascimento DATE NOT NULL,
PRIMARY KEY(id_autor)
);

CREATE TABLE livros(
id_livro INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
ano_publicacao INT NOT NULL,
id_autor INT NOT NULL,
PRIMARY KEY(id_livro),
FOREIGN KEY(id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE membros(
id_membro INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
data_adesao DATE NOT NULL,
PRIMARY KEY(id_membro)
);

CREATE TABLE emprestimos(
id_emprestimo INT NOT NULL AUTO_INCREMENT,
id_membro INT NOT NULL,
id_livro INT NOT NULL,
data_emprestimo DATE NOT NULL,
data_devolucao DATE NOT NULL,
PRIMARY KEY(id_emprestimo),
FOREIGN KEY(id_membro) REFERENCES membros(id_membro),
FOREIGN KEY(id_livro) REFERENCES livros(id_livro)
);

SELECT * FROM autores;
SELECT * FROM emprestimos;
SELECT * FROM livros;
SELECT * FROM membros;