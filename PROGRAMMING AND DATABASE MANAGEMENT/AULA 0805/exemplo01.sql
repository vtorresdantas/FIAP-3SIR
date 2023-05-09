-- Ativar saída de resultados 
set SERVEROUTPUT on;

declare
    v_emp_id number(5) := 1;
    v_last_name varchar(10) := 'Xiuderico';
    v_sal integer not null := 0;
    c_tax constant int := 0;
    v_count int;
    v_date date := sysdate;
    v_first_name employees.first_name%type;
    
begin
    v_count := 0;
    v_count := v_count + 1;
    dbms_output.put_line(v_emp_id);
    dbms_output.put_line(v_last_name);
    dbms_output.put_line(v_sal);
    dbms_output.put_line(v_date);

-- exception
    
    
end;
