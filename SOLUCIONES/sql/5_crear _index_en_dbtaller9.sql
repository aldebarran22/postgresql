explain
select * from productos where descripcion = 'Cuna para Bebe';

explain
select * from productos where lower(descripcion) = 'cuna para bebe';

-- Crear el indice de la expresión:
create index idx2productos on productos(lower(descripcion));

set enable_seqscan = false;