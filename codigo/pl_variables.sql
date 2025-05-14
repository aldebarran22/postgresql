

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

	-- Definición de un registro, se puede asociar al resultado de una consulta que tenga más de un campo y no este asociado 
	-- a una tabla concreta:
	datos_producto record;

	-- Definición de un alias de una variable:
	reg alias for datos_producto;

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

	-- Cargar el nombre de la categoria y el nombre del producto de un id concreto:
	select c.nombre as categoria, p.nombre as producto, p.preciounidad into reg
	from tbproductos p inner join tbcategorias c on p.idcategoria = c.id
	where p.id = 1;

	raise info 'Producto: %', reg;
	raise info 'Nombre producto: %', reg.producto;

end $$;


/*
select column_name from information_schema.columns
where table_name = 'tbpedidos' and table_schema = 'public' order by 1;


select * from information_schema.columns;
*/

