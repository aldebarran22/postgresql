

/*
Proceso de creación de una tabla de países y sustitución del 
paisdestinatario en la tabla de pedidos por una clave foránea de la tabla de paises.
*/

drop table if exists tbpedidos2;
drop table if exists tbpaises;

-- Obtener una copia de la tabla de pedidos: tbpedidos2, copiar datos y estructura:
create table tbpedidos2 as (select * from tbpedidos);
--create table tbpedidos2 as table tbpedidos;

-- Crear la tabla de paises: la PK que sea un campo serial.
create table tbpaises (
	id serial primary key,
	nombre varchar(20)
);

-- Sustituir "EspaÃ±a" por España en la tabla pedidos

-- Copiar los paises a la tabla de tbpaises sin repetidos: