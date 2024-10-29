
/* VISTAS DE LA BD EMPRESA3 */


create or replace view vista_empleados as
select id, apellidos, nombre, cargo, tratamiento, fechanacimiento, ciudad, pais, telefono
from tbempleados where pais = 'Reino Unido'
with check option;


select * from vista_empleados;

insert into vista_empleados(id, apellidos, nombre, cargo, tratamiento, fechanacimiento, ciudad, pais, telefono) 
values((select max(id)+1 from tbempleados), 'Sanz', 'Juan', 'Gerente', 'Sr.', current_date - (365 * 34), 'Londres','Reino Unido','(998)5566');



