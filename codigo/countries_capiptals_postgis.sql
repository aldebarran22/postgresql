
create or replace function distanciaEntreCiudades(ciudad1 text, ciudad2 text) returns numeric as
$$
declare
 existe1 numeric;
 existe2 numeric;
 distancia numeric;

 ubicacion1 geometry;
 ubicacion2 geometry;
 
begin
	select count(*) into existe1 from capitals where lower(name) = lower(ciudad1);
	select count(*) into existe2 from capitals where lower(name) = lower(ciudad2);

	if existe1 = 1 and existe2 = 1 then
				
		-- Recuperar los dos campos de geometria de las dos ciudades:
		select ubicacion into ubicacion1 from capitals where lower(name) = lower(ciudad1);
		select ubicacion into ubicacion2 from capitals where lower(name) = lower(ciudad2);

		-- Calcular la distancia:
		distancia := st_distance(ubicacion1::geography, ubicacion2::geography) / 1000.0;
		return distancia;
		
	else
		raise exception 'Las dos ciudades deben de existir en la BD: %, %', ciudad1, ciudad2;
	end if;
	
end;
$$ 
language 'plpgsql';


-------------------------------------------------------------------------------
-- Pruebas con la base de datos de paises: Tablas: capitals, countries



select st_geometrytype(geom) from capitals limit 1;


select st_geometrytype(geom) from countries limit 1;


select p.name as pais, c.name as capital, st_astext(c.geom) as coordenadas 
from capitals c inner join countries p
on c.country_id = p.id;

-- El nombre del país con el área de lo que ocupa: ST_Area
select name, st_area(geom) as area, st_perimeter(geom) as perimetro from countries order by 2 desc;

-- Obtener las distancias en KMs de Madrid al resto de capitales del mundo:
select name from capitals where name = 'Madrid';


