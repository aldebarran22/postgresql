-- mensajes de distinto nivel:

do $$
begin

set log_min_message=debug;
raise debug 'mensaje de depuracion';

end $$;