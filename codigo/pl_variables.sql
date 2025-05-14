

-- programación en plpgsql

do $$
declare
	-- Definición de variables
	precio numeric := 254;
	iva numeric := 0.21;
	resultado numeric;

	-- Definición de variables asociadas al tipo de un campo de una tabla:
	cargo_pedido tbpedidos.cargo%type; -- La variable cargo_pedido es del mismo que la columna cargo de la tabla de tbpedidos.
	fecha_pedido tbpedidos.fechapedido%type;

	-- Cuando queremos coger todos los campos de una tabla, pero de una fila.
	pedido tbpedidos%rowtype;

begin
	-- instrucciones
	resultado := (1 + iva) * precio;
	raise info 'EL resultado es %', resultado;

	-- La variable se puede asignar un valor con el resultado de una consulta:
	select cargo into cargo_pedido from tbpedidos; -- ojo, se queda con el cargo de la primera fila.
	raise info 'cargo %', cargo_pedido;

	-- Coger dos variables en la misma query:
	select fechapedido, cargo into fecha_pedido, cargo_pedido from tbpedidos where id=10249;
	raise info 'cargo % y fechapedido: %', cargo_pedido, fecha_pedido;

	-- Capturar una fila completa de un pedido:
	select * into pedido from tbpedidos;
	raise info 'pedido: %', pedido;
	raise info 'id del pedido: %', pedido.id;

end $$;


/*
select column_name from information_schema.columns
where table_name = 'tbpedidos' and table_schema = 'public' order by 1;


select * from information_schema.columns;
*/

