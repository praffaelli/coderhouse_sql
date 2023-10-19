---- Criação do banco de dados ----

CREATE DATABASE ecommerce_projeto;

USE ecommerce_projeto;

---- Criação das tabelas ----

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(100),
    ultimo_nome VARCHAR(100),
    cnpj_cliente VARCHAR(18),
    razao_social VARCHAR(200),
    email_cliente VARCHAR(100),
    endereco VARCHAR(200),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    CEP VARCHAR(9));
    
CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade_itens INT,
    valor_item FLOAT,
    endereco_entrega VARCHAR(300),
    descontos DECIMAL(4,2),
    cupons VARCHAR(50),
    valor_total_pedido FLOAT,
    forma_pagamento VARCHAR(50),
    prazo_entrega DATE,
    id_devolucao INT,
    id_transportadora INT);

CREATE TABLE produtos(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    marca_peca VARCHAR(100),
    modelo_peca VARCHAR(50),
    categoria_peca VARCHAR(50),
    valor_produto FLOAT,
    prazo_entrega_peca DATE);

CREATE TABLE estoque(
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    status_estoque VARCHAR(50),
    id_fornecedor INT);

CREATE TABLE fornecedores(
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(200),
    cnpj_fornecedor VARCHAR(18),
    email_fornecedor VARCHAR(100),
    telefone INT,
    data_registro DATE);

CREATE TABLE nota_fiscal(
    id_nota_fiscal INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATETIME,
    valor FLOAT,
    numero_nota_fiscal INT,
    chave_acesso BIGINT,
    id_pedido INT);

CREATE TABLE devolucoes(
    id_devolucao INT AUTO_INCREMENT PRIMARY KEY,
    motivo_devolucao VARCHAR(200),
    forma_estorno VARCHAR(50),
    custo_retirada FLOAT,
    data_solicitacao DATETIME,
    data_conclusao DATETIME);

CREATE TABLE itens_pedidos(
    id_itens_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_pedido INT);

CREATE TABLE transportadora(
    id_transportadora INT AUTO_INCREMENT PRIMARY KEY,
    data_cadastro DATE,
    nome_contato VARCHAR(100),
    email_transportadora VARCHAR(100));

---- Inclusão das FOREIGN KEYS nas tabelas ----
ALTER TABLE pedidos
ADD FOREIGN KEY (id_cliente) REFERENCES ecommerce_projeto.clientes(id_cliente),
ADD FOREIGN KEY (id_produto) REFERENCES ecommerce_projeto.produtos(id_produto),
ADD FOREIGN KEY (id_devolucao) REFERENCES ecommerce_projeto.devolucoes(id_devolucao),
ADD FOREIGN KEY (id_transportadora) REFERENCES ecommerce_projeto.transportadora(id_transportadora);

ALTER TABLE estoque
ADD FOREIGN KEY (id_produto) REFERENCES ecommerce_projeto.produtos(id_produto),
ADD FOREIGN KEY (id_fornecedor) REFERENCES ecommerce_projeto.fornecedores(id_fornecedor);

ALTER TABLE nota_fiscal
ADD FOREIGN KEY (id_pedido) REFERENCES ecommerce_projeto.pedidos(id_pedido);

ALTER TABLE itens_pedidos
ADD FOREIGN KEY(id_produto) REFERENCES ecommerce_projeto.produtos(id_produto),
ADD FOREIGN KEY(id_pedido) REFERENCES ecommerce_projeto.pedidos(id_pedido);







    
    
    