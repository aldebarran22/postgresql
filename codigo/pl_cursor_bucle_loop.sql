-- Cursor con un bucle loop
-- Recorrer la tabla de incidencias con un cursor
do $$	
declare
	incidencia record;
	cur_incidencias cursor(mes integer) for 
	select * from paises.incidencias where date_part('month', fecha)=mes;
begin
	-- Abrir el cursor:
	open cur_incidencias(6);
	
	loop
		-- leer cada una de las filas:
		fetch cur_incidencias into incidencia;
		exit when not found; -- Salir si ya no hay más filas
			
		raise info '%', incidencia;
	
	end loop;
	
	-- Cerrar el cursor:
	close cur_incidencias;
	
end $$;