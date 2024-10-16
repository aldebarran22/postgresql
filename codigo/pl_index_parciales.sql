-- indices parciales:
explain
select * from productos where activo=0;

create index idx2productos 
on productos(activo)
where activo=0;

-- desactivar búsqueda secuencial:
set enable_seqscan = false;
set enable_seqscan = true;

explain
select * from productos where activo=1;

explain
select * from productos where descripcion='Cuna para Bebe';

explain
select * from productos where activo=0 order by descripcion;


