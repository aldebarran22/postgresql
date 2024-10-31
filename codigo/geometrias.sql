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

create or replace view capitales as
select name, st_y(geom) as latitud, st_x(geom) as longitud,
case 
   when sign(st_y(geom)) = 1 and sign(st_x(geom)) = 1 then 1
   when sign(st_y(geom)) = -1 and sign(st_x(geom)) = 1 then 2
   when sign(st_y(geom)) = -1 and sign(st_x(geom)) = -1 then 3
   else 4
end as cuadrante
from capitals
order by 2,3;

select * from capitales;


