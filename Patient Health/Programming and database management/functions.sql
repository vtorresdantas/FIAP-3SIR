/*
88415 – VITOR TORRES DANTAS
88430 – MATHEUS DE OLIVEIRA
*/

-- Procedimento para atualizar o tempo no hospital para pacientes elegíveis
CREATE OR REPLACE PROCEDURE update_time_in_hospital (
 p_last_change_date IN DATE,
 p_time_in_hospital IN NUMBER)
IS
 l_eligible BOOLEAN;
 l_sql_count INTEGER := 0;
BEGIN
 -- Percorre os pacientes com a data de última mudança fornecida
 FOR patients_rec IN (
   SELECT encounter_id
   FROM diabetes
   WHERE TRUNC(last_change_date) = p_last_change_date
 )
 LOOP
   DBMS_OUTPUT.PUT_LINE('PACIENTE: ' || patients_rec.encounter_id);

   -- Verifica a elegibilidade do paciente
   check_eligibility(
     patients_rec.encounter_id,
     p_time_in_hospital,
     l_eligible
   );

   -- Se elegível, atualiza o tempo no hospital
   IF l_eligible THEN
     UPDATE diabetes
     SET time_in_hospital = time_in_hospital + p_time_in_hospital
     WHERE encounter_id = patients_rec.encounter_id;
     
     -- Incrementa a contagem de linhas atualizadas
     l_sql_count := l_sql_count + 1;
   END IF;
 END LOOP;

 -- Exibe o número de linhas atualizadas
 DBMS_OUTPUT.PUT_LINE(l_sql_count || ' linhas atualizadas');
 
 -- Confirma as alterações
 COMMIT;
END update_time_in_hospital;
/

select * from table(dbms_xplan.display_cursor(sql_id=>'5qxsqtp8kdm0d', format=>'ALLSTATS LAST'));


-- Procedimento para verificar a elegibilidade de um paciente
CREATE OR REPLACE PROCEDURE check_eligibility (
 p_encounter_id IN NUMBER,
 p_time_in_hospital IN NUMBER,
 p_is_eligible OUT BOOLEAN)
IS
 l_encounter_id NUMBER;
BEGIN
 -- Verifica se o paciente é elegível com base no tempo no hospital
 SELECT encounter_id
 INTO l_encounter_id
 FROM diabetes
 WHERE encounter_id = p_encounter_id
 AND time_in_hospital + p_time_in_hospital < 14;

 -- Define o status de elegibilidade
 p_is_eligible := TRUE;

 EXCEPTION
   WHEN NO_DATA_FOUND THEN
   -- Se nenhum dado for encontrado, define a elegibilidade como falsa
   p_is_eligible := FALSE;
END;
/

-- Habilita a saída para o console do servidor
SET SERVEROUT ON;

-- Limpa a tela
CL SCR;

-- Executa o procedimento update_time_in_hospital com parâmetros específicos
EXEC update_time_in_hospital (
  p_last_change_date => TO_DATE('10-NOV-2023', 'DD-MON-YYYY'),
  p_time_in_hospital => 8
);
