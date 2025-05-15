-- Crear la función generarReporte2
create or replace function "schComercial"."generarReporte2"() returns integer
as
$$
declare
	varsql text;
	r record;
	vanio integer;
	vmes integer;
	ventrada boolean;
	vsalida boolean;
	vresultado boolean;
begin
	varsql := 'select m.fechamovimiento, m.codigoproducto, c.descripcion, 
	m.clasemovimiento, m.tipomovimiento, m.cantidad
	from "schComercial".movimientos m inner join "schComercial"."claseMovimiento" c 
	on m.clasemovimiento = c.clasemovimiento';
	for r in execute varsql loop
		vanio := extract(year from r.fechamovimiento);
		vmes := extract(month from r.fechamovimiento);
		
		case r.tipomovimiento
			when 'E' then							
				ventrada := TRUE;
				
			when 'S' then
				vsalida := TRUE;
				
		end case;
		
		if ventrada then
			raise notice 'entrada: % % %', r.fechamovimiento, vanio, vmes;
			select "schComercial"."sumarProducto"
			(vanio, vmes, r.codigoproducto, r.clasemovimiento, r.cantidad)
			into vresultado;

			if vresultado = FALSE then
				insert into "schComercial"."reporteMovimiento"
				values(vanio, vmes, r.codigoproducto, r.clasemovimiento, r.cantidad,0);
			else
				raise notice 'Actualizado ok';
			end if;

		end if;
		
		if vsalida then
			raise notice 'salida: % % %', r.fechamovimiento, vanio, vmes;
			
			select "schComercial"."restarProducto"
			(vanio, vmes, r.codigoproducto, r.clasemovimiento, r.cantidad)
			into vresultado;

			if vresultado = FALSE then
				insert into "schComercial"."reporteMovimiento"
				values(vanio, vmes, r.codigoproducto, r.clasemovimiento, 0, r.cantidad);
			else
				raise notice 'Actualizado ok';
			end if;

		end if;
	end loop;
	return 0;
end 
$$
language 'plpgsql';