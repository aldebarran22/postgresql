
-- Ejemplos de joins con la bd empresa3:

-- Obtener un listado de productos donde aparezca el nombre de la categoría, del producto y el precio:

select c.nombre as categoria, p.nombre as producto, p.preciounidad
from tbcategorias c inner join tbproductos p on c.id = p.idcategoria
order by 1,2;



-- Los nombres de los productos que se han vendido:
select distinct p.nombre from tbproductos p inner join tbdetallespedidos d on p.id = d.idproducto order by 1;

-- Obtener el número de veces que se ha vendido cada producto y queremos ver primero los más vendidos:
select p.nombre, count(*) as cuenta from tbproductos p inner join tbdetallespedidos d on p.id = d.idproducto 
group by 1
order by 2 desc;

-- Los que se han vendido más de 40 veces:
select p.nombre, count(*) as cuenta from tbproductos p inner join tbdetallespedidos d on p.id = d.idproducto 
group by 1
having count(*) >= 40
order by 2 desc;

-- Dar de alta una nueva categoria: helados
select max(id)+1 as ultimo from tbcategorias;

insert into tbcategorias values( (select max(id)+1 as ultimo from tbcategorias) , 'Helados');

-- Obtener el número de productos de cada categoría, y que aparezca helados con un 0:
-- OJO contar de la tabla productos: p.id
select c.nombre, count(p.id) as cuenta from tbcategorias c  
left join tbproductos p on c.id = p.idcategoria
group by c.id, c.nombre
order by c.id;

-- Para ver solo el 0:
select c.nombre, count(p.id) as cuenta from tbcategorias c  
left join tbproductos p on c.id = p.idcategoria
group by c.id, c.nombre
having  count(p.id) = 0
order by c.id;

-- Obtener un listado de productos que aparezca el nombre de la categoría, del proveedor y del producto:
select c.nombre as categoria, pr.nombre as proveedor, p.nombre as producto
from tbcategorias c
inner join tbproductos p on c.id = p.idcategoria
inner join tbproveedores pr on pr.id = p.idproveedor
order by 1,2,3;


select c.nombre as categoria, pr.nombre as proveedor, p.nombre as producto
from tbcategorias c
inner join tbproductos p on c.id=p.idcategoria
inner join tbproveedores pr on pr.id=p.idproveedor;



-- El nombre de los clientes que me compran Bebidas:
select c.nombre as cliente, cat.nombre as categoria, pr.nombre as producto
from tbclientes c 
inner join tbpedidos p on c.id = p.idcliente
inner join tbdetallespedidos d on p.id = d.idpedido
inner join tbproductos pr on d.idproducto = pr.id
inner join tbcategorias cat on pr.idcategoria = cat.id
where cat.nombre = 'Bebidas'
order by 1,2,3;

-- Solo el cliente:
select distinct c.nombre as cliente
from tbclientes c 
inner join tbpedidos p on c.id = p.idcliente
inner join tbdetallespedidos d on p.id = d.idpedido
inner join tbproductos pr on d.idproducto = pr.id
inner join tbcategorias cat on pr.idcategoria = cat.id
where cat.nombre = 'Bebidas'
order by 1;







