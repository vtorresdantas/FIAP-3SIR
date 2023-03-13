-- Exerc�cio 1 --

select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK';

-- Exerc�cio 2 -

select country_id as CO, country_name
from countries
minus
select c.country_id as CO, c.country_name
from countries c join locations l
on c.country_id = l.country_id
join departments d
on l.location_id = d.location_id;

-- Exerc�cio 3 --

select job_id, department_id
from employees
where department_id = 10 
or department_id = 50 
or department_id = 20;

-- Exerc�cio 4 --

SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history;

-- Exerc�cio 5 --

select last_name, department_id, null
from employees
union
select null, department_id, department_name
from departments;


