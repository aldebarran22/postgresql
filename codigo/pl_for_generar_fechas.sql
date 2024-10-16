-- Ejemplo bucle for para insertar registros:
do $$
declare
	mes integer;
	yy integer;
	fecha date;
	aux varchar(20);
	ultimo_dia integer;
	fecha_ultimo_dia date;
begin
	yy = 2023;
	truncate paises.incidencias RESTART IDENTITY;
	for mes in 1..12 loop
		aux =  '01/' || to_char(mes,'09') || '/' ||  to_char(yy,'9999') ;
		fecha_ultimo_dia = last_day(to_date(aux, 'dd/mm/yyyy'));
		ultimo_dia = date_part('day', fecha_ultimo_dia);

		for dia in 1..ultimo_dia loop		
			aux = to_char(yy,'9999') || '-' || to_char(mes,'09') || '-' || to_char(dia,'09');
			aux = replace(aux, ' ', '');
			fecha = to_date(aux, 'yyyy-mm-dd');
			insert into paises.incidencias(fecha, descripcion) values(fecha, 'no hay incidencia');
			--raise info 'fecha: %', fecha;	
		end loop;
	end loop;
	raise info 'Proceso finalizado ...';

end $$;