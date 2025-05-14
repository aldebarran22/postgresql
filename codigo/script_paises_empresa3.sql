

create or replace function existeFK(tablaOrigen text, tablaReferenciada text, nombreFK text) returns boolean as $$
declare
filas numeric;

begin

select count(*) into filas from (
	SELECT conname AS nombre_fk, conrelid::regclass AS tabla_origen,
       confrelid::regclass AS tabla_referenciada
	FROM pg_constraint
	WHERE contype = 'f' AND conrelid = 'tbdetallespedidos'::regclass and conname = 'fk-pedidos')
where nombre_fk = nombreFK and tabla_origen::text = tablaOrigen and tabla_referenciada::text = tablaReferenciada;

return filas > 0;
end;
$$
language plpgsql;


--select existeFK('tbdetallespedidos', 'tbpedidos2', 'fk-pedidos');


/*
Proceso de creación de una tabla de países y sustitución del 
paisdestinatario en la tabla de pedidos por una clave foránea de la tabla de paises.
*/


do $$
begin
	if  existeFK('tbdetallespedidos', 'tbpedidos2', 'fk-pedidos') then
		-- Existe la FK con detalles de pedido.
	
		-- 1) Borrar la FK
		alter table tbdetallespedidos drop constraint "fk-pedidos";
			
	end if;
	
	-- 2) Borrar la tabla tbpedidos2:
	drop table if exists tbpedidos2;

	-- 3) Borrar la tabla de tbpaises:
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
	/*
	select count(*) as errores
	from tbpedidos2 pe 
	inner join tbpaises pa on pe.idpais = pa.id
	where pa.nombre != pe.paisdestinatario;
	
	select pe.id, pe.idpais, pe.paisdestinatario, pa.id, pa.nombre
	from tbpedidos2 pe 
	inner join tbpaises pa on pe.idpais = pa.id order by 1;*/
	
	-- Añadir una clave primaria a tbpedidos2:
	alter table if exists tbpedidos2 
	add primary key (id);
	
	
	-- Borrar la columna paisdestinatario de tbpedidos2:
	alter table if exists tbpedidos2 
	drop column paisdestinatario;
	
	
	-- Añadir claves foráneas: idcliente, idempleado, idcompanya, idpais
	-- Añadir la claves foraneas en la tabla de tbpedidos2;
	ALTER TABLE IF EXISTS public.tbpedidos2
	    ADD CONSTRAINT "fk-compañias" FOREIGN KEY (idcompanya)
	    REFERENCES public.tbcompaniaenvios (id) MATCH SIMPLE
	    ON UPDATE RESTRICT
	    ON DELETE RESTRICT
	    NOT VALID;
	
	
	ALTER TABLE IF EXISTS public.tbpedidos2
	    ADD CONSTRAINT "fk-clientes" FOREIGN KEY (idcliente)
	    REFERENCES public.tbclientes (id) MATCH SIMPLE
	    ON UPDATE RESTRICT
	    ON DELETE RESTRICT
	    NOT VALID;
	
	
	ALTER TABLE IF EXISTS public.tbpedidos2
	    ADD CONSTRAINT "fk-empleado" FOREIGN KEY (idempleado)
	    REFERENCES public.tbempleados (id) MATCH SIMPLE
	    ON UPDATE RESTRICT
	    ON DELETE RESTRICT
	    NOT VALID;
	
	-- LA NUEVA FK PARA LOS PAISES:
	ALTER TABLE IF EXISTS public.tbpedidos2
	    ADD CONSTRAINT "fk-pais" FOREIGN KEY (idpais)
	    REFERENCES public.tbpaises (id) MATCH SIMPLE
	    ON UPDATE RESTRICT
	    ON DELETE RESTRICT
	    NOT VALID;

	-- Añadir una nueva FK en detalles de pedidos que esté vinculada con tbpedidos2
	ALTER TABLE IF EXISTS public.tbdetallespedidos
    ADD CONSTRAINT "fk-pedidos" FOREIGN KEY (idpedido)
    REFERENCES public.tbpedidos2 (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

	-- Borrar la tabla de pedidos original:
	drop table if exists tbpedidos;


	-- Renombrar la tabla de pedidos2 a pedidos:
	alter table tbpedidos2 rename to tbpedidos;
	
end $$;

/*
-- Reconectar detalles de pedidos con la nueva tabla tbpedidos2:
-- Borrar la FK de detalles de pedidos que se relaciona con tbpedidos:
alter table if exists public.tbdetallespedidos drop constraint if exists "fk-pedidos";


-- Añadir una nueva FK en detalles de pedidos que esté vinculada con tbpedidos2
ALTER TABLE IF EXISTS public.tbdetallespedidos
    ADD CONSTRAINT "fk-pedidos" FOREIGN KEY (idpedido)
    REFERENCES public.tbpedidos2 (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
*/
	


--create schema if not exists copia;

--create table if not exists copia.tbpedidos as (select * from public.tbpedidos);


/*
SELECT conname AS nombre_fk, conrelid::regclass AS tabla_origen,
       confrelid::regclass AS tabla_referenciada
FROM pg_constraint
WHERE contype = 'f' AND conrelid = 'tbdetallespedidos'::regclass and conname = 'fk-pedidos';

select * from pg_tables where tablename = 'tbpedidos2';*/




