-- Joins con la BD Empresa3:

-- Listado de nombre de categoría, nombre producto
select c.nombre, p.nombre 
from tbcategorias c inner join tbproductos p
on c.id = p.idcategoria
order by 1,2;

select c.nombre, p.nombre 
from tbcategorias c right join tbproductos p
on c.id = p.idcategoria
order by 1,2;

-- Obtener las categorias que no tiene productos:
select c.nombre
from tbcategorias c left join tbproductos p
on c.id = p.idcategoria
where p.nombre is null;


-- Número de productos por categoría, mostrando las que tienen cero
select c.nombre as categoria, count(p.id) as cuenta 
from tbcategorias c left join tbproductos p
on c.id = p.idcategoria
group by 1
order by 1,2;


-- Número de productos por categoría, NO mostrando las que tienen cero
select c.nombre as categoria, count(p.id) as cuenta 
from tbcategorias c inner join tbproductos p
on c.id = p.idcategoria
group by 1
order by 1,2;

-- Número de productos por categoría, NO mostrando las que tienen cero
select c.nombre as categoria, count(p.id) as cuenta 
from tbcategorias c right join tbproductos p
on c.id = p.idcategoria
group by 1
order by 1,2;

-- Listado de Categoria, Proveedor y producto:
select c.nombre as categoria, pr.nombre as proveedor, p.nombre as producto
from tbcategorias c 
inner join tbproductos p on c.id = p.idcategoria
inner join tbproveedores pr on pr.id = p.idproveedor
order by 1,2,3;




