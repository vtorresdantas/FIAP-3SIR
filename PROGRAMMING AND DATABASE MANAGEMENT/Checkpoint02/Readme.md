# Checkpoint 02

## Visões – Sequencias – Sinônimos – Índices

Vantagens de Views:

>Restringir o acesso a dados

>Facilitar consultas complexas

>Permitir a independência de dados

>Apresentar exibições diferentes dos mesmos dados

![image](https://user-images.githubusercontent.com/82169520/232550003-14a8163a-cb01-40f0-afc3-d65c2ded98e3.png)

Criando uma View

• Crie a view EMPVU80 com detalhes de funcionários do departamento 80:

CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

• Descreva a estrutura da view usando o comando DESCRIBE:

DESCRIBE empvu80

• Modifique a view EMPVU80 usando a cláusula CREATE OR REPLACE VIEW. Adicione um apelido para cada nome de coluna:

CREATE OR REPLACE VIEW empvu80
(id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' '
|| last_name, salary, department_id
FROM employees
WHERE department_id = 80;

• Crie uma view complexa que contenha functions de rupo para exibir valores de duas tabelas:

CREATE VIEW dept_sum_vu
(name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
MAX(e.salary),AVG(e.salary)
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name;


![image](https://user-images.githubusercontent.com/82169520/232560801-df60d6eb-4d3c-4b88-bdd4-86fdf090fa65.png)
![image](https://user-images.githubusercontent.com/82169520/232560891-2466e38a-acc3-4cbf-b12e-7fe9c03f7b6b.png)
![image](https://user-images.githubusercontent.com/82169520/232560907-2c9cb716-491f-49cc-ba2a-faa43cd53b40.png)
![image](https://user-images.githubusercontent.com/82169520/232561028-f39c61fc-88d0-4c57-936f-23c699f861ae.png)
![image](https://user-images.githubusercontent.com/82169520/232561201-bead3403-d965-48bb-93bc-5d48d136bb43.png)
![image](https://user-images.githubusercontent.com/82169520/232561263-75dcbe3a-89b0-44d7-b688-24785626661f.png)

• Crie uma sequência denominada DEPT_DEPTID_SEQ a ser usada para a chave primária da tabela DEPARTMENTS.
CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 120
MAXVALUE 9999
NOCACHE
NOCYCLE;

![image](https://user-images.githubusercontent.com/82169520/232565771-99802763-2b77-494e-b55c-c80b1eb1843c.png)

Regras de Uso de NEXTVAL e CURRVAL

Você pode usar NEXTVAL e CURRVAL nos seguintes contextos:

Lista SELECT de uma instrução SELECT que não faz parte de uma subconsulta

Lista SELECT de uma subconsulta em uma instrução INSERT

Cláusula VALUES de uma instrução INSERT

Cláusula SET de uma instrução UPDATE

Você não pode usar NEXTVAL e CURRVAL nos seguintes contextos:

Lista SELECT de uma view

Instrução SELECT com a palavra-chave DISTINCT

Instrução SELECT com as cláusulas GROUP BY, HAVING ou ORDER BY

Subconsulta em uma instrução SELECT, DELETE ou UPDATE

Expressão DEFAULT em uma instrução CREATE TABLE ou ALTER TABLE

Para obter mais informações, consulte "Pseudocolumns" e "CREATE SEQUENCE"
no manual Oracle SQL Reference. 

![image](https://user-images.githubusercontent.com/82169520/232565911-5e19e326-8979-4c9c-860f-13233e40ea94.png)
![image](https://user-images.githubusercontent.com/82169520/232566006-39f24589-b635-4797-b59a-c0912df646ba.png)




