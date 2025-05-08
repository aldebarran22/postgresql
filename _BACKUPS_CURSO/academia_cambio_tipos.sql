
-- Crear una tabla nueva en funcion de una consulta:

-- Todas las clases
select * from ac_clases;

-- Prueba convertir de texto a integer
select cast('1' as integer);

-- Convertir todas las columnas de una tabla a integer, las originales son varchar
select cast(codalumn as integer) as codalum, 
cast(codprofe as integer) as codprofe, 
cast(codasig as integer) as codaasig,
cast(aula as integer) as aula
from ac_clases;

select current_date as "fecha-actual";


select count(*) from ac_clases2 where codprofe = 1;

delete from ac_profesores where codprof = 1;

