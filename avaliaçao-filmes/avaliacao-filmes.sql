--AVALIAÇAO DE FILMES

create table atores (
    id_ator numeric(8) not null,
    nome varchar(100) not null,
    data_nascimento date,
    constraint pk_atores primary key(id_ator)
)
 
create table filmes (
    id_filme numeric(6) not null,
    titulo varchar(150) not null,
    ano_lancamento numeric(4) not null,
    id_estudio texto(1),
    id_genero texto(1) not null,
    constraint pk_filmes primary key(id_filme)
)
 
create table estudios (
    id_estudio numeric(3) not null,
    nome varchar(80) not null,
    cidade varchar(100) not null,
    constraint pk_estudios primary key(id_estudio)
)
 
create table generos (
    id_genero numeric(4) not null,
    nome varchar(50) not null,
    constraint pk_generos primary key(id_genero)
)
 
create table atores_filmes (
    id_ator numeric(8) not null,
    id_filme numeric(6) not null,
    constraint pk_atores_filmes primary key(id_ator, id_filme)
)
 
create table usuarios (
    email varchar(240) not null,
    senha varchar(30) not null,
    constraint pk_usuarios primary key(email)
)
 
create table avaliacoes (
    email varchar(240) not null,
    id_filme numeric(6) not null,
    nota numeric(3,1) not null,
    constraint pk_avaliacoes primary key(email, id_filme)
)
 
alter table filmes
add constraint fk_filmes_estudios
    foreign key(id_estudio) references estudios;
 
alter table filmes
add constraint fk_filmes_generos
    foreign key(id_genero) references generos;
 
alter table atores_filmes
add constraint fk_atorfilm_atores
    foreign key(id_ator) references atores;
    
alter table atores_filmes
add constraint fk_atorfilm_filmes
    foreign key(id_filme) references filmes;
 
alter table avaliacoes
add constraint fk_aval_usuarios
    foreign key(email) references usuarios;
 
alter table avaliacoes
add constraint fk_aval_filmes
    foreign key(id_filme) references usuarios;