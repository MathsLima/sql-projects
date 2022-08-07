-- COMPANHIA AEREA

DROP TABLE companhias_aereas; -- exclui a tabela
 
CREATE TABLE companhias_aereas ( -- cria a tabela
    id_companhia_aerea numeric(4) NOT NULL,
    cod_iata CHAR(2) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    data_fundacao DATE NOT NULL,
    pais VARCHAR(30) NOT NULL,
    quant_aeronaves numeric(4),
    aeroporto_base VARCHAR(30),
    CONSTRAINT pk_companhias_aereas PRIMARY KEY (id_companhia_aerea),
    CONSTRAINT ak_compaer_codiata UNIQUE (cod_iata)
);
 
INSERT INTO companhias_aereas 
VALUES(1,'TAM','JJ',TO_DATE('01/02/1980','dd/mm/yyyy'),'Brasil',118,'Guarulhos');
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves,aeroporto_base)
VALUES(3,'Azul','AD',TO_DATE('05/11/2007','dd/mm/yyyy'),'Brasil',87,'Viracopos');
 
-- select
 
SELECT *
FROM companhias_aereas;
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves,aeroporto_base)
VALUES(4,'Varig','VG',TO_DATE('01/08/1950','dd/mm/yyyy'),'Brasil',NULL,'Salgado Filho');
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais)
VALUES(2,'Gol','G3',TO_DATE('18/09/2001','dd/mm/yyyy'),'Brasil');
 
-- NULL <> ''
 
ALTER TABLE companhias_aereas
MODIFY aeroporto_base DEFAULT 'Guarulhos';
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves)
VALUES(5,'Qatar','QA',TO_DATE('05/05/1980','dd/mm/yyyy'),'Quatar',120);
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves,aeroporto_base)
VALUES(6,'Delta','DL',TO_DATE('01/02/1930','dd/mm/yyyy'),'USA',231,NULL);
 
ALTER TABLE companhias_aereas
ADD tipo_companhia CHAR(1) DEFAULT 'P' NOT NULL;
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves,aeroporto_base,tipo_companhia)
VALUES(7,'American Airlines','AA',TO_DATE('28/11/1932','dd/mm/yyyy'),'USA',300,'Boston','C');
 
DELETE FROM companhias_aereas
WHERE id_companhia_aerea = 7;
 
ALTER TABLE companhias_aereas
ADD CHECK(tipo_companhia IN ('P','G'));
 
ALTER TABLE companhias_aereas
DROP CONSTRAINT chk_compaer_tpcomp;
 
ALTER TABLE companhias_aereas
ADD CONSTRAINT chk_compaer_tpcomp CHECK(tipo_companhia = 'P' OR tipo_companhia = 'G');

-- OU

ALTER TABLE companhias_aereas
ADD CONSTRAINT chk_compaer_tpcomp CHECK(UPPER(tipo_companhia) IN ('P','G'));
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves,aeroporto_base,tipo_companhia)
VALUES(7,'American Airlines','AA',TO_DATE('28/11/1932','dd/mm/yyyy'),'USA',300,'Boston','C');
 
INSERT INTO companhias_aereas(id_companhia_aerea,nome,cod_iata,data_fundacao,pais,quant_aeronaves,aeroporto_base,tipo_companhia)
VALUES(8,'American Airlines','AA',TO_DATE('28/11/1932','dd/mm/yyyy'),'USA',300,'Boston','g');
 