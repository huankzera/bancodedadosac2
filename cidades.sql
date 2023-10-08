create table Cidades (
id int primary key,
nome varchar(60) not null,
populacao int

);

create table Alunos (
id int primary key,
nome varchar(60) not null,
data nasc date,
cidade id int,

foreign key(cidade id) references Cidades(id)

);
-- Inserindo dados na tabela Cidades
INSERT INTO Cidades (id, nome, populacao) VALUES
(1, 'São Paulo', 12252023),
(2, 'Rio de Janeiro', 6747815),
(3, 'Belo Horizonte', 2523794),
(4, 'Salvador', 2886698),
(5, 'Recife', 1637528),
(6, 'Fortaleza', 2701505),
(7, 'Brasília', 3055149),
(8, 'Porto Alegre', 1484941),
(9, 'Curitiba', 1948626),
(10, 'Manaus', 2191895),
(11, 'Belém', 1440474),
(12, 'Goiânia', 1536097);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (id, nome, data_nasc, cidade_id) VALUES
(1, 'João', '2000-01-15', 1),
(2, 'Maria', '2001-05-22', 2),
(3, 'Pedro', '1999-11-10', 3),
(4, 'Ana', '2002-03-08', 4),
(5, 'Lucas', '2003-07-12', 5),
(6, 'Mariana', '2000-09-25', 6),
(7, 'Carlos', '2001-02-18', 7),
(8, 'Julia', '2002-08-30', 8),
(9, 'Luiz', '1998-12-03', 9),
(10, 'Isabela', '2003-04-14', 10),
(11, 'Fernando', '2000-06-28', 11),
(12, 'Camila', '1999-10-05', 12);

SELECT Alunos.id AS id_aluno, Alunos.nome AS nome_aluno, Alunos.data_nasc, Cidades.nome AS nome_cidade, Cidades.populacao
FROM Alunos
INNER JOIN Cidades ON Alunos.cidade_id = Cidades.id;
