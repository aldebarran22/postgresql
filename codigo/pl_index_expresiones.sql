-- Indices basados en expresiones:
explain 
select * from productos where descripcion = 'Cuna para Bebe';

explain 
select * from productos where descripcion < 'Cuna para Bebe';

explain 
select * from productos where lower(descripcion)='cuna para bebe';

explain 
select * from productos where upper(descripcion)='CUNA PARA BEBE';

-- Definir un índice basado en una expresión:
create index idx2productos on productos(lower(descripcion));

-- Anular el modo secuencial: para forzar a que utilice el índice
set enable_seqscan = false;
set enable_seqscan = true;