-- Crear la función generarReporte
create or replace function "schComercial"."generarReporte"() returns integer
as
$$
declare
	varsql text;
	r record;
begin
	varsql := 'select m.fechamovimiento, m.codigoproducto, c.descripcion, 
	m.clasemovimiento, m.tipomovimiento, m.cantidad
	from "schComercial".movimientos m inner join "schComercial"."claseMovimiento" c 
	on m.clasemovimiento = c.clasemovimiento';
	for r in execute varsql loop
		raise notice 'fila: % % % % % %', r.fechamovimiento, r.codigoproducto, r.descripcion, 
		r.clasemovimiento, r.tipomovimiento, r.cantidad;
	end loop;
	return 0;
end 
$$
language 'plpgsql';