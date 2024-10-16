/*
Escribir un módulo de PL que realice las siguientes tareas:
0- Obtener una copia de la tabla de pedidos: tbpedidos_copia
1- Crear una tabla de países (id serial PK y pais varchar). 
2- Rellenar la tabla de paises con los países que hay en pedidos pero sin repetidos
3- Crear una nueva columna en tbpedidos que se llame: idpais (FK), integer
4- Actualizar la columna idpais en la tabla de tbpedidos utilizando tbpaises.
5- Borrar la columna paisdestinatario de la tabla de tbpedidos;
*/
do $$
begin
	-- Crear un schema:
	create schema if not exists paises;
	
	-- 0- Obtener una copia de la tabla de pedidos: tbpedidos
	drop table if exists paises.tbpedidos;
	create table paises.tbpedidos as select * from public.tbpedidos;
	--raise info 'Se ha creado la tabla paises.tbpedidos';
	
	--1- Crear una tabla de países (id serial PK y pais varchar). 
	drop table if exists paises.tbpaises;
	create table paises.tbpaises(id serial primary key, pais varchar(25));
	
	--2- Rellenar la tabla de paises con los países que hay en pedidos pero sin repetidos
	insert into paises.tbpaises(pais) select distinct paisdestinatario from paises.tbpedidos;
	
	--3- Crear una nueva columna en tbpedidos que se llame: idpais (FK), integer
	alter table paises.tbpedidos add column idpais integer;
	
	--4- Actualizar la columna idpais en la tabla de tbpedidos utilizando tbpaises.
	update paises.tbpedidos pe 
	set idpais = p.id 
	from paises.tbpaises p where pe.paisdestinatario = p.pais;
	
	--5- Establecer el campo idpais como FK:
	alter table paises.tbpedidos
	add constraint fk_id_pais foreign key (idpais) references paises.tbpaises(id);
	
	--6- Borrar la columna paisdestinatario de la tabla de tbpedidos;
	alter table paises.tbpedidos
	drop column paisdestinatario;

end $$;

-- Prueba con el idpais de los pedidos de paises
select p.pais, count(pe.id) as cuenta
from paises.tbpedidos pe 
inner join paises.tbpaises p on pe.idpais = p.id
group by 1
order by 2 desc;

select pe.paisdestinatario, count(pe.id) as cuenta
from public.tbpedidos pe 
group by 1
order by 2 desc;

update public.tbpedidos set paisdestinatario='España' 
where paisdestinatario='EspaÃ±a';
select distinct paisdestinatario from public.tbpedidos order by 1;
select distinct paisdestinatario from paises.tbpedidos order by 1;
