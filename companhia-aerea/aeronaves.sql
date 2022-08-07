-- Atividade em aula sobre SQL

-- tabela de modelo de aeronaves

drop table modelos_aeronaves;

create table modelos_aeronaves (
    id_modelos_aeronaves numeric(3) not null,
    nome varchar(50) not null,
    fabricante varchar(50) not null,
    autonomia_maxima numeric(5) not null,
    altitude_maxima numeric(5) not null,
    
    -- especificando a pk
    constraint pk_modelos_aeronaves primary key(id_modelos_aeronaves),
    
    -- valoress da autonomia
    constraint chk_mdlaero_autmax check(autonomia_maxima between 100 and 45000),
    
    -- valores de altitude
     constraint chk_mdlaero_autdmax check(altitude_maxima between 2000 and 8000)
);

insert into modelos_aeronaves(id_modelos_aeronaves, nome, fabricante, autonomia_maxima, altitude_maxima)
values(1, '01', 'phenon', 'embraer', '2000', '2500');

insert into modelos_aeronaves(id_modelos_aeronaves, nome, fabricante, autonomia_maxima, altitude_maxima)
values(2, '02', 'a320', 'airbus', '5000', '3000');

insert into modelos_aeronaves(id_modelos_aeronaves, nome, fabricante, autonomia_maxima, altitude_maxima)
values(3, '03', '747', 'boeing', '1000', '4000');


-- tabela de aeronaves
drop table aeronaves;

create table aeronaves (
    id_aeronaves numeric(3) not null,
    prefixo varchar(8) default 100 not null,
    quant_passageiros numeric(3) not null,    

    -- especificando a pk
    constraint pk_idaero primary key(id_aeronaves),
    
    -- especificando que o prefixo é unico 
    constraint ak_aeroprefix unique(prefixo),
    
    -- especificando a quantidade de passageiros
    constraint chk_aeroqpass check(quant_passageiros between 2 and 800)

);

insert into aeronaves(id_aeronaves, prefixo, quant_passageiros)
values(1, 'ptx100', '150');

insert into aeronaves(id_aeronaves, prefixo, quant_passageiros)
values(2, 'xyz050', '200');

insert into aeronaves(id_aeronaves, prefixo, quant_passageiros)
values(3, 'ptz100', '120');

alter table aeronaves
add id_modelos_aeronaves numeric(3);

update aeronaves
set id_modelos_aeronaves = 1
where id_aeronaves = 1;

-- para deletar um insert
--delete from modelos_aeronaves
--where id_modelos_aeronaves = 1

create table companhia_aerea (
    id_companhia_aerea numeric(4) not null,
    cod_iata char(2) not null,
    nome varchar(80) not null,
    data_fundacao date not null,
    pais varchar(30) not null,
    quant_aeronaves numeric(4),
    aeroporto_base varchar(30),
    
    constraint pk_companhias_aereas primary key(id_companhia_aerea),
    constraint k_compaer_codiata unique (cod_iata)
    );

alter table aeronaves 
add id_companhia_aerea numeric(4);

--exercicio 8
alter table aeronaves
add constraint fk_aero_modaero foreign key (id_modelos_aeronaves) reference modelos_aeronaves;



select * from modelos_aeronaves;
select * from aeronaves; 