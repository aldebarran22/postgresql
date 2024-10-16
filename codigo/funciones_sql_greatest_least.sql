-- Obtener el precio del producto mas caro entre los precios de los productos
-- y los precios de la tabla de detalles de pedidos: greatest

select p.nombre, p.preciounidad, d.preciounidad,
greatest(p.preciounidad, d.preciounidad) as precio_mayor,
least(p.preciounidad, d.preciounidad) as precio_menor
from tbproductos p inner join tbdetallespedidos d on p.id = d.idproducto;



