

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



