-- Pruebas con postgis:
select * from spatial_ref_sys;

select postgis_version();

SELECT PostGIS_Full_Version();

SELECT * FROM pg_available_extensions WHERE name = 'postgis';

SELECT postgis_extensions_upgrade();
