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
select nombreasig, precio, precio * 0.21 as iva  from  ac_asignaturas;



