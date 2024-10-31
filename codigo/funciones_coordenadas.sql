

-- Crear una funcion que conversion de coordenadas:
-- 
-- 1 : NE 2: SE 3: SW 4: NW

create or replace function conversionCoordenadas(gLat float, mLat float, gLon float, mLon float, cuadrante integer) returns float[] as
$$
declare
latitud float;
longitud float;
coordenadas float[2];

begin
	latitud := gLat + (mLat / 60.0);
	longitud := gLon + (mLon / 60.0);

	case cuadrante
		when 1 then
			;
			
		when 2 then
			latitud := -1 * latitud;
			
		when 3 then
			latitud := -1 * latitud;
			longitud := -1 * longitud;
			
		when 4 then
			longitud := -1 * longitud;
			
	end case;
	
	coordenadas[0] := latitud;
	coordenadas[1] := longitud;
	return coordenadas;
end;
$$
language plpgsql;
