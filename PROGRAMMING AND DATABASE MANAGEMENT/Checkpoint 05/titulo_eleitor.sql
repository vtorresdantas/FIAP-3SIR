/*
RM 88415 – Vitor Torres Dantas
RM 88430 – Matheus de Oliveira
RM 89134 – Leandro Teruya
RM 87768 - Kaique Teixeira
*/

SET SERVEROUTPUT ON;

DECLARE
    v_titulo_eleitoral VARCHAR2(12);
    v_seq NUMBER;
    v_uf NUMBER;
    v_dv_1 NUMBER;
    v_dv_2 NUMBER;
    v_calc_dv_1 NUMBER;
    v_calc_dv_2 NUMBER;
    v_resto_1 NUMBER;
    v_resto_2 NUMBER;
BEGIN
    -- Solicitação de input ao usuário
    v_titulo_eleitoral := &input_titulo;

    -- Extração dos componentes do título
    v_seq := TO_NUMBER(SUBSTR(v_titulo_eleitoral, 1, 6));
    v_uf := TO_NUMBER(SUBSTR(v_titulo_eleitoral, 7, 2));
    v_dv_1 := TO_NUMBER(SUBSTR(v_titulo_eleitoral, 9, 1));
    v_dv_2 := TO_NUMBER(SUBSTR(v_titulo_eleitoral, 10, 1));

    -- Cálculo do DV-1
    v_calc_dv_1 := 0;
    FOR i IN 1..LENGTH(v_seq) LOOP
        v_calc_dv_1 := v_calc_dv_1 + TO_NUMBER(SUBSTR(v_seq, i, 1)) * (8 - i);
    END LOOP;
    v_resto_1 := MOD(v_calc_dv_1, 11);
    IF v_resto_1 = 10 THEN
        v_resto_1 := 0;
    END IF;

    -- Cálculo do DV-2
    v_calc_dv_2 := MOD((v_uf * 100 + v_dv_1) * 10 + v_dv_2, 11);
    IF v_calc_dv_2 = 10 THEN
        v_calc_dv_2 := 1;
    END IF;

    -- Verificação dos dígitos verificadores
    IF (v_resto_1 = v_dv_1) AND (v_calc_dv_2 = v_dv_2) THEN
        DBMS_OUTPUT.PUT_LINE('O título de eleitor é válido.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O título de eleitor é inválido.');
    END IF;
END;

