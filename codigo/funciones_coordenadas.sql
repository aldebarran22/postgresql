

-- Crear una funcion que conversion de coordenadas:
-- 
-- 1 : NE 2: SE 3: SW 4: NW
-- 0 : latitud, 1 longitud
create or replace function coordenadas(grados float, minutos float, cuadrante integer, tipo integer) returns float as
$$
declare
	coordenada  float;
	
begin
	coordenada := grados + (minutos / 60.0);
	
	if tipo = 0 then
		-- Es latitud
		if cuadrante in (2,3) then
			coordenada := -coordenada;
		end if;

	else 
		-- Es longitud: 1
		if cuadrante in (3,4) then
			coordenada := -coordenada;
		end if;
	end if;

	return coordenada;
end;
$$
language plpgsql;


create or replace function cuadricula(latitud float, longitud float) returns varchar as
$$
declare
 resul varchar(10);
 sLat integer;
 sLon integer;
 auxLat integer;
 auxLon integer;
 
begin
	sLat := sign(latitud);
	sLon := sign(longitud);
	
	auxLat :=  trunc(abs(latitud));
	auxLat := auxLat - (auxLat % 5);
	resul := to_char(auxLat,'00');

	auxLon :=  trunc(abs(longitud));
	auxLon := auxLon - (auxLon % 5);
	resul := resul || to_char(auxLon,'000');

	-- 1 : NE 2: SE 3: SW 4: NW
	if sLat = 1 and sLon = 1 then
		resul := '1' || resul;

	elseif sLat = -1 and sLon = 1 then
		resul := '2' || resul;
		
	elseif sLat = -1 and sLon = -1 then
		resul := '3' || resul;

	else 
		resul := '4';
	end if;

	return replace(resul,' ','');

end;
$$
language plpgsql;



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
			coordenadas[0] := latitud;
			coordenadas[1] := longitud;
						
		when 2 then
			coordenadas[0] := -latitud;
			coordenadas[1] := longitud;
						
			
		when 3 then
			coordenadas[0] := -latitud;
			coordenadas[1] := -longitud;
						
			
		when 4 then
			coordenadas[0] := latitud;
			coordenadas[1] := -longitud;
					
	end case;
	
	return coordenadas;
end;
$$
language plpgsql;

select conversionCoordenadas(36, 23.5, 2, 45.8, 1);
select conversionCoordenadas(36, 23.5, 2, 45.8, 2);
select conversionCoordenadas(36, 23.5, 2, 45.8, 3);
select conversionCoordenadas(36, 23.5, 2, 45.8, 4);

select cuadricula(coordenadas(36, 23.5, 1, 0), coordenadas(123, 45.8, 1, 1));

