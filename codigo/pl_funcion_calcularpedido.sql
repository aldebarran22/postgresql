--- Crear una función que devuelva el importe de un pedido:
create or replace function calcularpedido(id_pedido integer) returns numeric
as
$$
declare
	importe_cargo numeric;
	importe_detalles numeric;
	total numeric;
begin
	-- Extraer el cargo del pedido
	select cargo into importe_cargo from tbpedidos where id = id_pedido;
	--raise info 'El cargo del pedido: % es: %',  id_pedido, importe_cargo;
	
	-- Calcular el final de los productos del pedido
	select sum(d.preciounidad * d.cantidad * (1-d.descuento/100)) into importe_detalles
	from tbpedidos p inner join tbdetallespedidos d 
	on p.id = d.idpedido
	where p.id = id_pedido;
	
	-- Calcular el total del pedido:
	total = importe_cargo + importe_detalles;
	
	return total;
end
$$
language 'plpgsql';