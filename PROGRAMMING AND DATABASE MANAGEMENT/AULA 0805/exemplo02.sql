variable b_sal number;

declare
    v_ei number(5) := 100;   
    v_ln employees.last_name%type;
    v_sum employees.salary%type;
    v_sal employees.salary%type;
begin
    select last_name, salary
    into v_ln, v_sal
    from employees
    where employee_id = v_ei;
    :b_sal := v_sal;
    
    dbms_output.put_line(v_ln||' '||v_sal);
    
    select sum(salary)
    into v_sum
    from employees;
    
    dbms_output.put_line('O somatório é de:'||' '||v_sum);
    
    
    
end;
/
print b_sal;
