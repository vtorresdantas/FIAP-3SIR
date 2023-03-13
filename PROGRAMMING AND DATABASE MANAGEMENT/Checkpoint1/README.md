# Checkpoint 1

- Capítulo 01 - Subconsultas
- Capítulo 02 - Operações de Conjuntos

# BD-barcelos
![image](https://user-images.githubusercontent.com/82169520/224718953-e21fd666-c7fc-456e-95d6-c165684cb531.png)

## Subconsultas

![image](https://user-images.githubusercontent.com/82169520/224714473-ddada970-fa72-420d-86de-df7db8c96d8f.png)
É possível inserir a subconsulta em várias cláusulas SQL, inclusive nestas:
Cláusula WHERE
Cláusula HAVING
Cláusula FROM
Na sintaxe:
operator inclui uma condição de comparação, como >, = ou
IN
Observação: As condições de comparação estão incluídas em
duas classes: operadores de uma única linha (>, =, >=, <, <>, <=) e de
várias linhas (IN, ANY, ALL)

![image](https://user-images.githubusercontent.com/82169520/224715414-20d5a836-580a-4c5a-baac-d1b72970fefe.png)

### Operador Having 
![image](https://user-images.githubusercontent.com/82169520/224715949-728deb66-6b10-40f1-be42-15364a470357.png)

Resumindo, WHERE é usado para filtrar linhas antes do agrupamento, enquanto HAVING é usado para filtrar grupos após o agrupamento.
É obrigatório usar a cláusula GROUP BY quando se usa a cláusula HAVING em uma consulta SQL. A cláusula GROUP BY é usada para agrupar as linhas de dados com base em uma ou mais colunas, enquanto a cláusula HAVING é usada para filtrar os resultados da consulta com base em condições que se aplicam aos grupos resultantes.

A Cláusula HAVING com Subconsultas
É possível usar subconsultas tanto na cláusula WHERE como na cláusula HAVING. O servidor Oracle executa a subconsulta, e os resultados são retornados para a cláusula HAVING da consulta principal.

![image](https://user-images.githubusercontent.com/82169520/224716277-aeef95f2-5f2b-482e-b11d-49de65f8d5ed.png)

### Operador In

IN é um operador para especificar vários valores em uma cláusula WHERE. Com ele podemos verificar se determinada coluna está sendo mencionada em um determinado grupo de valores, seja ele definido manualmente ou através de subquerys.

SELECT last_name, salary, department_id
FROM employees
WHERE salary IN (2500, 4200, 4400, 6000, 7000, 8300,
8600, 17000);

### Operador Any

O operador ANY (e seu sinônimo, o operador SOME) compara um valor a cada valor retornado por uma subconsulta.
![image](https://user-images.githubusercontent.com/82169520/224717070-01c5c204-c4d4-4e6c-932a-0845c43099ac.png)

### Operador All

O operador ALL compara um valor com todos os valores retornados por uma subconsulta. 
![image](https://user-images.githubusercontent.com/82169520/224717444-ac923087-230a-4fc0-ab2a-e6acb8c4fda4.png)

### Valores Nulos em uma Subconsulta
![image](https://user-images.githubusercontent.com/82169520/224717966-457fa63e-8e95-48b2-a14c-0fe9bfdda3fc.png)

A instrução SQL do slide tenta exibir todos os funcionáriossem subordinados. Logicamente, essa instrução deveria ter retornado 12 linhas. No entanto, ela não retorna nenhuma linha. Um dos valores retornados pela consulta interna é um valor nulo e, por isso, a consulta inteira não retorna nenhuma linha. O motivo é que todas as condições que comparam um valor nulo resultam em um valor nulo. Dessa forma, sempre que houver a possibilidade de valores nulos integrarem o conjunto de resultados de uma subconsulta, não use o operador NOT IN. Esse operador corresponde a <> ALL. Observe que o valor nulo como parte do conjunto de resultados de uma subconsulta não representa um problema se você usa o operador IN. Esse perador corresponde a =ANY. Por exemplo, para exibir os funcionários com ubordinados, use a seguinte instrução SQL:SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id IN
(SELECT mgr.manager_id
FROM employees mgr);

Como alternativa, é possível incluir uma cláusula WHERE na subconsulta para exibir
todos os funcionários sem subordinados:
SELECT last_name FROM employees
WHERE employee_id NOT IN
(SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL);

#### Exercicio 01 
O departamento de recursos humanos precisa de uma consulta que solicite ao usuário o sobrenome de um funcionário. A consulta exibe o sobrenome e a data de admissão de todos os funcionários no mesmo departamento do funcionário cujo nome foi fornecido (excluindo esse funcionário). Por exemplo, se o usuário informar Zlotkey, serão exibidos todos os funcionários que trabalham com Zlotkey (excluindo ele próprio).
&& - Duas vezes pede e guarda
& - pede o input do user (a janelinha)

SELECT last_name, hire_date
FROM   employees
WHERE  department_id = (SELECT department_id
                        FROM   employees
                        WHERE  last_name = '&&Enter_name')
AND    last_name <> '&Enter_name'; 

ou 
//Janelinha de input
select last_name, hire_date
from employees
where department_id in (
                select department_id
                from employees
                where last_name = initcap('&&v_ei'))
and last_name <> '&v_ei';

### Exercicio 02
Crie um relatório que exiba o número e o sobrenome de todos os funcionários cujo salário é maior que o salário médio. Classifique os resultados em ordem crescente de salário.

SELECT employee_id, last_name, salary
FROM   employees
WHERE  salary > (SELECT AVG(salary)
                 FROM   employees)
ORDER BY salary; 


### Exercicio 03
Crie uma consulta que exiba o número e o sobrenome de todos os funcionários que trabalham em um departamento com funcionários cujos sobrenomes
contêm a letra u. 

SELECT employee_id, last_name
FROM   employees
WHERE  department_id IN (SELECT department_id
                         FROM   employees
                         WHERE  last_name like '%u%');

### Exercicio 07
Modifique a consulta em lab_06_03.sql para exibir o número, o sobrenome,bem como o salário de todos os funcionários que ganham mais que o salário médio e trabalham em um departamento com funcionários cujos sobrenomes contêm a letra u.

SELECT employee_id, last_name, salary
FROM   employees
WHERE  department_id IN (SELECT department_id
                         FROM   employees
                         WHERE  last_name like '%u%')
AND    salary > (SELECT AVG(salary)	
                 FROM   employees);

## Conjuntos

![image](https://user-images.githubusercontent.com/82169520/224731964-54269cc1-86f4-424b-97e8-6263f3ed3bfc.png)
![image](https://user-images.githubusercontent.com/82169520/224732032-69453150-5661-4a5b-ac7b-a7dfac9f9526.png)

### Operador Union
![image](https://user-images.githubusercontent.com/82169520/224732276-c6e0eb24-ada6-40d3-8273-c276d8088ff4.png)

O operador UNION elimina registros duplicados. Se houver registros idênticos nas tabelas EMPLOYEES e JOB_HISTORY, eles serão exibidos apenas uma vez. Na
saída mostrada no slide, observe que o registro para o funcionário com EMPLOYEE_ID 200 aparece duas vezes, já que o valor em JOB_ID é diferente em cada linha.
Considere o seguinte exemplo:

SELECT employee_id, job_id, department_id
FROM employees
UNION
SELECT employee_id, job_id, department_id
FROM job_history;

### Operador Union All
![image](https://user-images.githubusercontent.com/82169520/224732516-c74b267b-44b9-4973-bb5c-38723fdad8dd.png)

Operador UNION ALL
Use o operador UNION ALL para retornar todas as linhas de várias consultas. 
Diretrizes
As diretrizes para UNION e UNION ALL são as mesmas, apenas com duas exceções relativas a UNION ALL:
Ao contrário de UNION, as linhas duplicadas não são eliminadas e, por default, a saída não é classificada.
A palavra-chave DISTINCT não pode ser usada.

Exiba os departamentos anterior e atual de todos os
funcionários.

SELECT employee_id, job_id, department_id
FROM employees
UNION ALL
SELECT employee_id, job_id, department_id
FROM job_history
ORDER BY employee_id;

### Operador INTERSECT
![image](https://user-images.githubusercontent.com/82169520/224733162-f49f1042-f7d7-46c2-8f3e-b20ca3448e7e.png)

Exiba os IDs de funcionário e os IDs de cargo dosnfuncionários que, no momento, estão no mesmo cargo que ocupavam quando foram admitidos pela empresa (ou seja, eles mudaram de cargo, mas agora voltaram para o cargo original).

SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

Use o operador INTERSECT para retornar todas as linhas comuns a várias consultas.
Diretrizes
O número de colunas e os tipos de dados das colunas selecionadas pelas instruções SELECT nas consultas devem ser idênticos em todas as instruções SELECT usadas na consulta. Os nomes das colunas não precisam ser idênticos.
O resultado não é alterado quando é invertida a ordem das tabelas de interseção.
INTERSECT não ignora valores nulos.

### Operador Minus
![image](https://user-images.githubusercontent.com/82169520/224733603-1bcf738a-5d6a-492f-b31e-fef711615244.png)

Use o operador MINUS para exibir as linhas retornadas pela primeira consulta que não estão presentes na segunda consulta (a primeira instrução SELECT subtraída da segunda instrução SELECT).
Diretrizes
O número de colunas e os tipos de dados das colunas selecionadas pelas instruções SELECT nas consultas devem ser idênticos em todas as instruções SELECT usadas na consulta. Os nomes das colunas não precisam ser idênticos. 
Todas as colunas da cláusula WHERE devem estar presentes na cláusula SELECT para que o operador MINUS seja executado.

Exiba os IDs dos funcionários que nunca mudaram
de cargo.
SELECT employee_id,job_id
FROM employees
MINUS
SELECT employee_id,job_id
FROM job_history;


Diretrizes de Operadores de Conjunto
As expressões nas listas de seleção das consultas devem corresponder m número e tipo de dados. As consultas que usam operadores UNION, UNION ALL, INTERSECT e MINUS na cláusula WHERE devem ter o mesmo número e tipo das colunas da lista SELECT. Por exemplo:

SELECT employee_id, department_id
FROM employees
WHERE (employee_id, department_id)
IN (SELECT employee_id, department_id
FROM employees
UNION
SELECT employee_id, department_id
FROM job_history);

A cláusula ORDER BY:
  Só pode aparecer no final da instrução
  Aceitará o nome da coluna, um apelido ou a notação posicional
O nome ou o apelido da coluna, se usado em uma cláusula ORDER BY, deverá originar-se da primeira lista SELECT. É possível usar operadores de conjunto em subconsultas.

### Exercicio 01
O departamento de recursos humanos precisa de uma lista de IDs dos departamentos que não contêm o ID de cargo ST_CLERK. Use os operadores de conjunto para criar esse relatório.

SELECT department_id
FROM   departments
MINUS
SELECT department_id
FROM   employees
WHERE  job_id = 'ST_CLERK';

### Exercicio 02
O departamento de recursos humanos precisa de uma lista de países nos quais não há departamentos. Exiba o ID e o nome dos países. Use os operadores de conjunto para criar esse relatório.

SELECT country_id,country_name
FROM   countries
MINUS
SELECT country_id,country_name
FROM countries
NATURAL JOIN locations
NATURAL JOIN departments;

### Exercicio 03
Produza uma lista de cargos dos departamentos 10, 50 e 20, nessa ordem. Exiba o ID de cargo e o ID de departamento usando operadores de conjunto

COLUMN dummy NOPRINT
SELECT  job_id, department_id, 'x' dummy
FROM    employees
WHERE department_id = 10
UNION
SELECT  job_id, department_id, 'y' dummy
FROM    employees
WHERE department_id = 50
UNION
SELECT  job_id, department_id, 'z' dummy
FROM    employees
WHERE department_id = 20
ORDER BY  dummy;
COLUMN dummy PRINT

### Exercicio 04
Crie um relatório que liste os IDs de funcionário e os IDs de cargo dos funcionários que, no momento, estão no mesmo cargo que ocupavam quando foram admitidos pela empresa (ou seja, eles mudaram de cargo, mas agora voltaram para o cargo original).

SELECT    employee_id,job_id
FROM      employees
INTERSECT 
SELECT   employee_id,job_id
FROM     job_history;

### Exercicio 05
O departamento de recursos humanos precisa de um relatório com as seguintes especificações:
Sobrenome e ID do departamento de todos os funcionários da tabela EMPLOYEES, mesmo que não pertençam a um departamento ID e nome de todos os departamentos da tabela DEPARTMENTS, mesmo que não tenham funcionários
Crie uma consulta composta para isso.

SELECT last_name,department_id,TO_CHAR(null)
FROM   employees
UNION
SELECT TO_CHAR(null),department_id,department_name
FROM  departments;
