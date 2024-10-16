-- Prueba de funciones sobre PostGIS.
-- Base de datos paises


-- FUNCIONES PARA EL CALCULO DE ATRIBUTOS GEOMETRICOS:

-- Calcular áreas y perímetros:
select name, st_area(geom) as area, st_perimeter(geom) as perimetro from countries;

-- Obtener los paises que tienen un area superior a la media:
select name, st_area(geom) as area from countries where  st_area(geom) > (select avg(st_area(geom)) from countries)
order by 2 desc;


-- FUNCIONES PARA LA CONSTRUCCION O CREACION DE GEOMETRIAS

-- Crear puntos, lineas, poligonos
select st_makepoint(-3.68, 40.24);


-- Comprobar el tipo del objeto creado:
select st_geometryType(st_makepoint(-3.68, 40.24));


SELECT ST_MakeLine(
    ARRAY[
        ST_MakePoint(5,2), 
        ST_MakePoint(4,5), 
        ST_MakePoint(8,10)
    ]
);


SELECT ST_MakePolygon(
    ST_GeomFromText(
        'LINESTRING(10 10, 15 10, 20 15, 10 15, 10 10)'
    )
);

SELECT AddGeometryColumn('datos', 'nuevospuntos', 'geom', 25830, 'POINT', 2);
 
SELECT DropGeometryColumn('datos', 'nuevospuntos', 'geom');


-- FUNCIONES PARA VERIFICAR GEOMETRIAS:

-- Obtener los tipos de geometrías distintas que tenemos en las dos tablas:
select distinct st_geometrytype(geom) from countries
union
select distinct st_geometrytype(geom) from capitals;


-- Comprobar si las geometrías son validas:
select ST_IsValid(geom) from countries;