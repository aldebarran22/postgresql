
/* FUNCIONES EN PLPGSQL */

create or replace function calcularPorcentaje(total float, parcial float) returns float
as
$$
declare
 -- Variables locales
 porcentaje float;

begin
	porcentaje := round(parcial / total * 100.0, 2);
	return porcentaje;
	
end;
$$
language 'plpgsql';
