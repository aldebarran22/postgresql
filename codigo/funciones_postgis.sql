

-- Funciones postgis:

-- Habilitar la extensión:
create extension postgis;


-- Funciones de información:
-- La versión:
select postgis_version();

select postgis_full_version();

select postgis_extensions_upgrade();

SELECT * FROM pg_available_extensions WHERE name='postgis';

/* Principales SRID 

4326 (WGS 84): Es el sistema de referencia más común para coordenadas geográficas (latitud y longitud). 
Lo utilizan los GPS y muchas aplicaciones de mapas.

3857 (Pseudo-Mercator): Usado por Google Maps, OpenStreetMap y otros servicios de mapas en línea.

326XX (UTM - Universal Transverse Mercator): Donde "XX" representa la zona UTM específica. Se usa para datos cartográficos precisos en regiones específicas.

4258 (ETRS89): Sistema de referencia europeo basado en WGS 84, utilizado en cartografía oficial en Europa.

23030 (ED50 UTM Zone 30N): Antiguo sistema de referencia usado en España antes de la adopción de ETRS89.
*/

-- Añadir una columna de geometría a la tabla de trayectoria:
-- add column nombre_col tipo_col
alter table trayectoria add column geom geometry(Point, 4326);

-- Copiar las coordenadas lat, lon a la nueva columna geom:
update trayectoria 
set geom = ST_SetSrid(ST_MakePoint(lon, lat), 4326);

select lat, lon, st_astext(geom), geom from trayectoria;

-- Que tipo de geometria tengo en una col de la tabla:
select st_geometrytype(geom) from trayectoria limit 1;

-- Ejemplo con st_length obtener la distancia (dividir por 1000 para obtener kms):
select st_length(st_makeline(geom)::geography) / 1000 as distancia from trayectoria;

-- Obtener el primer punto y el último de la trayectoria: st_astext(geom);
(select lat,lon, st_astext(geom) from trayectoria order by id limit 1)
union
(select lat,lon, st_astext(geom) from trayectoria order by id desc limit 1);

select st_srid(geom) from trayectoria limit 1;


-- Añadir una tabla para almacenar ubicaciones de ciudades:

CREATE TABLE ciudades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion GEOMETRY(Point, 4326)
);


create or replace function distanciaEntreCiudades(ciudad1 text, ciudad2 text) returns numeric as
$$
declare
 existe1 numeric;
 existe2 numeric;
 distancia numeric;

 ubicacion1 geometry;
 ubicacion2 geometry;
 
begin
	select count(*) into existe1 from ciudades where lower(nombre) = lower(ciudad1);
	select count(*) into existe2 from ciudades where lower(nombre) = lower(ciudad2);

	if existe1 = 1 and existe2 = 1 then
				
		-- Recuperar los dos campos de geometria de las dos ciudades:
		select ubicacion into ubicacion1 from ciudades where lower(nombre) = lower(ciudad1);
		select ubicacion into ubicacion2 from ciudades where lower(nombre) = lower(ciudad2);

		-- Calcular la distancia:
		distancia := st_distance(ubicacion1::geography, ubicacion2::geography) / 1000.0;
		return distancia;
		
	else
		raise exception 'Las dos ciudades deben de existir en la BD: %, %', ciudad1, ciudad2;
	end if;
	
end;
$$ 
language 'plpgsql';

select distanciaEntreCiudades('a coruña', 'cádiz');


-- Añadir una ciudad a la tabla:
insert into ciudades(nombre, ubicacion) values('Madrid', ST_GeomFromText('POINT(-3.68 40.4)'));
insert into ciudades(nombre, ubicacion) values('Barcelona', ST_GeomFromText('POINT(2.17 41.38)'));
insert into ciudades(nombre, ubicacion) values('Cádiz', ST_GeomFromText('POINT(-6.29 36.52)'));
insert into ciudades(nombre, ubicacion) values('A Coruña', ST_GeomFromText('POINT(-8.39 43.37)'));



select *, st_astext(ubicacion) from ciudades;

-- Transformar unas coordenadas de un sistema de referencia a otro:
select st_transform(ubicacion, 3857) from ciudades;

select st_transform(st_setsrid(st_makepoint(-3.68, 40.4), 4326), 3857);

select st_astext(st_transform(ubicacion, 3857)) from ciudades;

SELECT ST_Distance(
    ST_SetSRID(ST_MakePoint(-3.70379, 40.41678), 4326)::geography,
    ST_SetSRID(ST_MakePoint(2.1734, 41.3851), 4326)::geography
) / 1000 AS distancia_km;


create table paises (
	id serial primary key,
	pais varchar(40)
);

-- Parámetros: schema, tabla, nombre_col, SRID, tipo_geometria, 2 (dimensiones)
select addGeometryColumn('public','paises','coordenadas',4326, 'POINT', 2);

-- Parámetros: schema, tabla, nombre_col
select dropGeometryColumn('public', 'paises', 'coordenadas');


-- Comprobar si una coordenada se encuentra o no dentro del radio (de X metros) de otra coordenadas
SELECT ST_DWithin(
    ST_SetSRID(ST_MakePoint(-3.70379, 40.41678), 4326)::geography,
    ST_SetSRID(ST_MakePoint(-4.6, 40.3851), 4326)::geography,
    10000
);









