-- mensajes raise  niveles:
do $$
declare
	nivel_mensaje text;
begin
	show client_min_messages into nivel_mensaje;
	raise info 'client_min_messages al inicio: %', nivel_mensaje;
	
	set client_min_messages = log;
	show client_min_messages into nivel_mensaje;
	raise info 'client_min_messages despues de cambiar: %', nivel_mensaje;
	
	raise debug 'Mensaje debug';
	raise info 'Mensaje info';
	raise notice 'Mensaje notice';
	raise warning 'Mensaje warning';
	raise log 'Mensaje Log';
	--raise error 'mensaje de error'; Aborta el script
	
end $$;