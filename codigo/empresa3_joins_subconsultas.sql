
/* jOINS Y SUBCONSULTAS */

-- Obtener los nombres de los proveedores que nos surten productos de bebidas:
select distinct pv.nombre from tbproveedores pv
inner join tbproductos p on pv.id = p.idproveedor
inner join tbcategorias c on c.id = p.idcategoria
where c.nombre = 'Bebidas'
order by 1;


-- OJO ESTO NO ES CORRECTO: ESTOY RELACIONANDO DATOS QUE NO LO ESTAN: HAY QUE UTILIZAR LA TABLA PUENTE DE PRODUCTOS
select c.nombre, p.nombre from tbcategorias c
inner join tbproveedores p on c.id = p.id;


-- Cual es la empresa de envios que más pedidos realiza:
select c.nombre, count(p.id) as cuenta
from public.tbcompaniaenvios c
inner join tbpedidos p on p.idcompanya = c.id
group by 1
order by 2 desc;

-- Obtener los nombres de las categorías que NO tienen productos: con conjuntos.
select nombre from tbcategorias
where id = (select id from tbcategorias 
except 
select distinct idcategoria from tbproductos);

select nombre from tbcategorias
except
select distinct c.nombre from tbcategorias c
inner join tbproductos p on c.id = p.idcategoria;

-- Operador IN
select id, paisdestinatario  from tbpedidos
where paisdestinatario in ('Suiza', 'Francia','Finlandia')
order by 2;

-- Operadores relacionales (=, >, >=,  <, <=, <>, !=) y subconsultas

-- Obtener el precio del producto más caro:

-- Paso 1: buscar el precio mayor:
select max(preciounidad) as maximo from tbproductos;

-- Paso 2 nombre del producto más caro;
select nombre from tbproductos where preciounidad = 263;

-- En solo paso:
select nombre from tbproductos where preciounidad = (select max(preciounidad) as maximo from tbproductos);

-- Cuantos productos tienen un precio superior al precio medio:
select count(id) as cuenta from tbproductos
where preciounidad > (select avg(preciounidad) from tbproductos);

select avg(preciounidad) from tbproductos;

-- Obtener número de pedidos por compañia de envio:
select c.nombre, count(p.id) as cuenta
from public.tbcompaniaenvios c
inner join tbpedidos p on p.idcompanya = c.id
group by 1
order by 2 desc;

-- Sobre la anterior obtener el % de pedidos que envían:

-- Número de pedidos:
select count(*) from tbpedidos;

-- Calcular porcentajes con el dato anterior:
select c.nombre, count(p.id) as cuenta, (count(*) * 100.0 / 829) as porcentaje
from public.tbcompaniaenvios c
inner join tbpedidos p on p.idcompanya = c.id
group by 1
order by 2 desc;

-- En un solo paso:
select c.nombre, count(p.id) as cuenta, round( cast(count(*) * 100.0 / (select count(*) from tbpedidos) as numeric), 2) as porcentaje
from public.tbcompaniaenvios c
inner join tbpedidos p on p.idcompanya = c.id
group by 1
order by 2 desc;


-- Consulta con With:
with pedidos as
(select c.nombre as nombreCliente, e.nombre || ' ' || e.apellidos as nombreEmpleado, ep.nombre as Empresa, fechaPedido
from tbpedidos p 
inner join tbclientes c on p.idcliente = c.id
inner join public.tbcompaniaenvios ep on ep.id = p.idcompanya
inner join tbempleados e on e.id = p.idempleado)
select * from pedidos where fechapedido between '1/1/1997' and '31/12/1997';


-- Consultas preparadas:
-- Dar de alta nuevas categorias:
prepare insertar_categoria(varchar) as
insert into tbcategorias(id,nombre) values((select max(id)+1 from tbcategorias), $1);

-- Ejecutar la consulta parametrizada
execute insertar_categoria('Cine');

-- Borrar
deallocate insertar_categoria;













