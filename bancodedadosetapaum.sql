CREATE DATABASE MeuBancoDeDados;

USE MeuBancoDeDados;

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    perecível BOOLEAN NOT NULL,
    marca VARCHAR(255),
    nacionalidade VARCHAR(255)
);

INSERT INTO Produtos (nome, preço, estoque, perecível, marca, nacionalidade)
VALUES
    ('Produto 1', 19.99, 100, 0, 'Marca A', 'Nacional'),
    ('Produto 2', 29.99, 50, 1, 'Marca B', 'Importado'),
    ('Produto 3', 9.99, 200, 0, 'Marca C', 'Nacional'),
    ('Produto 4', 49.99, 75, 1, 'Marca A', 'Importado'),
    ('Produto 5', 14.99, 150, 0, 'Marca B', 'Nacional');
    
    SELECT * FROM Produtos;
    

SELECT COUNT(*) AS Total_de_Produtos FROM Produtos;

SELECT AVG(preço) AS Preço_Médio_dos_Produtos FROM Produtos;

SELECT perecível, AVG(preço) AS Preço_Médio FROM Produtos GROUP BY perecível;

SELECT nome, AVG(preço) AS Preço_Médio FROM Produtos GROUP BY nome;

SELECT AVG(preço) AS Preço_Médio, SUM(estoque) AS Total_Em_Estoque FROM Produtos;

SELECT nome, marca, estoque FROM Produtos WHERE preço = (SELECT MAX(preço) FROM Produtos);

SELECT * FROM Produtos WHERE preço > (SELECT AVG(preço) FROM Produtos);

SELECT nacionalidade, COUNT(*) AS Quantidade FROM Produtos GROUP BY nacionalidade;