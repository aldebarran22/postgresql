-- Pruebas con tablespaces:

show data_directory;

-- los tablespaces:
select spcname from pg_tablespace;

-- El espacio:
select pg_size_pretty(pg_tablespace_size('datos_bd'));
select pg_size_pretty(pg_tablespace_size('pg_default'));

set default_tablespace = datos_bd;

create table tabla2(id serial primary key, nombre varchar(30));
create index idx1 on tabla2(nombre);

show default_tablespace;
set default_tablespace to pg_default;

