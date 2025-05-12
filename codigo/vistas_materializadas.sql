
-- Vistas materializadas:
create materialized view  ultimos_productos as
select p.id, p.nombre, p.idproveedor, p.idcategoria, p.preciounidad, p.unidadesenpedido, 
p.cantidadporunidad, p.unidadesenexistencia 
from tbproductos p
where p.id >= 200;

select * from ultimos_productos;


insert into tbproductos values(203, 'Piña', 1, 7, 3, 50, 'cajas de 2kg', 30);
insert into tbproductos values(204, 'Sandía', 1, 7, 3, 50, 'cajas de 2kg', 30);

-- No debería de mostrar los dos nuevos productos
select * from ultimos_productos;

-- Refrescar la vista:
refresh materialized view ultimos_productos;

-- Debería mostrar los dos nuevos productos
select * from ultimos_productos;


insert into tbproductos values(205, 'Melón', 1, 7, 3, 50, 'cajas de 2kg', 30);

-- No debería de mostrar el último producto:
select * from ultimos_productos;


-- Obtener el nombre y la categoria de los últimos productos:
select p.nombre, c.nombre from ultimos_productos p
inner join tbcategorias c on c.id = p.idcategoria;



