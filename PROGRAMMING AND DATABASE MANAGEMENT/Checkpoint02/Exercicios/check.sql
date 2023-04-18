-- Ex 1

SELECT e.first_name, e.last_name, e.job_id, d.department_name
from employees e JOIN departments d
on e.department_id = d.department_id
START WITH e.last_name = 'Pataballa'
CONNECT BY PRIOR e.manager_id = e.employee_id;

-- Ex 2

WITH 
sum_dpt AS(
SELECT d.department_name, SUM(e.salary) total_dep
FROM  employees e JOIN departments d 
ON e.department_id = d.department_id
GROUP BY  d.department_name),  
                   
avg_dpt AS (SELECT AVG(total_dep) AS dpt_avg FROM sum_dpt)
                 
SELECT *
FROM sum_dpt
WHERE total_dep < (SELECT dpt_avg FROM avg_dpt)
ORDER BY department_name;

                     
-- Ex 3

drop table it_dept_employees purge;
drop table sales_dept_employees purge;
drop table other_dept_employees purge;

create table  it_dept_employees 
(employee_id number(6), first_name varchar(20), last_name varchar(25), email varchar(25));

create table sales_dept_employees
(employee_id number(6), first_name varchar(20), last_name varchar(25), job_id varchar(10));

create table other_dept_employees 
(employee_id number(6), last_name varchar(25), email varchar(25), salary number(8,2), department_name varchar(30));


INSERT FIRST
    WHEN department_name = 'IT' OR job_id = 'AD_VP' THEN
    INTO it_dept_employees VALUES(employee_id, first_name, last_name, email)
    WHEN department_name = 'Sales' OR job_id = 'Executive' THEN
    INTO sales_dept_employees  VALUES(employee_id, first_name, last_name, job_id)
    ELSE
    INTO other_dept_employees  VALUES(employee_id, last_name, email, salary, department_name)
    SELECT e.employee_id, e.first_name, e.last_name, e.email, e.job_id, e.salary, d.department_name 
    FROM employees e INNER JOIN departments d 
    ON e.department_id = d.department_id;

-- Ex 4

drop table dim_Produtos purge;
drop table dim_lojas purge;
drop table fato_vendas;

create table dim_Produtos
(produto_id int,	nome varchar(35), categoria varchar(25));
insert into dim_Produtos values(1,'Tv 4K – 50 Pol.','Eletrônicos');
insert into dim_Produtos values(2,'Camisa de Linho Egípcio','Vestuário');
insert into dim_Produtos values(3,'Notebook i7 – 1TB – 32GB mem','Eletrônicos');
insert into dim_Produtos values(4,'Teclado BlueTooth','Acessórios');
insert into dim_Produtos values(5,'Camisa Polo','Vestuário');

create table dim_lojas
(loja_id	int, nome varchar(15),cidade varchar(25));
insert into dim_lojas values(1,'Loja SP','São Paulo');
insert into dim_lojas values(2,'Loja RJ','Rio de Janeiro');
insert into dim_lojas values(3,'Loja RS','Rio Grande do Sul');

create table fato_vendas
(produto_id int ,loja_id int, data date, quantidade	int, valor_unitario number(6,2));
insert into fato_vendas values(1,1,'11-APR-23',10,100.00);
insert into fato_vendas values(2,2,'12-APR-23',5,50.00);
insert into fato_vendas values(1,3,'13-APR-23',2,100.00);
insert into fato_vendas values(3,1,'14-APR-23',7,80.00);
insert into fato_vendas values(4,2,'15-APR-23',3,20.00);
insert into fato_vendas values(5,3,'16-APR-23',8,60.00);
commit;


SELECT LOJA.nome, PRODUTO.nome, sum(VENDA.valor_unitario * VENDA.quantidade)
from fato_vendas VENDA
inner join dim_Produtos PRODUTO
ON PRODUTO.produto_id = VENDA.produto_id
INNER JOIN dim_lojas LOJA
ON LOJA.Loja_id = VENDA.loja_id
GROUP BY rollup(LOJA.nome, PRODUTO.NOME)
ORDER BY LOJA.nome asc;














