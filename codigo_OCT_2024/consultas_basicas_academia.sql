/* CONSULTAS BASICAS SOBRE LA BD ACADEMIA */

-- select campos from tabla;

-- Obtener el nombre de las asignaturas:
select nombreasig from  ac_asignaturas;

-- Obtener el nombre y el precio de las asignaturas:
select nombreasig, precio from  ac_asignaturas;

-- Mostrar todos los campos de las asignaturas:
select * from ac_asignaturas;

-- Con un alias en el nombre de la tabla
select a.nombreasig, precio from  ac_asignaturas a;

-- Campos calculados: añadir un campo calculado: el iva de cada asignatura
select nombreasig, precio, precio * 0.21 as iva from ac_asignaturas;

-- Añadir el iva y el total (precio + iva)
-- OJO un campo no se puede utilizar para otro campo calculado, pero SI se puede utilizar en el order by:
select nombreasig, precio, precio * 0.21 as iva, (precio * 0.21) + precio as total from ac_asignaturas
order by iva;


-- Ordenar los resultados: 
-- select campos from tabla order by columnas [desc];

-- Listado ordenado de las asignaturas por nombre: ascendentemente
select nombreasig from ac_asignaturas order by nombreasig;

-- Asignaturas con el precio desc:
select nombreasig, precio from ac_asignaturas order by 2 desc;

-- Listado de alumnos ordenado por nacimiento (ciudad) y el nombre:
select nacimiento, nombre 
from ac_alumnos
order by 1,2;

-- Establecer criterios dentro de la consulta:
-- select campos from tabla where criterios order by campos;

-- Asignaturas con un precio superior a 30 eur:
select * from ac_asignaturas where precio > 30;

-- Asignaturas que el precio está dentro de un intervalo [20 a 30]:
select * from ac_asignaturas where precio >= 20 and precio <= 30;

-- La misma consulta con between:
select * from ac_asignaturas where precio between 20 and 30;


-- Cuales son las asignaturas que NO están en el intervalo anterior:
select * from ac_asignaturas where (precio not between 20 and 30);

select * from ac_asignaturas where (precio < 20) or (precio > 30);

-- Alumnos que NO tienen telefono:
select nombre, telefono from ac_alumnos where telefono is null;

-- Profesores con un puesto fijo:
select * from ac_profesores where puestofijo is true;

-- Nombre - telefono de los alumnos:
select nombre || ' ' || telefono as contacto from ac_alumnos;


-- Profesores que tengan un sueldo multiplo de 10:
select nombre, sueldo from ac_profesores where sueldo % 10 = 0;


-- Quitar repetidos:
-- Obtener las ciudades de donde vienen los alumnos:
select distinct nacimiento from ac_alumnos;
select nacimiento from ac_alumnos group by nacimiento;


-- Obtener los alumnos de Madrid, Segovia y Bilbao:
select nombre, nacimiento from ac_alumnos 
where nacimiento = 'madrid' or nacimiento = 'bilbao' or nacimiento = 'segovia';

select nombre, nacimiento from ac_alumnos 
where nacimiento in ('madrid','bilbao','segovia');

-- El resto de provincias:
select nombre, nacimiento from ac_alumnos 
where nacimiento not in ('madrid','bilbao','segovia');

-- Alumnos cuyo nombre empieza por 'A': poner % en vez de *
select * from ac_alumnos where nombre like 'A%';



