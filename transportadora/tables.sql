CREATE TABLE apolice (
 num_apolice NUMERIC(10) NOT NULL,
 num_susep CHAR(5) NOT NULL,
 valor_franquia FLOAT(10) NOT NULL,
 valor_premio FLOAT(10) NOT NULL,
 id_pessoa_juridica NUMERIC(5) NOT NULL,
 id_cliente CHAR(10),
 num_entrega NUMERIC(10) NOT NULL
);

ALTER TABLE apolice ADD CONSTRAINT PK_apolice PRIMARY KEY (num_apolice,num_susep);


CREATE TABLE categoria (
 id_categoria NUMERIC(5) NOT NULL,
 nome VARCHAR(20) NOT NULL,
 descricao VARCHAR(100)
);

ALTER TABLE categoria ADD CONSTRAINT PK_categoria PRIMARY KEY (id_categoria);


CREATE TABLE cidade (
 cod_ibge NUMERIC(10) NOT NULL,
 nome VARCHAR(75) NOT NULL,
 uf CHAR(2) NOT NULL,
 distancia NUMERIC(5),
 num_entrega NUMERIC(10)
);

ALTER TABLE cidade ADD CONSTRAINT PK_cidade PRIMARY KEY (cod_ibge);


CREATE TABLE cliente (
 id_cliente CHAR(10) NOT NULL,
 tipo_dliente CHAR(2) NOT NULL,
 nome VARCHAR(100) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT PK_cliente PRIMARY KEY (id_cliente);


CREATE TABLE dependente (
 id_dependente NUMERIC(5) NOT NULL,
 nome VARCHAR(100) NOT NULL,
 idade VARCHAR(3) NOT NULL,
 data_nascimento DATE
);

ALTER TABLE dependente ADD CONSTRAINT PK_dependente PRIMARY KEY (id_dependente);


CREATE TABLE endereco (
 id_endereco NUMERIC(5) NOT NULL,
 id_cliente CHAR(10) NOT NULL,
 rua VARCHAR(10) NOT NULL,
 complemento VARCHAR(20),
 bairro VARCHAR(50) NOT NULL,
 cidade VARCHAR(50) NOT NULL,
 cep CHAR(8) NOT NULL,
 numero NUMERIC(10) NOT NULL
);

ALTER TABLE endereco ADD CONSTRAINT PK_endereco PRIMARY KEY (id_endereco,id_cliente);


CREATE TABLE entrega (
 num_entrega NUMERIC(10) NOT NULL,
 valor_total FLOAT(10) NOT NULL,
 data_saida DATE NOT NULL,
 data_chegada DATE NOT NULL,
 valor_entrega FLOAT(10) NOT NULL,
 cod_ibge NUMERIC(10) NOT NULL,
 id_cliente CHAR(10) NOT NULL,
 id_caminhao NUMERIC(3),
 num_apolice NUMERIC(10),
 num_susep CHAR(5)
);

ALTER TABLE entrega ADD CONSTRAINT PK_entrega PRIMARY KEY (num_entrega);


CREATE TABLE item (
 id_item NUMERIC(10) NOT NULL,
 valor_unitario FLOAT(10) NOT NULL,
 peso FLOAT(10),
 dimensao FLOAT(10),
 descricao VARCHAR(10),
 id_categoria NUMERIC(5) NOT NULL
);

ALTER TABLE item ADD CONSTRAINT PK_item PRIMARY KEY (id_item);


CREATE TABLE item_entrega (
 id_item NUMERIC(10) NOT NULL,
 num_entrega NUMERIC(10) NOT NULL,
 valor_declarado NUMERIC(10)
);

ALTER TABLE item_entrega ADD CONSTRAINT PK_item_entrega PRIMARY KEY (id_item,num_entrega);


CREATE TABLE motorista (
 id_motorista NUMERIC(2) NOT NULL,
 nome VARCHAR(100) NOT NULL,
 salario NUMERIC(10),
 data_nascimento DATE,
 cnh NUMERIC(15) NOT NULL
);

ALTER TABLE motorista ADD CONSTRAINT PK_motorista PRIMARY KEY (id_motorista);


CREATE TABLE motorista_entrega (
 id_motorista NUMERIC(2) NOT NULL,
 num_entrega NUMERIC(10) NOT NULL,
 quantidade CHAR(3)
);

ALTER TABLE motorista_entrega ADD CONSTRAINT PK_motorista_entrega PRIMARY KEY (id_motorista,num_entrega);


CREATE TABLE pedido (
 id_pedido NUMERIC(10) NOT NULL,
 data_pedido DATE,
 valor_pedido NUMERIC(10),
 num_entrega NUMERIC(10) NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT PK_pedido PRIMARY KEY (id_pedido);


CREATE TABLE pessoa_fisica (
 id_pessoa_fisica NUMERIC(5) NOT NULL,
 id_cliente CHAR(10) NOT NULL,
 cpf CHAR(11) NOT NULL,
 rg CHAR(10),
 data_nascimento DATE NOT NULL
);

ALTER TABLE pessoa_fisica ADD CONSTRAINT PK_pessoa_fisica PRIMARY KEY (id_pessoa_fisica,id_cliente);


CREATE TABLE pessoa_juridica (
 id_pessoa_juridica NUMERIC(5) NOT NULL,
 id_cliente CHAR(10) NOT NULL,
 cnpj CHAR(15) NOT NULL,
 inscricao_estadual NUMERIC(10)
);

ALTER TABLE pessoa_juridica ADD CONSTRAINT PK_pessoa_juridica PRIMARY KEY (id_pessoa_juridica,id_cliente);


CREATE TABLE seguradora (
 num_susep CHAR(5) NOT NULL,
 nome VARCHAR(50) NOT NULL
);

ALTER TABLE seguradora ADD CONSTRAINT PK_seguradora PRIMARY KEY (num_susep);


CREATE TABLE telefone (
 num_telefone CHAR(11) NOT NULL,
 ddd NUMERIC(10) NOT NULL,
 numero NUMERIC(10) NOT NULL,
 descricao VARCHAR(10),
 id_cliente CHAR(10) NOT NULL
);

ALTER TABLE telefone ADD CONSTRAINT PK_telefone PRIMARY KEY (num_telefone);


CREATE TABLE caminhao (
 id_caminhao NUMERIC(3) NOT NULL,
 modelo VARCHAR(20),
 placa VARCHAR(7) NOT NULL,
 ano NUMERIC(4),
 marca VARCHAR(20)
);

ALTER TABLE caminhao ADD CONSTRAINT PK_caminhao PRIMARY KEY (id_caminhao);


ALTER TABLE apolice ADD CONSTRAINT FK_apolice_0 FOREIGN KEY (num_susep) REFERENCES seguradora (num_susep);
ALTER TABLE apolice ADD CONSTRAINT FK_apolice_1 FOREIGN KEY (id_pessoa_juridica,id_cliente) REFERENCES pessoa_juridica (id_pessoa_juridica,id_cliente);
ALTER TABLE apolice ADD CONSTRAINT FK_apolice_2 FOREIGN KEY (num_entrega) REFERENCES entrega (num_entrega);


ALTER TABLE cidade ADD CONSTRAINT FK_cidade_0 FOREIGN KEY (num_entrega) REFERENCES entrega (num_entrega);


ALTER TABLE endereco ADD CONSTRAINT FK_endereco_0 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);


ALTER TABLE entrega ADD CONSTRAINT FK_entrega_0 FOREIGN KEY (cod_ibge) REFERENCES cidade (cod_ibge);
ALTER TABLE entrega ADD CONSTRAINT FK_entrega_1 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE entrega ADD CONSTRAINT FK_entrega_2 FOREIGN KEY (id_caminhao) REFERENCES caminhao (id_caminhao);
ALTER TABLE entrega ADD CONSTRAINT FK_entrega_3 FOREIGN KEY (num_apolice,num_susep) REFERENCES apolice (num_apolice,num_susep);


ALTER TABLE item ADD CONSTRAINT FK_item_0 FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria);


ALTER TABLE item_entrega ADD CONSTRAINT FK_item_entrega_0 FOREIGN KEY (id_item) REFERENCES item (id_item);
ALTER TABLE item_entrega ADD CONSTRAINT FK_item_entrega_1 FOREIGN KEY (num_entrega) REFERENCES entrega (num_entrega);


ALTER TABLE motorista_entrega ADD CONSTRAINT FK_motorista_entrega_0 FOREIGN KEY (id_motorista) REFERENCES motorista (id_motorista);
ALTER TABLE motorista_entrega ADD CONSTRAINT FK_motorista_entrega_1 FOREIGN KEY (num_entrega) REFERENCES entrega (num_entrega);


ALTER TABLE pedido ADD CONSTRAINT FK_pedido_0 FOREIGN KEY (num_entrega) REFERENCES entrega (num_entrega);


ALTER TABLE pessoa_fisica ADD CONSTRAINT FK_pessoa_fisica_0 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);


ALTER TABLE pessoa_juridica ADD CONSTRAINT FK_pessoa_juridica_0 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);


ALTER TABLE telefone ADD CONSTRAINT FK_telefone_0 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);


