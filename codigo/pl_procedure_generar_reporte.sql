--CRear un procedimiento almacenado para generar el contenido de la tabla de reporte de movimientos

create or replace procedure "schComercial".crearReporte()
language plpgsql
as
$$
declare
	datos record;
	sql text;
	mm integer;
	yy integer;
begin
    --vaciar la table de reporte:
    delete from "schComercial"."reporteMovimiento";
	
	sql = 'select m.fechamovimiento, m.clasemovimiento, c.tipomovimiento, m.codigoproducto,
	m.cantidad from "schComercial"."claseMovimiento" c inner join "schComercial".movimientos m
	on c.clasemovimiento = m.clasemovimiento';
	
	for datos in execute sql loop
				
		-- Extraer mes y año de la fecha:
		mm = extract(month from datos.fechamovimiento);
		yy = extract(year from datos.fechamovimiento);
		
		raise info '%', datos;
		
		if datos.tipomovimiento = 'E' then
			update "schComercial"."reporteMovimiento"
			set totalentradas = totalentradas + datos.cantidad
			where anio = yy and mes = mm and codigoproducto = datos.codigoproducto
			and clasemovimiento = datos.clasemovimiento;
			
			if not found then
				-- Si no existe el registro
				insert into "schComercial"."reporteMovimiento" 
				values(yy, mm, datos.codigoproducto, datos.clasemovimiento, datos.cantidad, 0);
				
				raise info 'NO existe -> insert';
				
			else 
				raise info 'existe -> update';
			
			end if;			
		else
			-- datos.tipomovimiento = 'S' 
			if exists(select * from "schComercial"."reporteMovimiento" 
					  where clasemovimiento = datos.clasemovimiento and
					  anio = yy and mes = mm and codigoproducto = datos.codigoproducto) then
					  
					  raise info 'existe -> update';
					  
					  -- Existe, actualizamos
					  update "schComercial"."reporteMovimiento"	
					  set totalsalidas = totalsalidas + datos.cantidad
						where anio = yy and mes = mm and codigoproducto = datos.codigoproducto
						and clasemovimiento = datos.clasemovimiento;
			else 
				 raise info 'NO existe -> insert';
			
				-- Se crear el registro con las salidas;
				insert into "schComercial"."reporteMovimiento"
				values(yy, mm, datos.codigoproducto, datos.clasemovimiento, 0, datos.cantidad);			
			end if;			
		end if;		
	end loop;
    
--exception 

end
$$

/*
select m.fechamovimiento, m.clasemovimiento, c.tipomovimiento, m.codigoproducto,
	m.cantidad from "schComercial"."claseMovimiento" c inner join "schComercial".movimientos m
	on c.clasemovimiento = m.clasemovimiento;
*/

/*
select * from "schComercial"."reporteMovimiento" 
					  where clasemovimiento = 101 and
					  anio = 2021 and mes = 5 and codigoproducto = 778045;*/
