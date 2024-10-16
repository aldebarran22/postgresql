-- Procedimiento que devuelve el nombre y el primer apellido de un nombre completo
create or replace procedure nombreApellido(nombreCompleto varchar, 
										   out nombre varchar,
										   out apellido varchar)
language plpgsql
as
$$
declare
	ind integer;
begin
	ind = position(' ' in nombreCompleto);
	if ind = 0 then
		-- Solo viene el nombre, no hay apellido:
		nombre = nombreCompleto;
		apellido = '';
		
	else
		nombre = substring(nombreCompleto, 1, ind-1);
		apellido = substring(nombreCompleto, ind+1);
	
	end if;
end 
$$
										   

