/*
88415 – VITOR TORRES DANTAS
88430 – MATHEUS DE OLIVEIRA
*/

-- Procedimento para atualizar o tempo no hospital para pacientes elegíveis
CREATE OR REPLACE PROCEDURE update_time_in_hospital (
    p_last_change_date IN DATE,
    p_time_in_hospital IN NUMBER
)
IS
    TYPE encounter_id_array IS TABLE OF NUMBER;
    l_encounter_ids encounter_id_array;

    l_eligible BOOLEAN;
    l_sql_count INTEGER := 0;
BEGIN
    -- Busca os encounter_ids em um vetor com Bulk Collect
    SELECT encounter_id
    BULK COLLECT INTO l_encounter_ids
    FROM diabetes
    WHERE TRUNC(last_change_date) = p_last_change_date;

    -- Itera sobre os encounter_ids
    FOR i IN 1..l_encounter_ids.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE('PACIENTE: ' || l_encounter_ids(i));

        -- Verifica a elegibilidade utilizando o procedimento otimizado
        check_eligibility(l_encounter_ids(i), p_time_in_hospital, l_eligible);

        -- Atualiza o tempo de internação se elegível
        IF l_eligible THEN
            UPDATE diabetes
            SET time_in_hospital = time_in_hospital + p_time_in_hospital
            WHERE encounter_id = l_encounter_ids(i);

            l_sql_count := l_sql_count + 1;
        END IF;
    END LOOP;

    -- Exibe a contagem de linhas atualizadas
    DBMS_OUTPUT.PUT_LINE(l_sql_count || ' rows updated');

    -- Comita as alterações
    COMMIT;
END update_time_in_hospital;
/

-- Procedimento para verificar a elegibilidade de um paciente
CREATE OR REPLACE PROCEDURE check_eligibility (
    p_encounter_id IN NUMBER,
    p_time_in_hospital IN NUMBER,
    p_is_eligible OUT BOOLEAN
)
IS
    l_count NUMBER;

BEGIN
    -- Criação de índice composto
    EXECUTE IMMEDIATE 'CREATE INDEX idx_diabetes_encounter_time ON diabetes(encounter_id, time_in_hospital)';

    -- Verifica se há registros elegíveis com o índice composto criado
    SELECT COUNT(*)
    INTO l_count
    FROM diabetes
    WHERE encounter_id = p_encounter_id
      AND time_in_hospital + p_time_in_hospital < 14;

    -- Define se é elegível baseado na contagem
    p_is_eligible := l_count > 0;
END;
/



