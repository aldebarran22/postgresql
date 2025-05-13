
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


create or replace procedure eliminarPedido(id_pedido numeric)
as
$$
declare
	num_regs integer;
begin

	-- primero borramos los detalles de pedido:
	delete from tbdetallespedidos where idpedido = id_pedido;
	get diagnostics num_regs = row_count;
	raise info 'Se han eliminado % lineas del pedido: %', num_regs, id_pedido;

	-- Borrar el pedido:
	delete from tbpedidos where id = id_pedido;
	get diagnostics num_regs = row_count;
	raise info 'Se ha borrado: % pedidos', num_regs;
	
end;
$$
language 'plpgsql';



-- Pruebas de los procedimientos:
call insertarCategoria('Cine');

delete from tbpedidos where id = 10248;

call eliminarPedido(10248);

