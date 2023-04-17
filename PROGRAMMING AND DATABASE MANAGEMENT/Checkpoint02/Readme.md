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

