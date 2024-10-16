-- Consultas de Acción

-- Crear tablas a partir de consultas:
drop table tbpaises; -- Intenta borrar si no existe da error
drop table if exists tbpaises; -- La borra si existe, si no existe NO da error

-- Crear la tabla, si existe : Da error!
create table tbpaises as 
(select distinct paisdestinatario as pais from tbpedidos order by 1);

-- Crear la tabla si no existe:
create table if not exists tbpaises as 
(select distinct paisdestinatario as pais from tbpedidos order by 1);


select distinct paisdestinatario as pais from tbpedidos order by 1;


Select nspname from pg_catalog.pg_namespace;
select * from  information_schema;

Select * from pg_catalog.pg_tables
where schemaname = 'public';

-- Crear una tabla de pedidos de Alemania:
drop table if exists tbpealemania; -- si no existe no da error;
create table if not exists tbpeAlemania as 
(select *
from public.tbpedidos pe
where paisdestinatario='Alemania');

