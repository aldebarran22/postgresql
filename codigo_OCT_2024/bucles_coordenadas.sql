-- Cuadriculas

do $$

begin
	for latitud in -90..90 by 5 loop

		for longitud in -180..180 by 5 loop
			raise notice 'Lat: %, Lon: %', latitud, longitud;
		
		end loop;
		
	end loop;

end $$;
