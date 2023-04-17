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
![image](https://user-images.githubusercontent.com/82169520/232579338-66851d94-182c-494e-9bf8-c3e1fc6a7f89.png)

![image](https://user-images.githubusercontent.com/82169520/232579504-2e6c9311-e941-400d-a856-7f2f233d6958.png)
![image](https://user-images.githubusercontent.com/82169520/232579641-ae677f86-88f2-4c4f-b643-6b049d18292c.png)
![image](https://user-images.githubusercontent.com/82169520/232579752-1a35a398-ade3-471a-9bf8-2647ae9a1036.png)
![image](https://user-images.githubusercontent.com/82169520/232579989-66f50f03-ec1e-4be5-b363-71e0ff31bbf9.png)
![image](https://user-images.githubusercontent.com/82169520/232580039-90b4d6f9-b8cb-4f32-be9b-0f88fe1f74d9.png)

## Advanced SQL

![image](https://user-images.githubusercontent.com/82169520/232582635-a7c658b6-95da-43c2-8a3d-55e9e18f2cd8.png)

INSERT INTO EMPLOYEES_RETIRED
(employee_id, first_name, last_name, email,
phone_number, hire_date, retired_date, job_id,
salary, commission_pct)
SELECT employee_id, first_name, last_name, email,
phone_number, hire_date, sysdate, job_id,
salary, commission_pct
FROM employees
WHERE employee_id=110

![image](https://user-images.githubusercontent.com/82169520/232582687-cf443461-7b76-4b5f-9109-fac36e5af1db.png)

Transfira para o mesmo departamento do funcionário 130 todos os funcionários que
tem o mesmo cargo do funcionário de código 114
UPDATE employees
SET department_id = (SELECT department_id
FROM employees
WHERE employee_id = 130)
WHERE job_id = (SELECT job_id
FROM employees
WHERE employee_id = 114);

![image](https://user-images.githubusercontent.com/82169520/232582807-c253d05a-c552-46e2-95e1-81aaa359df85.png)

![image](https://user-images.githubusercontent.com/82169520/232583053-9cf98afe-9fe3-4a25-a043-9829db9c5b40.png)

![image](https://user-images.githubusercontent.com/82169520/232583113-c1d7d73f-a616-42dd-ba30-f9748d0f3d0e.png)

![image](https://user-images.githubusercontent.com/82169520/232583484-f61ca9aa-9592-4c6b-b2fe-a0c4fbcad6d8.png)

Limitado pelo When e Then

![image](https://user-images.githubusercontent.com/82169520/232583666-4ccbf85f-c5ae-4950-8994-e14acc63f9e6.png)
![image](https://user-images.githubusercontent.com/82169520/232583697-45f04aaa-6567-4cbb-82b4-52d47197f2a6.png)

Será avaliada cada cláusula WHEN da instrução. Se a primeira cláusula retornar verdade será executará a cláusula INTO correspondente e as cláusulas WHEN subsequentes serão ignoradas.

![image](https://user-images.githubusercontent.com/82169520/232584084-c9b81a25-858f-4c84-b1b3-5aecd4850bf1.png)

A criação de pivô é uma operação onde será realizada uma transformação de forma que cada linha de uma tabela será convertia em várias outras linhas.

![image](https://user-images.githubusercontent.com/82169520/232584595-c89187ee-c40f-4736-9e4f-a6bca78c8e68.png)

• Essa instrução permite atualizar ou inserir dados em uma tabela de acordo com uma condição.
• Caso a linha exista será executada uma atualização senão será executada uma inserção caso a linha seja nova.

### Rollup e Cube

![image](https://user-images.githubusercontent.com/82169520/232584736-eb068363-4d63-4c3b-9916-bb79370ef19d.png)

#### Rollup

* O agrupamento ROLLUP resulta em um conjunto com as linhas agrupadas e os valores de subtotais.

* Além dos resultados regulares de agregação retornados pela cláusula GROUP BY, o operador ROLLUP produz subtotais de grupo

![image](https://user-images.githubusercontent.com/82169520/232585060-ca0842c0-3d14-4484-8958-d28dfb02bcc4.png)

#### Cube

• O agrupamento CUBE resulta em um conjunto com a linhas de ROLLUP e as linhas de tabelas de referência cruzada. Além dos subtotais gerados pela oeprador ROLLUP, o operador CUBE gera subtotais para todas as combinações das dimensões especificada.

![image](https://user-images.githubusercontent.com/82169520/232586568-e0fb4b62-8375-435b-8350-d676474f05f4.png)

#### Função grouping

• A função GROUPING é utilizada com os operadores CUBE ou ROLLUP para indicar qual o grupo que foram um subtotal de uma linha.

• Essa função retorna 1 para indicar que a linha pertence a um determinado grupo e 0 para indicar que a linha não pertence do grupo.

• Vejamos um exemplo a seguir de utilização da função GROUPING.

![image](https://user-images.githubusercontent.com/82169520/232587009-b0c0e687-edea-42d9-8458-5f3a0b88b421.png)


#### Consultas Hierárquicas

• As consultas hierárquicas são utilizadas para recuperar dados baseandose em um relacionamento hierárquico.

• Uma consulta hierárquica utiliza as cláusulas CONNECT BY e STARTWITH

START WITH Determina as linhas-raiz da hierarquia (onde iniciar). Essa cláusulaé obrigatória para uma consulta hierárquica.

CONNECT BY PRIOR Define as colunas que determinam o relacionamento entre linhas mães e filhas. Esta cláusula é obrigatória para uma consulta hierárquica.

![image](https://user-images.githubusercontent.com/82169520/232588649-5e4663b5-46a5-4366-8fd4-fefd4b2c8ddb.png)

#### Clausúla With

![image](https://user-images.githubusercontent.com/82169520/232589306-00959516-6033-4ade-b977-8afeeb6ce233.png)
![image](https://user-images.githubusercontent.com/82169520/232589336-f292e3ef-c6fa-489a-accf-c9e523c8fb42.png)


