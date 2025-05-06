
/* Funciones de agregado sobre toda la tabla o filas que cumplan condiciones */

-- Calcular el precio medio de los productos:
select count(nombre) as num_regs, avg(preciounidad) as precio_medio, 
max(preciounidad) as mas_caro,  min(preciounidad) as mas_barato
from tbproductos;


-- Nombre del producto más caro:
select max(preciounidad) as mas_caro from tbproductos;
select nombre, preciounidad from tbproductos where preciounidad=263;

-- Directamente: subconsulta
select nombre, preciounidad from tbproductos where preciounidad=(select max(preciounidad) from tbproductos);

-- Obtener los productos que tienen un precio superior a la media:
select nombre, preciounidad from tbproductos where preciounidad > (select avg(preciounidad) from tbproductos) order by 2 desc;

-- Cuantos productos tienen un precio entre 20 y 50 euros:
select count(nombre) from tbproductos where preciounidad >= 20 and preciounidad <= 50;
select count(id) from tbproductos where preciounidad between 20 and 50;

-- A cuántos países se emiten pedidos: Cuenta sin repetidos:
select count(distinct paisdestinatario) as num_paises from tbpedidos;

-- Países a los que se emiten pedidos:
select distinct paisdestinatario from tbpedidos order by 1;
select paisdestinatario from tbpedidos group by paisdestinatario order by 1;


-- Cuántos pedidos se emiten a Belgica:
select count(*) as cuenta from tbpedidos where paisdestinatario = 'Belgica';


-- Resultado final obtener el promedio en dias del tiempo de transporte y de gestión almacén:
select fechaenvio - fechapedido as dias_almacen, fechaentrega - fechaenvio as dias_transporte from tbpedidos order by 2;

-- Contar los pedidos que tienen error en las fechas:
select  count(*) as num_fechas_mal from tbpedidos where fechaentrega - fechaenvio < 0;
select  count(*) as num_fechas_mal from tbpedidos where fechaentrega < fechaenvio;


-- Obtener un promedio de los días que tarda el transporte en llegar al destino: tener en cuenta los registros mal:
select  avg(fechaentrega - fechaenvio) as media_transporte from tbpedidos where fechaentrega > fechaenvio;


-- Detalles de pedidos:
-- Cambiar el campo cantidad de tbdetallespedidos que esté a 0 a 5:
select count(*) as cuenta from tbdetallespedidos where cantidad = 0;
update tbdetallespedidos set cantidad = 5 where cantidad = 0;


-- Cálculo por cada fila y después aplicar una función de agregado:
-- Crear un campo calculado para obtener el total por producto:
select idpedido, idproducto, preciounidad, cantidad, preciounidad * cantidad * (1-(descuento/100.0)) as total
from tbdetallespedidos order  by 1,2;

-- Calcular el total de todos los productos:
select sum(preciounidad * cantidad * (1-(descuento/100.0))) as total
from tbdetallespedidos;

-- Errores típicos al agrupar: ERROR idproducto tenemos que aplicar una función de agregado o que agrupe también
select idpedido, idproducto from tbdetallespedidos
group by idpedido;


-- Sacar el número de productos por pedido: MAL, METEMOS COLUMNAS DE MAS PARA FORMAR GRUPOS
select idpedido, idproducto, count(*) as cuenta from tbdetallespedidos
group by idpedido, idproducto;

-- número de productos por pedido:
select idpedido, count(*) as cuenta from tbdetallespedidos
group by idpedido order by 1;


-- Obtener el importe por pedido:
select idpedido, sum(preciounidad * cantidad * (1-(descuento/100.0))) as total
from tbdetallespedidos
group by 1
order by 1;

-- Lo mismo que antes pero sólo queremos los pedidos superiores a 3000 eur.
select idpedido, sum(preciounidad * cantidad * (1-(descuento/100.0))) as total
from tbdetallespedidos
group by 1
having sum(preciounidad * cantidad * (1-(descuento/100.0))) >= 3000
order by 2 desc;

select idpedido, sum(preciounidad * cantidad * (1-(descuento/100.0))) as total
from tbdetallespedidos
group by 1
having sum(preciounidad * cantidad * (1-(descuento/100.0))) between 3000 and 3050
order by 2 desc;






-- Filas sin descuento:
select * from tbdetallespedidos where descuento = 0;


/* Ojo con las prioridades: de mayor a menor
^ potencia
* /  %
+ -
*/

select 7/2.0;
select 7/2;

select 5+7/2;
select (5+7)/2;

-- Número de pedidos por pais y cliente:
select paisdestinatario, idcliente, count(id) as cuenta from tbpedidos
group by 1,2
order by 1,2;











