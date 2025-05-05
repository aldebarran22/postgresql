
-- Consultas básicas con una sola tabla:

/*
select campos from tabla;
*/


-- Obtener toda la información de los productos:
select * from tbproductos;

-- Obtener el nombre ordenado ASC:
select nombre from tbproductos order by 1;

-- Obtener el nombre ordenado desc:
select nombre 
from tbproductos 
order by 1 desc;

-- Criterios: select campos from tabla where campo operador valor

-- Buscar un producto por el nombre:
SELECT * from tbproductos where NOMBRE = 'Queso Cabrales';

-- Buscar productos que sean superiores a 50 eur.
select nombre, preciounidad from tbproductos where preciounidad > 50;

-- Buscar productos dentro de un rango de precios:
select nombre, preciounidad from tbproductos where preciounidad between 20 and 50; 

-- Lo mismo pero utilizando operadores relacionales:
select nombre, preciounidad from tbproductos where preciounidad >= 20 and preciounidad <= 50;

-- Obtener los productos que sean más baratos de 20 o superiores a 50:
select nombre, preciounidad from tbproductos where preciounidad < 20 or preciounidad > 50;
select nombre, preciounidad from tbproductos where not (preciounidad >= 20 and preciounidad <= 50);
select nombre, preciounidad from tbproductos where preciounidad not between 20 and 50;


-- Productos inferiores a 40 eur, obtener el nombre, el precio y cantidadporunidad, ordenado desc por precio:
select nombre, preciounidad, cantidadporunidad from tbproductos where preciounidad < 40 order by 2 desc;


-- Recuperar los productos que van empaquetados en frascos:
select nombre, cantidadporunidad from tbproductos where cantidadporunidad like '%frascos%' or cantidadporunidad like '%cajas%' order by 2;


-- Campos calculados: 
select  10^3 as potencia;

-- Calcular el IVA de los productos:
select nombre, preciounidad, 0.21 as porc_iva, preciounidad * 1.21 as total from tbproductos;

-- Ordenación por el alias: ok
select nombre, preciounidad, 0.21 as porc_iva, preciounidad * 1.21 as total from tbproductos order by total;

-- Reutilizar un campo calculado: NO SE PUEDE -> ERROR
select nombre, preciounidad, 0.21 as porc_iva, preciounidad * porc_iva as iva, preciounidad + iva as total from tbproductos;

select nombre, preciounidad, 0.21 as porc_iva, preciounidad * 0.21 as iva, preciounidad + (preciounidad * 0.21) as total from tbproductos;

-- Utilizar un campo calculado en un criterio: NO SE PUEDE --> ERROR
select nombre, preciounidad, preciounidad * 0.21 as iva from tbproductos where iva > 5;

select nombre, preciounidad, preciounidad * 0.21 as iva from tbproductos where preciounidad * 0.21 > 5 order by iva;


-- Productos que el preciounidad es múltiplo de 5: cast comvierte el tipo double precision a integer:
select nombre, preciounidad from tbproductos where cast(preciounidad as integer) % 5 = 0;

-- Operador de concatenación ||
-- El tratamiento, apellido, nombre de los empleados en una sola columna:
select tratamiento || ' ' ||  nombre || ' ' || apellidos as nombre_completo from tbempleados;









