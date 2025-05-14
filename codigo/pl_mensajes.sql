/*
DEBUG → Mensajes para depuración.
LOG → Mensajes que se registran en los logs pero no se muestran al usuario.
NOTICE → Mensajes informativos (visibles en la salida).
WARNING → Mensajes de advertencia.
EXCEPTION → Lanza una excepción y detiene la ejecución.
*/


-- Programación en plpgsql:

do $$ 
begin
	-- Establecer el nivel de mensajería:
	set client_min_messages = log;

	
	raise debug 'mensaje a nivel de debug';
	raise log 'mensaje a nivel de log';	
	raise info 'mensaje a nivel info';
	raise notice 'mensaje a nivel notice';
	raise warning 'mensaje a nivel warning';
	raise exception 'se ha producido un error';  -- Corta la ejecución del script

end $$;





