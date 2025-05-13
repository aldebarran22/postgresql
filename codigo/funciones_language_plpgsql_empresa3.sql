
-- Funciones plpgsql:

-- Función para calcular el importe total de un pedido:

create or replace function calcularImportePedidoTotal(id_pedido numeric) returns numeric as
$$
declare
	-- Zona para declarar las variables locales.
	cargo_pedido numeric;
	importe_productos numeric;
	
begin
	-- Las instrucciones:

	-- Recuperar el cargo del pedido:
	select cargo into cargo_pedido from tbpedidos where id = id_pedido;

	-- Recuperar el importe de los productos del pedido:
	select sum(preciounidad * cantidad * (1-descuento/100.0)) into importe_productos from tbdetallespedidos where idpedido=id_pedido;


	-- Imprimir un mensaje:
	raise info 'idpedido %, cargo %, importe_productos %', id_pedido, cargo_pedido, importe_productos;

	
	return cargo_pedido + importe_productos;
	
end;
$$
language 'plpgsql';


-- Prueba funciones:
select calcularImportePedidoTotal(10248);  
select id, calcularImportePedidoTotal(id) from tbpedidos;

-- Cuantos pedidos tienen un importe superior al pedido 10248:
select count(id) as cuenta from tbpedidos where calcularImportePedidoTotal(id) > calcularImportePedidoTotal(10248);


