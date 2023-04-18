-- exercício 1

SELECT e.first_name, e.last_name, e.job_id, d.department_name
from employees e JOIN departments d
on e.department_id = d.department_id
START WITH e.last_name = 'Pataballa'
CONNECT BY PRIOR e.manager_id = e.employee_id;
