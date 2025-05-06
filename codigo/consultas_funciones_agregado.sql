
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











