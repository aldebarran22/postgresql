
-- Consultas con varias tablas:
select c.nombre as nombreCat, p.nombre as nombreProd
from tbcategorias c, tbproductos p
where c.id = p.idcategoria
order by 1,2

-- Número de productos por cada categoría:
select c.nombre as nombreCat, count(*) 
from tbcategorias c, tbproductos p 
where c.id = p.idcategoria 
group by c.nombre;

-- Obtener el nombre del producto, de la categoría y del proveedor:
select c.nombre as nombreCat, pv.nombre as nombreProveedor, p.nombre as nombreProd
from tbcategorias c, tbproductos p, tbproveedores pv
where c.id = p.idcategoria and pv.id = p.idproveedor
order by 1,2,3;

-- Numero de resultados:
select 9*8*75;

-- Obtener todos los clientes del Empleado "Nancy Davolio"
select count(distinct c.nombre) from tbclientes c
inner join tbpedidos p on c.id = p.idcliente
inner join tbempleados e on e.id = p.idempleado
where e.nombre = 'Nancy' and e.apellidos = 'Davolio';

-- Total del cargo en pedidos:
select sum(cargo) as total from tbpedidos;

-- Total cargo por país:
select paisdestinatario, count(id) as numpedidos, sum(cargo) as total 
from tbpedidos
group by paisdestinatario
order by 3 desc;

-- Calcular el % de facturación por cada país:
select paisdestinatario, count(id) as numpedidos, 
sum(cargo) as total, 
sum(cargo) / (select sum(cargo) from tbpedidos) * 100 as porcentaje
from tbpedidos
group by paisdestinatario
order by 3 desc;

select 'hola' || ' ' || 'adios';




