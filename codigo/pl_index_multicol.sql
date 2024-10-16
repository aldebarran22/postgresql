-- Indices multicolumna con dbtaller11

select nombre, count(*) as cuenta
from clientes
group by nombre;

select apellido, count(*) as cuenta
from clientes
group by apellido;

create index idxclientes on clientes(nombre, apellido);
drop index idxclientes;
create index idx2clientes on clientes(apellido, nombre);


--create index idxclientes on clientes(apellido,nombre);

set enable_seqscan=false;

explain
select * from clientes where nombre = 'Alejandro';

explain
select * from clientes where apellido = 'Guzman';

explain
select * from clientes where nombre = 'Alejandro' and apellido='Guzman';

explain
select * from clientes where apellido='Guzman' and nombre = 'Alejandro';
