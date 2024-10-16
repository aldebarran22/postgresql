/* CONSULTAS DE UNA TABLA 

select campos
from tabla
where condiciones
group by columnas
having cond-grupo
order by cols
*/

-- Productos con un precio superior a 50
select nombre, preciounidad from tbproductos where preciounidad > 50;

-- Productos con un precio superior a 50 Ordenado DESC
select nombre, preciounidad from tbproductos where preciounidad > 50
order by preciounidad desc;

select nombre, preciounidad from tbproductos where preciounidad > 50
order by 2 desc;

-- Rangos de precios productos entre 20 y 30:
select nombre, preciounidad from tbproductos 
where preciounidad >= 20 and preciounidad <= 30
order by 2 desc;

select nombre, preciounidad from tbproductos 
where preciounidad between 20 and 30
order by 2 desc;

-- Productos que no están en el rango de 20 y 30:
select nombre, preciounidad from tbproductos 
where preciounidad < 20 or preciounidad > 30
order by 2;

select nombre, preciounidad from tbproductos 
where not (preciounidad >= 20 and preciounidad <= 30)
order by 2;

select nombre, preciounidad from tbproductos 
where preciounidad not between 20 and 30
order by 2;

-- Obtener los productos que se almacenan en frascos o en latas:
select nombre,cantidadporunidad from tbproductos
where cantidadporunidad like '%frascos%' or cantidadporunidad like '%latas%';

-- Modificar en detalles de pedidos la cantidad de 0 a 5
update tbdetallespedidos
set cantidad = 5 where cantidad = 0;

-- Añadir un campo calculado sobre el precio del producto: iva y el total
select nombre, preciounidad, ROUND(preciounidad * 0.21) as iva,
preciounidad * 1.21 as total
from tbproductos;

-- En detalles de pedidos calcular el precio final por producto
-- teniendo en cuenta el descuento en porcentaje:
-- Redondear a 2 decimales: Convertir a float
select idpedido, idproducto, 
round(cast (float8 (preciounidad * cantidad * (1 - descuento/100)) as numeric),2) as importe
from tbdetallespedidos;

-- Quitar repetidos: 
select distinct paisdestinatario from tbpedidos order by 1;
select  paisdestinatario from tbpedidos group by paisdestinatario order by 1;

-- IN / NOT IN
-- Pedidos de Austria, Suiza o Finlandia:
select  id, paisdestinatario from tbpedidos 
where paisdestinatario in ('Austria', 'Suiza', 'Finlandia')
order by paisdestinatario, id;

-- Obtener los 5 productos más caros:
select nombre, preciounidad from tbproductos
order by 2 desc limit 5;








