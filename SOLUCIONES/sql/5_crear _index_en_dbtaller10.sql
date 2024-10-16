-- Comprobar explain con los productos que no están activos
explain
select * from productos where activo=0;

explain
select * from productos where activo=1;

create index idx2productos 
on productos (activo)
where activo = 0;

-- Desactivar la búsqueda secuencial:
set enable_seqscan=false;