
-- Niveles de mensajes en plpgsql
do $$
--declare
	

begin
	Set client_min_messages = debug;

	raise debug 'Mensaje de debug';
	raise log 'Mensaje de log';
	raise info 'Mensaje de info';
	raise notice 'Mensaje de notice';
	raise warning 'Mensaje de warning';
	
end $$;


-- Cargar resultados de una consulta a una variable
do $$
declare
	-- total y media tienen el mismo tipo que la columna cargo de la tabla tbpedidos:
	total tbpedidos.cargo%type;
	cuenta integer;
	media tbpedidos.cargo%type;

begin
	select sum(cargo), count(*), avg(cargo) into total, cuenta, media from tbpedidos;
	raise notice 'El total de pedidos es: %, la media: %, número de pedidos: %', total, media, cuenta;

end $$;


-- cargar los datos de un pedido en una variable rowtype: RECORd
do $$
declare
	pedido tbpedidos%rowtype;
begin
	select * into pedido from tbpedidos where id = 10250;
	raise notice 'El id: %, y el cliente: %, fechapedido: %', pedido.id, pedido.idcliente, pedido.fechapedido;
	
end $$;


-- BUCLES:
-- LOOP: BUCLE INFINITO
do $$
begin

	loop
		raise info 'En el bucle';
	end loop;
	
end $$;

-- LOOP CON TERMINACION
do $$
declare
  i integer:=1;
begin

	loop
		exit when i > 10;	
		raise info 'i = %', i;
		i := i + 1;
		
	end loop;
	
end $$;

-- BUCLE FOR CON UN RANGO DE VALORES
do $$
--declare
 
begin
	for i in 1..10 loop
		raise info 'i = %', i;
	end loop;
end $$;


-- BUCLE FOR CON UNA CONSULTA








