/* Consultas sobre la BD empresa 3 */

-- Cuantas líneas de la tabla detalles de pedidos tienen el campo cantidad a cero:
select count(*) from public.tbdetallespedidos where cantidad = 0;

-- Actualizar a 10 el campo cantidad cuando sea cero
update tbdetallespedidos set cantidad = 10 where cantidad = 0;

-- Campo calculado: importe de cada producto en los detalles de pedido: cálculo por fila
select idpedido, idproducto, preciounidad, cantidad, descuento, 
round( cast( (preciounidad * cantidad * (1-descuento/100)) as numeric),2) as total
from public.tbdetallespedidos
order by idpedido;

-- Obtener los subtotales por producto del pedido: 10248.
select idpedido, idproducto, preciounidad, cantidad, descuento, 
round( cast( (preciounidad * cantidad * (1-descuento/100)) as numeric),2) as total
from public.tbdetallespedidos where idpedido = 10248;

-- Calcular el número de productos que lleva el pedido: 10248
select sum(cantidad) as total from public.tbdetallespedidos
where idpedido = 10248;

-- Total del pedido 10248:
select sum(cast( (preciounidad * cantidad * (1-descuento/100)) as numeric)) as total
from public.tbdetallespedidos where idpedido = 10248;

-- Productos: cuántos se empaquetan en frascos:
select count(*) from tbproductos where cantidadporunidad like '%frascos%';

-- Obtener los países donde se emiten pedidos:
select distinct paisdestinatario from tbpedidos order by 1;
select paisdestinatario from tbpedidos group by 1 order by 1;

-- Cuántos pedidos se han generado por país:
select paisdestinatario, count(*) as numero_pedidos
from tbpedidos group by 1 order by 2 desc;

-- Pedidos realizados em el 1997:
select * from tbpedidos where fechapedido between '1/1/1997' and '31/12/1997';

-- Cuántos pedidos se han generado por país en el año 1997:
select paisdestinatario, date_part('year', fechapedido) as año, count(*) as numero_pedidos
from tbpedidos 
where fechapedido between '1/1/1997' and '31/12/1997'
group by 1, 2 order by 3 desc;


select
paisdestinatario,
count(id),
extract (year from fechapedido)
from public.tbpedidos
where fechapedido between '1/1/1997' and '31/12/1997'
group by 1, extract (year from fechapedido)
order by 2 desc;


select paisdestinatario, date_part('year', fechapedido) as año
from tbpedidos 
where fechapedido between '1/1/1997' and '31/12/1997'
order by 2,1 desc;

-- Que países tiene más de 50 pedidos en total:
-- Condición afecta al grupo --> HAVING
select paisdestinatario, count(*) as numero_pedidos
from tbpedidos 
group by 1 
having count(*) > 50
order by 2 desc;

-- Que países tiene más de 50 pedidos en el año 1997:
select paisdestinatario, count(*) as numero_pedidos
from tbpedidos 
where date_part('year', fechapedido) = 1997
group by 1 
having count(*) > 50
order by 2 desc;


-- Que países tiene entre 30 y 50 pedidos en el año 1997:
select paisdestinatario, count(*) as numero_pedidos
from tbpedidos 
where date_part('year', fechapedido) = 1997
group by 1 
having count(*) between 30 and 50
order by 2 desc;

-- Campos calculados con fechas:
select id, fechapedido, fechaenvio, fechaenvio - fechapedido as dias_almacen 
from tbpedidos;

-- Media en días del tiempo que se tarda en preparar los pedidos:
select round(cast (avg(fechaenvio - fechapedido) as numeric), 2) as media_dias_almacen, 
min(fechaenvio - fechapedido) as minimo,
max(fechaenvio - fechapedido) as maximo
from tbpedidos;

select * from tbpedidos 
where fechapedido is null or fechaenvio is null or fechaentrega is null;

-- Actualizar la fechaenvio  a fechapedido + 5
update tbpedidos set fechaenvio = fechapedido + 5 where fechaenvio is null;


-- Los 5 productos más caros:
select nombre, preciounidad from tbproductos order by 2 desc limit 5;





