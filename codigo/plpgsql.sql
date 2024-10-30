
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
	total float;
	cuenta integer;
	media float;

begin
	select sum(cargo), count(*), avg(cargo) into total, cuenta, media from tbpedidos;
	raise notice 'El total de pedidos es: %, la media: %, número de pedidos: %', total, media, cuenta;

end $$;