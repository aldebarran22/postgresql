/* Pruebas con PostGIS */

select postgis_version();

-- Obtener el tipo de geometria de las tablas capitals y countries:
select distinct st_geometrytype(geom) from capitals;

select distinct st_geometrytype(geom) from countries;


-- Verificar si la geometria es correcta:
select count(*) from capitals where st_isvalid(geom) = false;

select count(*) from countries where st_isvalid(geom) = false;

select name, st_astext(geom) from capitals;

select name, st_asgeojson(geom) from capitals;

-- ST_X  --> longitud
-- ST_Y  --> Latitud

select name, st_y(geom) as latitud, st_x(geom) as longitud
from capitals where name = 'Madrid';

-- Crear una vista con el nombre de la ciudad, lat, lon y el cuadrante:
-- 1 : NE 2: SE 3: SW 4: NW

-- Añadir el país a la vista:

create or replace view capitales as
select p.name as pais, c.name as capital, st_y(c.geom) as latitud, st_x(c.geom) as longitud,
case 
   when sign(st_y(c.geom)) = 1 and sign(st_x(c.geom)) = 1 then 1
   when sign(st_y(c.geom)) = -1 and sign(st_x(c.geom)) = 1 then 2
   when sign(st_y(c.geom)) = -1 and sign(st_x(c.geom)) = -1 then 3
   else 4
end as cuadrante, cuadricula(st_y(c.geom), st_x(c.geom)) as cuadricula
from capitals c inner join countries p
on c.country_id = p.id
order by 2,3;

drop view capitales;



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
		resul := '4' || resul;
	end if;

	return replace(resul,' ','');

end;
$$
language plpgsql;



select * from capitales;

select * from capitales 
where cuadricula = '415060';


-- Calcular las areas de cada pais y ordenar DESC:
select name, st_area(geom) as area
from countries
order by 2 desc;

-- El nombre del pais mas grande:
select name, st_area(geom) as area
from countries
where st_area(geom) = (select max(st_area(geom)) from countries);


SELECT ST_MakePolygon(ST_GeomFromText('LINESTRING(10 10, 15 10, 20 15, 10 15, 10 10)'));
SELECT ST_Within('POINT(11 12)'::geometry, ST_MakePolygon(ST_GeomFromText('LINESTRING(10 10, 15 10, 20 15, 10 15, 10 10)')));

-- A partir de una coordenada comprobar si cae de un país:
select name from countries
where st_within(st_setsrid(st_makepoint(14.68,45.4),4326), geom);

SELECT ST_Distance(st_setsrid(st_makepoint(14.68,45.4),4326), st_setsrid(st_makepoint(-3.68,40.4),4326));

select ST_Distance(ST_Transform(ST_GeomFromText('POINT(-3.68 40.4)',4326),2100),ST_Transform(ST_GeomFromText('POINT(14.68 45.4)',4326),2100))/1000;


SELECT ST_SRID(geom) FROM capitals where id=1;
SELECT ST_SRID(geom) FROM countries where id=1;


-- Crear una función que nos devuelva la distancia en kms entre dos capitales:
create or replace function distanciaKms(ciudad1 varchar, ciudad2 varchar) returns float as
$$
declare
	coordenadas1 geometry;
	coordenadas2 geometry;
	kms float := 0;
	
begin
	select geom into coordenadas1 from capitals where name = ciudad1;
	select geom into coordenadas2 from capitals where name = ciudad2;

	if coordenadas1 is null or coordenadas2 is null then
		raise notice 'No se encuentran las dos ciudades';

	else
		raise notice 'Ciudad: %, coordenadas: %', ciudad1, st_astext(coordenadas1);
		raise notice 'Ciudad: %, coordenadas: %', ciudad2, st_astext(coordenadas2);

		kms := ST_Distance(ST_Transform(coordenadas1,2100),ST_Transform(coordenadas2,2100))/1000;
	
	end if;

	return kms;
end;
$$
language plpgsql;



select distanciaKms('Paris','Madrid');








