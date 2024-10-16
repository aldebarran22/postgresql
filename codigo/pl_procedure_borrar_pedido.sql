-- Crear un procedimiento almacenado que se encarga de borrar la información
-- de un pedido

create or replace procedure borrarPedido(id_pedido integer)
language sql
as
$$
	delete from tbdetallespedidos where idpedido = id_pedido;
	delete from tbpedidos where id = id_pedido;
$$