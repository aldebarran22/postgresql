create or replace function "schComercial"."sumarProducto"
(integer, integer, numeric, integer, integer) returns boolean
as
$$
declare
	vproducto numeric;
begin
	update "schComercial"."reporteMovimiento"
	set totalentradas = totalentradas + $5
	where anio=$1 and mes=$2 and codigoproducto = $3
	and clasemovimiento = $4;
	return found;
end
$$
language 'plpgsql';



