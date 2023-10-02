/*
RM 88415 – Vitor Torres Dantas
RM 88430 – Matheus de Oliveira
*/
SET SERVEROUTPUT ON;

-- Criação da função para validar CNPJ
CREATE OR REPLACE FUNCTION validar_cnpj(p_cnpj VARCHAR2) RETURN VARCHAR2 IS
    v_cnpj VARCHAR2(14) := TRIM(REGEXP_REPLACE(p_cnpj, '[^0-9]', ''));
    v_digito_verificador CHAR(1);
    v_soma NUMBER := 0;
    v_mult NUMBER := 2;
BEGIN
    -- Verifica se o CNPJ tem 14 dígitos
    IF LENGTH(v_cnpj) <> 14 THEN
        RETURN 'Inválido';
    END IF;

    -- Verifica se todos os dígitos são iguais (condição inválida)
    IF REGEXP_LIKE(v_cnpj, '^(\d)\1{13}$') THEN
        RETURN 'Inválido';
    END IF;

    -- Calcula o primeiro dígito verificador
    FOR i IN REVERSE 1..12 LOOP
        v_soma := v_soma + TO_NUMBER(SUBSTR(v_cnpj, i, 1)) * v_mult;
        v_mult := v_mult + 1;
        IF v_mult > 9 THEN
            v_mult := 2;
        END IF;
    END LOOP;
    v_digito_verificador := CASE MOD(11 - MOD(v_soma, 11), 10)
                             WHEN 10 THEN '0'
                             ELSE TO_CHAR(MOD(11 - MOD(v_soma, 11), 10))
                             END;

    -- Verifica se o primeiro dígito verificador é igual ao penúltimo caractere do CNPJ
    IF v_digito_verificador = SUBSTR(v_cnpj, 13, 1) THEN
        -- Calcula o segundo dígito verificador
        v_soma := 0;
        v_mult := 2;
        FOR i IN REVERSE 1..13 LOOP
            v_soma := v_soma + TO_NUMBER(SUBSTR(v_cnpj, i, 1)) * v_mult;
            v_mult := v_mult + 1;
            IF v_mult > 9 THEN
                v_mult := 2;
            END IF;
        END LOOP;
        v_digito_verificador := CASE MOD(11 - MOD(v_soma, 11), 10)
                                 WHEN 10 THEN '0'
                                 ELSE TO_CHAR(MOD(11 - MOD(v_soma, 11), 10))
                                 END;

        -- Verifica se o segundo dígito verificador é igual ao último caractere do CNPJ
        IF v_digito_verificador = SUBSTR(v_cnpj, 14, 1) THEN
            RETURN 'Válido';
        END IF;
    END IF;

    RETURN 'Inválido';
END validar_cnpj;
/

-- Programa principal
DECLARE
    v_cnpj_input VARCHAR2(14);
    v_validacao VARCHAR2(10);
BEGIN
    -- Solicita um CNPJ como entrada
    v_cnpj_input := '&cnpj_input'; -- O usuário será solicitado a inserir o CNPJ

    -- Chama a função para validar o CNPJ
    v_validacao := validar_cnpj(v_cnpj_input);

    -- Exibe o resultado
    DBMS_OUTPUT.PUT_LINE('O CNPJ inserido é ' || v_validacao);
END;
/

GRANT EXECUTE ON validar_cnpj TO PF0645;


