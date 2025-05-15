
/* VISTAS DE LA BD EMPRESA3 */


create or replace view vista_empleados as
select id, apellidos, nombre, cargo, tratamiento, fechanacimiento, ciudad, pais, telefono
from tbempleados where pais = 'Reino Unido'
with check option;


select * from vista_empleados;

insert into vista_empleados(id, apellidos, nombre, cargo, tratamiento, fechanacimiento, ciudad, pais, telefono) 
values((select max(id)+1 from tbempleados), 'Sanz', 'Juan', 'Gerente', 'Sr.', current_date - (365 * 34), 'Londres','Reino Unido','(998)5566');



-- Crear una vista materializada que cuenta el número de productos por categoría:
create materialized view vista_categoria_productos as
select c.nombre, count(p.id)  as cuenta
from tbcategorias c inner join tbproductos p
on c.id = p.idcategoria
group by 1
order by 2 desc;


select * from vista_categoria_productos;

-- Insertamos un nuevo producto:
insert into tbproductos values((select max(id)+1 from tbproductos), 'Red Bull II', 1, 1, 2.5, 100, 'botellas', 200);
insert into tbproductos values((select max(id)+1 from tbproductos), 'Red Bull III', 1, 1, 2.75, 150, 'botellas 0.5 L', 250);

-- Refrescar los datos de la vista materializada:
refresh materialized view vista_categoria_productos;


-- Vistas del sistema:
select * from pg_tables;







