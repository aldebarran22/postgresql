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








