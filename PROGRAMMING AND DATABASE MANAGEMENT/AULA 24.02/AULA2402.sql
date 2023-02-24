-- Exercício 1 --

select last_name, salary, job_id
from employees
where employee_id=&v_e5;

select last_name, hire_date, department_id
from employees
where department_id IN  (select department_id
                        from employees
                        where last_name= 'Zlotkey')
                        and last_name <> 'Zlotkey';
                        
select last_name, hire_date, department_id
from employees
where department_id IN  (select department_id
                        from employees
                        where last_name= '&&v_ei')
                        and last_name <> '&v_ei';
                        
-- Exercício 2 --

select employee_id, last_name, salary
from employees
where salary > 
                (select avg(salary)
                from employees)
                order by salary asc;
                
-- Exercício 3 --

select employee_id, last_name, department_id
from employees
where department_id IN (select department_id
                from employees
                where lower(last_name) like '%u%');
                
-- Exercício 4 --

select e.job_id, e.last_name, d.department_id, d.location_id
from employees e join departments d
ON (e.department_id = d.department_id)
where location_id = 1700;

select last_name, department_id, job_id
from employees 
where department_id IN (select department_id
                      from departments
                      where location_id = 1700);

-- Exercício 5 --

select last_name, salary, manager_id, job_id
from employees
where manager_id = 100

select last_name, salary, manager_id, job_id
from employees
where manager_id =
            (select employee_id
            from employees
            where first_name = 'Steven' and last_name = 'King');
            
-- Exercício 6 --

select department_id, last_name, job_id
from employees
where job_id like 'AD%';

-- Exercício 7 --

select employee_id, last_name, salary
from employees
where salary > 
                (select avg(salary)
                from employees) 
and department_id IN 
                (select department_id
                from employees
                where lower(last_name) like '%u%');
                
             
                
            
          


                




                        


