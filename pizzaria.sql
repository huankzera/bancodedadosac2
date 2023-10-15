-- Cria o banco de dados
CREATE DATABASE Pizzaria;

-- Usa o banco de dados
USE Pizzaria;

-- Cria a tabela de Pizzaiolos
CREATE TABLE Pizzaiolos (
    PizzaioloID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Insere alguns dados de pizzaiolos
INSERT INTO Pizzaiolos (Nome) VALUES
    ('João'),
    ('Maria'),
    ('Carlos');

-- Cria a tabela de Ingredientes
CREATE TABLE Ingredientes (
    IngredienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Insere alguns ingredientes
INSERT INTO Ingredientes (Nome) VALUES
    ('Queijo'),
    ('Molho de Tomate'),
    ('Pepperoni'),
    ('Mussarela'),
    ('Cebola'),
    ('Pimentão');

-- Cria a tabela de Pizzas
CREATE TABLE Pizzas (
    PizzaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    PizzaioloID INT,
    InstrucoesPreparo TEXT,
    FOREIGN KEY (PizzaioloID) REFERENCES Pizzaiolos(PizzaioloID)
);

-- Insere algumas pizzas
INSERT INTO Pizzas (Nome, PizzaioloID, InstrucoesPreparo) VALUES
    ('Pizza de Pepperoni', 1, 'Passo 1: Espalhe molho de tomate, Passo 2: Adicione queijo e pepperoni, Passo 3: Asse a 200°C por 15 minutos.'),
    ('Pizza de Mussarela', 2, 'Passo 1: Espalhe molho de tomate, Passo 2: Adicione queijo e mussarela, Passo 3: Asse a 200°C por 15 minutos.'),
    ('Pizza Vegetariana', 3, 'Passo 1: Espalhe molho de tomate, Passo 2: Adicione queijo, cebola e pimentão, Passo 3: Asse a 200°C por 15 minutos.');

-- Cria a tabela de relação entre Pizzas e Ingredientes
CREATE TABLE PizzaIngredientes (
    PizzaID INT,
    IngredienteID INT,
    PRIMARY KEY (PizzaID, IngredienteID),
    FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID),
    FOREIGN KEY (IngredienteID) REFERENCES Ingredientes(IngredienteID)
);

-- Insere os ingredientes de cada pizza
INSERT INTO PizzaIngredientes (PizzaID, IngredienteID) VALUES
    (1, 1),  -- Queijo na Pizza de Pepperoni
    (1, 2),  -- Molho de Tomate na Pizza de Pepperoni
    (1, 3),  -- Pepperoni na Pizza de Pepperoni
    (2, 1),  -- Queijo na Pizza de Mussarela
    (2, 2),  -- Molho de Tomate na Pizza de Mussarela
    (4, 1),  -- Queijo na Pizza Vegetariana
    (4, 2),  -- Molho de Tomate na Pizza Vegetariana
    (4, 4),  -- Mussarela na Pizza Vegetariana
    (4, 5);  -- Cebola na Pizza Vegetariana

-- Relatório 1: Todas as pizzas e os pizzaiolos aptos a produzi-las
SELECT p.Nome AS Pizza, pz.Nome AS Pizzaiolo
FROM Pizzas p
JOIN Pizzaiolos pz ON p.PizzaioloID = pz.PizzaioloID;

-- Relatório 2: Todas as pizzas e seus ingredientes
SELECT p.Nome AS Pizza, GROUP_CONCAT(i.Nome) AS Ingredientes
FROM Pizzas p
JOIN PizzaIngredientes pi ON p.PizzaID = pi.PizzaID
JOIN Ingredientes i ON pi.IngredienteID = i.IngredienteID
GROUP BY p.PizzaID;

-- Relatório 3: Todos os ingredientes e as pizzas onde são utilizados
SELECT i.Nome AS Ingrediente, GROUP_CONCAT(p.Nome) AS Pizzas
FROM Ingredientes i
JOIN PizzaIngredientes pi ON i.IngredienteID = pi.IngredienteID
JOIN Pizzas p ON pi.PizzaID = p.PizzaID
GROUP BY i.IngredienteID;

-- Relatório 4: Sabores de todas as pizzas, pizzaiolos e instruções
SELECT p.Nome AS Pizza, pz.Nome AS Pizzaiolo, p.InstrucoesPreparo
FROM Pizzas p
JOIN Pizzaiolos pz ON p.PizzaioloID = pz.PizzaioloID;
