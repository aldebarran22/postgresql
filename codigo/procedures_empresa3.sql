
/* PROCEDIMIENTOS ALMACENADOS PARA LA BD EMPRESA3 */

-- Borrar un pedido completo: borrar en dos tablas -> tbpedidos y tbdetallespedido

delete from tbpedidos where id = 10249;


create or replace procedure borrarPedido(id_pedido integer) 
language sql
as
$$
	delete from tbdetallespedidos where idpedido = id_pedido;
	delete from tbpedidos where id = id_pedido;
$$

call borrarPedido(10249);