-- Habilita a saída para o console do servidor
SET SERVEROUT ON;

-- Limpa a tela
CL SCR;

-- Executa o procedimento update_time_in_hospital com parâmetros específicos
EXEC update_time_in_hospital (
  p_last_change_date => TO_DATE('10-NOV-2023', 'DD-MON-YYYY'),
  p_time_in_hospital => 8
);

SET SERVEROUT ON
DECLARE
    t0 NUMBER := DBMS_UTILITY.get_time;
    v_idx NUMBER := 1;
BEGIN
    update_time_in_hospital (
        p_last_change_date => TO_DATE('10-NOV-2023', 'DD-MON-YYYY'),
        p_time_in_hospital => 1
    );
    DBMS_OUTPUT.put_line(
        'Tempo: ' || ((DBMS_UTILITY.get_time - t0) / 100) || ' segundos'
    );
END;
/

