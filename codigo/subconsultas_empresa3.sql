-- Subconsultas con in
select id from tbpedidos
where id not in (select idpedido from tbdetallespedidos);

-- Con los operadores de conjuntos: except (pedidos y detalles de pedido)
-- ¿Qué pedidos no tienen productos?
select id from tbpedidos
except 
select idpedido from tbdetallespedidos;

-- Productos que tiene un precio superior a la media:
select nombre, preciounidad from tbproductos 
where preciounidad > (select avg(preciounidad) from tbproductos);
select avg(preciounidad) from tbproductos;


-- El nombre del producto más caro:
select p.nombre, p.preciounidad from tbproductos p
where p.preciounidad = (select max(p.preciounidad) from tbproductos p);

-- Hay algún pedido de Finlandia que sea de un producto de la 
-- categoria de Bebidas:

select p.id, p.nombre from tbproductos p inner join tbcategorias c on
c.id = p.idcategoria where c.nombre = 'Bebidas';


select distinct c.nombre
from tbproductos p 
inner join tbcategorias c on c.id = p.idcategoria
inner join tbdetallespedidos d on d.idproducto = p.id
inner join tbpedidos pe on pe.id = d.idpedido
where pe.paisdestinatario = 'Noruega';

select paisdestinatario, count(*) as cuenta
from tbpedidos
group by paisdestinatario
order by 2;


select pe.paisdestinatario, c.nombre 
from tbpedidos pe, tbcategorias c  
where pe.paisdestinatario = 'Finlandia' and 
c.nombre = any (select c.nombre from tbcategorias c
               inner join tbproductos po on c.id = po.idcategoria
               inner join tbdetallespedidos d on po.id = d.idproducto
               inner join tbpedidos pe on d.idpedido = pe.id where c.nombre like '%ebidas')


-- Todos los productos que van a Finlandia son de Bebidas

select pe.paisdestinatario, c.nombre 
from tbpedidos pe, tbcategorias c;




