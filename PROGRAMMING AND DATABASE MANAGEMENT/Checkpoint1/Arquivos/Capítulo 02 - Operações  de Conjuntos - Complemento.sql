--Exemplo 1
drop table tabela_a;
drop table tabela_b;

create table tabela_a
(elementos_a char(1));

insert into tabela_a values ('1');
insert into tabela_a values ('3');
insert into tabela_a values ('5');
insert into tabela_a values ('7');
insert into tabela_a values ('9');
commit;

select elementos_a
from tabela_a;

--Exemplo 2
truncate table tabela_a;

drop table tabela_b;
create table tabela_b
(elementos_b char(1));

insert into tabela_a values ('a');
insert into tabela_a values ('b');
insert into tabela_a values ('c');
insert into tabela_a values ('d');
insert into tabela_a values ('e');
insert into tabela_a values ('f');

insert into tabela_b values ('d');
insert into tabela_b values ('e');
insert into tabela_b values ('f');
insert into tabela_b values ('g');
insert into tabela_b values ('h');
insert into tabela_b values ('i');

commit;

select elementos_a as "União"
from tabela_a
union
select elementos_b
from tabela_b;

--Exemplo 3
select elementos_a as "União Total"
from tabela_a
union all
select elementos_b
from tabela_b
order by 1;

--Exemplo 4
select elementos_a as "Intersecção"
from tabela_a
intersect
select elementos_b
from tabela_b;

--Exemplo 5
select elementos_a as "Subtração"
from tabela_a
minus
select elementos_b
from tabela_b;
-- ATENÇÃO: Em alguns SGBD utilize EXCEPT ao invés de MINUS

--Exemplo 6
truncate table tabela_a;
truncate table tabela_b;
drop table tabela_c;
create table tabela_c
(elementos_c char(1));

insert into tabela_a values ('a');
insert into tabela_a values ('b');
insert into tabela_a values ('c');
insert into tabela_a values ('d');

insert into tabela_b values ('d');
insert into tabela_b values ('e');
insert into tabela_b values ('f');
insert into tabela_b values ('g');

insert into tabela_c values ('c');
insert into tabela_c values ('d');
insert into tabela_c values ('e');
insert into tabela_c values ('h');

commit;

select elementos_a as "Intersecção"
from tabela_a
Intersect
select elementos_b
from tabela_b
Intersect
select elementos_c
from tabela_c;


--Exemplo 7
select elementos_a as "União"
from tabela_a
union
select elementos_b
from tabela_b
union
select elementos_c
from tabela_c;


--Exemplo 8
(select elementos_a
from tabela_a
intersect
select elementos_b
from tabela_b)
minus
select elementos_c
from tabela_c;


--Exemplo 9


