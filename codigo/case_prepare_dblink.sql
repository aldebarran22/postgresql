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
