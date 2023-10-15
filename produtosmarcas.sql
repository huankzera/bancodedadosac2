-- Tabela de Marcas
CREATE TABLE marcas (
    mrc_id INT AUTO_INCREMENT PRIMARY KEY,
    mrc_nome VARCHAR(255) NOT NULL,
    mrc_nacionalidade VARCHAR(255),
    UNIQUE (mrc_nome)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    prd_id INT AUTO_INCREMENT PRIMARY KEY,
    prd_nome VARCHAR(255) NOT NULL,
    prd_qtd_estoque INT NOT NULL DEFAULT 0,
    prd_estoque_minimo INT NOT NULL DEFAULT 0,
    prd_data_fabricacao DATE,
    prd_marcn_irl INT,
    CONSTRAINT fk_marcas FOREIGN KEY (prd_marcn_irl) REFERENCES marcas(mrc_id),
    prd_disponivel BOOLEAN,
    prd_preco DECIMAL(10, 2),
    prd_categoria INT,
    FOREIGN KEY (prd_categoria) REFERENCES categorias(cat_id)
);

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    forn_id INT AUTO_INCREMENT PRIMARY KEY,
    forn_nome VARCHAR(255) NOT NULL,
    forn_email VARCHAR(255),
    UNIQUE (forn_email)
);

-- Tabela de Produto_Fornecedor (Tabela de Relacionamento)
CREATE TABLE produto_fornecedor (
    pf_prod_id INT,
    pf_forn_id INT,
    PRIMARY KEY (pf_prod_id, pf_forn_id),
    FOREIGN KEY (pf_prod_id) REFERENCES produtos(prd_id),
    FOREIGN KEY (pf_forn_id) REFERENCES fornecedores(forn_id)
);


-- Crie a View de Produtos e Marcas
CREATE VIEW produtos_marcas AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome AS marca
FROM produtos p
LEFT JOIN marcas m ON p.prd_marcn_irl = m.mrc_id;

-- Crie a View de Produtos e Fornecedores
CREATE VIEW produtos_fornecedores AS
SELECT p.prd_id, p.prd_nome, f.forn_nome AS fornecedor
FROM produtos p
LEFT JOIN produto_fornecedor pf ON p.prd_id = pf.pf_prod_id
LEFT JOIN fornecedores f ON pf.pf_forn_id = f.forn_id;

-- Crie a View de Produtos, Fornecedores e Marcas
CREATE VIEW produtos_fornecedores_marcas AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome AS marca, f.forn_nome AS fornecedor
FROM produtos p
LEFT JOIN marcas m ON p.prd_marcn_irl = m.mrc_id
LEFT JOIN produto_fornecedor pf ON p.prd_id = pf.pf_prod_id
LEFT JOIN fornecedores f ON pf.pf_forn_id = f.forn_id;

-- Crie a View de Produtos com Estoque Abaixo do Mínimo
CREATE VIEW produtos_estoque_baixo AS
SELECT prd_id, prd_nome, prd_qtd_estoque, prd_estoque_minimo
FROM produtos
WHERE prd_qtd_estoque < prd_estoque_minimo;

-- Adicione o Campo Data de Validade e Insira Novos Produtos
ALTER TABLE produtos ADD COLUMN prd_data_validade DATE;
INSERT INTO produtos (prd_nome, prd_data_validade) VALUES
    ('Produto1', '2023-12-31'),
    ('Produto2', '2024-06-30');

-- Crie a View de Produtos com Validade Vencida
CREATE VIEW produtos_validade_vencida AS
SELECT prd_id, prd_nome, prd_data_validade
FROM produtos
WHERE prd_data_validade IS NOT NULL AND prd_data_validade < CURDATE();
