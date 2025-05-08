--- Varias cosas: sentencia CASE, consultas parametrizadas y extensión dblink

-- CASE:

-- número de pedidos por compañía de envíos:
select c.nombre, count(p.id) as cuenta 
from tbpedidos p 
inner join tbcompaniaenvios c on c.id = p.idcompanya
group by c.nombre;



-- Añadir un campo calculado (una etiqueta) que hace referencia al número de pedidos de cada compañia:
select c.nombre, count(p.id) as cuenta,
case
	when count(p.id) < 250 then 'NORMAL'
	when count(p.id) between 250 and 300 then 'SUPER'
	when count(p.id) between 301 and 350 then 'VIP'
	else 'NO PROCEDE'		
end as etiqueta
from tbpedidos p 
inner join tbcompaniaenvios c on c.id = p.idcompanya
group by c.nombre;


-- 
select min(preciounidad), avg(preciounidad), max(preciounidad) from tbproductos;

-- Obtener en los productos una etiqueta para indicar si el producto es barato, medio, caro hacerlo con with
with productos_etiquetados as
(
	select id, nombre, preciounidad,
	case
		when preciounidad < 25 then 'BARATO'
		when preciounidad < 75 then 'MEDIO'
		when preciounidad < 100 then 'CARO'
		else 'MUY CARO'
	end as etiqueta
	from tbproductos
)
select etiqueta, count(*) as cuenta 
from productos_etiquetados 
group by etiqueta;

-- prepare: consultas parametrizadas:
-- Definición del prepare
prepare contar_pedidos_pais(text) as
select count(*) as cuenta from tbpedidos where paisdestinatario = $1;

-- Uso del prepare:
execute contar_pedidos_pais('Alemania');
execute contar_pedidos_pais('Suiza');

-- Para borrar el prepare:
deallocate contar_pedidos_pais;

-- Un prepare que recibe dos valores enteros (integer), y buscar los pedidos que tengan un cargo dentro del intervalo:

PREPARE buscar_cargo AS
(SELECT * FROM tbpedidos WHERE cargo BETWEEN $1 AND $2 order by cargo);

execute buscar_cargo(30,50);

deallocate buscar_cargo;









