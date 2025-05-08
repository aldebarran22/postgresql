
-- Ejemplos de subconsultas:


-- Operador IN
-- Pedidos de estos 3 paises:
select * from tbpedidos where paisdestinatario in ('Francia','Austria','Suiza')
order by paisdestinatario;


-- Todos los pedidos que no sean de Alemania o Estados Unidos;
select * from tbpedidos where paisdestinatario not in ('Alemania','Estados Unidos')
order by paisdestinatario;

-- Implementar con IN:
select nombre from tbclientes 
where id in (select idcliente from tbpedidos where id in 
				(select idpedido from tbdetallespedidos where idproducto in
					(select id from tbproductos where idcategoria in
						(select id from tbcategorias where nombre = 'Bebidas')
					)
				)
			)
order by nombre;


-- Operadores a nivel de conjuntos:
-- Obtener los nombres de las categorías que no tienen productos:
select nombre from tbcategorias
except
select distinct c.nombre from tbcategorias c inner join tbproductos p on c.id=p.idcategoria;




-- Select en distintas claúsulas:
-- select campos from tabla;
-- select campos from (select * from tabla2);
-- select campos from where campo op (select ....)
-- select ... (select ...) from tabla;

select 122 / 829.0 * 100;

-- Obtener el número de pedidos por país en unidades y en porcentaje:
select paisdestinatario, count(id) as numero_pedidos, 
count(id) / cast((select count(*) from tbpedidos) as double precision) * 100.0 as porcentaje
from tbpedidos
group by paisdestinatario
order by 1;


-- Lo mismo utilizando With:
with recuento_por_pais as (
select paisdestinatario as pais, count(id) as numero_pedidos, 
count(id) / cast((select count(*) from tbpedidos) as numeric) * 100.0 as porcentaje
from tbpedidos
group by paisdestinatario
order by 1
)
select pais, numero_pedidos, round(porcentaje,2) from recuento_por_pais;

-- Ejemplo con funciones de redondeo:
select trunc(23.567, 2), round(23.567, 2), ceil(23.567), floor(23.567);


-- Ejemplo con una subconsulta con ANY/SOME: se tiene que cumplir alguna de las condiciones:
select * from tbproductos where preciounidad = ANY(array[10,20,30]);
select * from tbproductos where preciounidad = SOME(array[10,20,30]);

select * from tbproductos where preciounidad in (10,20,30);

-- select .... where campo = any(select ....)
-- Comprobar si hay algún precio (ANY) / o todos (ALL) de la categoria de bebidas que sea mayor que los precios de los productos lacteos.

select p.nombre, p.preciounidad from tbproductos p
inner join tbcategorias c on p.idcategoria = c.id
where c.nombre = 'Bebidas' 
and p.preciounidad > any(select p.preciounidad from tbproductos p
							inner join tbcategorias c on p.idcategoria = c.id
							where c.nombre = 'Lacteos');


select p.nombre, p.preciounidad from tbproductos p
inner join tbcategorias c on p.idcategoria = c.id
where c.nombre = 'Lacteos';



update tbproductos set preciounidad = 12 where nombre = 'Queso de cabra';












