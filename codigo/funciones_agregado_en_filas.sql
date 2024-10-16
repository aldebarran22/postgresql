
--  Funciones de agregado a nivel de filas:
-- select funcionAgregado(columna) from tabla where cond.

-- cuantos clientes tengo:
select count(*) as numClientes from tbclientes;

-- Cuantos pedidos son de Alemania:
select count(id) as numPedidos from tbpedidos 
where paisdestinatario = 'Alemania';

-- Calcular el número de pedidos que están con fechas mal: No hay
select id, fechaenvio - fechapedido as diasAlmacen
from tbpedidos
where (fechaenvio - fechapedido) < 0;

-- Calcular la media en días del tiempo que se tarda en preparar los pedidos
-- en el almacén:
select avg(fechaenvio - fechapedido) as mediaEnDias, 
max(fechaenvio - fechapedido) as maxDias,
min(fechaenvio - fechapedido) as minDias
from tbpedidos;

/*
select campos 
from tabla 
where criterios 
group by cols 
having cri-grupo 
order by col
*/

-- Número de pedidos realizados por cliente:
select idcliente, count(*) as numPedidos
from tbpedidos
group by idcliente
order by 2 desc;

-- Clientes que han realizado más de 15 pedidos:
select idcliente, count(*) as numPedidos
from tbpedidos
group by idcliente
having count(*) > 15
order by 2 desc;

-- Cuantos pedidos se han realizado en el año 1996 (fecha de pedido):
select count(id) as cuenta from tbpedidos
where fechapedido between '01/01/1996' and '31/12/1996';

-- Obtener el importe por pedido a partir de los productos que incluye:
-- De todos los pedidos:

select sum(importe) from (
select idpedido, 
sum(preciounidad * cantidad * (1 - descuento/100)) as importe
from tbdetallespedidos
group by idpedido);

-- Suma total con el redondeo a nivel de producto:
select sum(importe) from (
select idpedido, 
sum(cantidad * round(cast (float8 (preciounidad * (1 - descuento/100)) as numeric),2)) as importe
from tbdetallespedidos
group by idpedido);















