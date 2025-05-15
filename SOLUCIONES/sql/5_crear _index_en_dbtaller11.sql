-- Crear indices multicols.

create index idxclientes on clientes (nombre, apellido);

explain
select * from clientes where nombre='Alejandro';


explain
select * from clientes where nombre='Alejandro' and apellido='Guzmán';

explain
select * from clientes where apellido='Guzmán';