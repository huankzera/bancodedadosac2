-- Crie a tabela especies
CREATE TABLE especies (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Insira algumas espécies de animais
INSERT INTO especies (id, nome) VALUES
(1, 'gato'),
(2, 'cachorro'),
(3, 'pássaro');

-- Crie a tabela animais
CREATE TABLE animais (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    especie_id INT,
    peso DECIMAL(5, 2),
    cor VARCHAR(20),
    altura DECIMAL(5, 2),
    observacao TEXT,
    data_nascimento DATE
);

-- Insira alguns animais
INSERT INTO animais (id, nome, especie_id, peso, cor, data_nascimento)
VALUES
(1, 'Pateta', 2, 20, 'marrom', '2015-05-10'),
(2, 'Garfield', 1, 15, 'laranja', '2017-03-20'),
(3, 'Tom', 1, 12, 'cinza', '2018-02-15'),
(4, 'Pluto', 2, 25, 'preto', '2016-09-05'),
(5, 'Tweety', 3, 0.1, 'amarelo', '2019-11-30');


-- Remova o campo cor dos animais
ALTER TABLE animais
DROP COLUMN cor;

-- Aumente o tamanho do campo nome dos animais para 80 caracteres
ALTER TABLE animais
ALTER COLUMN nome VARCHAR(80);

-- Remova todos os gatos e cachorros
DELETE FROM animais
WHERE especie IN ('gato', 'cachorro');

-- Remova o campo data de nascimento dos animais
ALTER TABLE animais
DROP COLUMN data_nascimento;

-- Remova todos os animais
DELETE FROM animais;

-- Remova a tabela especies
DROP TABLE especies;
