

/*
Proceso de creación de una tabla de países y sustitución del 
paisdestinatario en la tabla de pedidos por una clave foránea de la tabla de paises.
*/

drop table if exists tbpedidos2;
drop table if exists tbpaises;

-- Sustituir "EspaÃ±a" por España en la tabla pedidos
-- select count(*) from tbpedidos where paisdestinatario='EspaÃ±a'; para comprobar cuantos se van a actualizar!
update tbpedidos set paisdestinatario = 'España'  where paisdestinatario='EspaÃ±a';


-- Obtener una copia de la tabla de pedidos: tbpedidos2, copiar datos y estructura:
create table tbpedidos2 as (select * from tbpedidos);
--create table tbpedidos2 as table tbpedidos;

-- Crear la tabla de paises: la PK que sea un campo serial.
create table tbpaises (
	id serial primary key,
	nombre varchar(20)
);


-- Copiar los paises a la tabla de tbpaises sin repetidos:
insert into tbpaises(nombre) select distinct paisdestinatario from tbpedidos order by 1;

-- Añadir una nueva columna idpais en la tabla de tbpedidos2:
alter table tbpedidos2 add column idpais integer;

-- Rellenar la columna idpais en tbpedidos2 con el id correspondiente de la tabla de tbpaises
update tbpedidos2 pe
set idpais = pa.id
from tbpaises pa
where pa.nombre = pe.paisdestinatario;

-- Comprobar si se han actualizado correctamente los paises: tbpedidos2.idpais
-- Contar los registros que no coincide el nombre del país (tbpaises) con el paisdestinatario de tbpedidos2






