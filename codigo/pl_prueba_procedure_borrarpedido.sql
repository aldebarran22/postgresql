-- Prueba del procedure borrar pedido:

-- Probar el procedure:

do $$
declare
	idpedido integer;
begin
	idpedido = 10248;
	call borrarPedido(idpedido);
	raise info 'Borrar pedido: %', idpedido;
end $$


select * from tbpedidos where id=10248;