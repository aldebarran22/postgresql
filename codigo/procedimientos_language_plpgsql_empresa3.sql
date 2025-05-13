
-- Procedimientos almacenados:

create or replace procedure insertarCategoria(categoria text) 
as
$$
declare
	nuevo_id numeric;
	num_regs integer;
begin

	-- llamada a la función:
	nuevo_id := proximoIdCat();

	raise info 'nuevo id asignado: %', nuevo_id;

	-- Insertar la nueva categoria:
	insert into tbcategorias values(nuevo_id, categoria);

	-- row_count almacena el número de registros afectados en una consulta de acción.
	get diagnostics num_regs = row_count;
	
	raise info 'Se han insertado % categorias', num_regs;

end;
$$
language 'plpgsql';


-- Pruebas de los procedimientos:
call insertarCategoria('Cine');