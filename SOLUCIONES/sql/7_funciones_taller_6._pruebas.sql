-- Prueba de las 7_funciones taller6
select "schComercial"."generarReporte"();

select "schComercial"."generarReporte2"();

-- Si en estas funciones devuelve FALSE es que no existe el producto
-- en ese año / mes
select "schComercial"."sumarProducto"(2021, 5, 778045, 101, 100);
select "schComercial"."restarProducto"(2021, 5, 778045, 201, 13);