-- RM: 88415 - Vitor Torres Dantas
-- RM: 88430 - Matheus de Oliveira

-- Criação das tabelas

SELECT * FROM PF0645.PAISES;

SELECT * FROM PF0645.CONSUMO;

SELECT * FROM PF0645.DESPERDICIO;

SELECT * FROM PF0645.PRODUCAO;

SELECT * FROM PF0645.CULTURAS;

-- Questão 1

SELECT paises.nome AS PAIS, cultura.nome as CULTURA, SUM(producao.quantidade) AS PRODUCAO_TOTAL, 
SUM(consumo.quantidade) AS CONSUMO_TOTAL, SUM(desperdicio.quantidade) AS DESPERDICIO_TOTAL

    FROM PF0645.CONSUMO consumo
    JOIN PF0645.PAISES paises
    ON consumo.id_pais = paises.id_pais
    
    JOIN PF0645.culturas cultura 
    ON consumo.id_cultura = cultura.id_cultura
    
    LEFT JOIN PF0645.PRODUCAO producao
    ON producao.id_pais = paises.id_pais
    and producao.id_cultura = cultura.id_cultura
    
    LEFT JOIN PF0645.desperdicio desperdicio
    ON desperdicio.id_pais = paises.id_pais
    and desperdicio.id_cultura = cultura.id_cultura
      
GROUP BY rollup(paises.nome, cultura.nome)
ORDER BY paises.nome, cultura.nome;


-- Questão 2

CREATE OR REPLACE VIEW CONSUMO_BRASIL AS
SELECT cultura.nome as CULTURA,
SUM(consumo.quantidade) AS CONSUMO_TOTAL

    FROM PF0645.PAISES paises
    JOIN PF0645.CONSUMO consumo 
    ON consumo.id_pais = paises.id_pais
    
    JOIN PF0645.culturas cultura 
    ON consumo.id_cultura = cultura.id_cultura
    
where paises.nome = 'Brasil'
GROUP BY paises.nome, cultura.nome;

SELECT * FROM CONSUMO_BRASIL;

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

CREATE OR REPLACE VIEW CONSUMO_PAISES AS
SELECT paises.nome AS PAIS, SUM(consumo.quantidade) AS CONSUMO_TOTAL

    FROM PF0645.CONSUMO consumo
    JOIN PF0645.PAISES paises
    ON consumo.id_pais = paises.id_pais
         
GROUP BY paises.nome
ORDER BY paises.nome;

WITH CTE_Media_Paises AS (
  SELECT PAIS, CONSUMO_TOTAL, AVG(CONSUMO_TOTAL) OVER () AS MediaConsumo
  FROM consumo_paises
)
SELECT PAIS, CONSUMO_TOTAL
FROM CTE_Media_Paises
WHERE CONSUMO_TOTAL > MediaConsumo;








