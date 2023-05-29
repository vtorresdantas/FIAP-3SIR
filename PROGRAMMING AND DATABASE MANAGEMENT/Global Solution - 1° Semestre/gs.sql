-- RM: 88415 - Vitor Torres Dantas
-- RM: 88430 - Matheus de Oliveira

-- Criação das tabelas

CREATE TABLE CONSUMO AS
SELECT * FROM PF0645.CONSUMO;

CREATE TABLE DESPERDICIO AS
SELECT * FROM PF0645.DESPERDICIO;

CREATE TABLE CULTURAS AS
SELECT * FROM PF0645.CULTURAS;

CREATE TABLE PRODUCAO AS
SELECT * FROM PF0645.PRODUCAO;

CREATE TABLE PAISES AS
SELECT * FROM PF0645.PAISES;

-- Questão 1

drop view aux;

CREATE VIEW aux as
SELECT paises.nome as PAIS, culturas.nome as CULTURA, 
producao.quantidade as PRODUCAO,
consumo.quantidade as CONSUMO, 
desperdicio.quantidade as DESPERDICIO
    FROM CONSUMO
    FULL OUTER JOIN CULTURAS
        on consumo.id_cultura = culturas.id_cultura
     FULL OUTER JOIN PAISES
        on consumo.id_pais = paises.id_pais
    FULL OUTER JOIN PRODUCAO
         on paises.id_pais = producao.id_pais
    FULL OUTER JOIN DESPERDICIO
        on paises.id_pais = desperdicio.id_pais
order by paises.nome;

SELECT PAIS, CULTURA, sum(PRODUCAO) as "PRODUCAO TOTAL", 
sum(CONSUMO) as "CONSUMO TOTAL", sum(DESPERDICIO) as "DESPERDICIO TOTAL"
FROM aux
GROUP BY pais, cultura
order by pais;
  
-- Questão 2

CREATE VIEW CONSUMO_BRASIL AS
SELECT cultura, sum(consumo) as "CONSUMO TOTAL"
FROM AUX
where pais = 'Brasil'
group by pais, cultura
order by cultura;

-- Questão 3

DROP TABLE PRODUCAO_0_7500;

DROP TABLE PRODUCAO_7501_10000;

DROP TABLE PRODUCAO_10001_20000;

CREATE TABLE PRODUCAO_0_7500
AS SELECT * FROM PF0645.PRODUCAO
WHERE 1=2;

CREATE TABLE PRODUCAO_7501_10000
AS SELECT * FROM PF0645.PRODUCAO
WHERE 1=2;

CREATE TABLE PRODUCAO_10001_20000
AS SELECT * FROM PF0645.PRODUCAO
WHERE 1=2;

INSERT FIRST 
    WHEN QUANTIDADE <= 7500 THEN
        INTO PRODUCAO_0_7500 values(id_producao, id_pais, id_cultura, ano, quantidade)
    WHEN QUANTIDADE <= 10000 THEN
        INTO PRODUCAO_7501_10000 values(id_producao, id_pais, id_cultura, ano, quantidade)
    WHEN QUANTIDADE > 10000 THEN
        INTO PRODUCAO_10001_20000 values(id_producao, id_pais, id_cultura, ano, quantidade)
    SELECT id_producao, id_pais, id_cultura, ano, quantidade
FROM PF0645.PRODUCAO;

SELECT * FROM PRODUCAO_0_7500;

SELECT * FROM PRODUCAO_7501_10000;

SELECT * FROM PRODUCAO_10001_20000;

-- Questão 4

drop table consumo_paises;

CREATE TABLE consumo_paises as
SELECT PAIS, SUM(CONSUMO) as "CONSUMO"
FROM AUX
GROUP BY PAIS;

UPDATE consumo_paises
SET consumo = 0
WHERE consumo is null;

DELETE FROM consumo_paises
WHERE pais is null;

WITH CTE_Paises AS (
  SELECT PAIS, CONSUMO, AVG(CONSUMO) OVER () AS MediaConsumo
  FROM consumo_paises
)
SELECT PAIS, CONSUMO
FROM CTE_Paises
WHERE CONSUMO > MediaConsumo;








