
-- Campos calculados con CASE:

-- Categoria: 
-- DE < 250 NORMAL
-- DE 250 A 300 SUPER
-- SUPERIOR A 300 VIP


-- Calcular número de pedidos por empresa y añadir un campo calculado en función del número de pedidos que mueve:
select e.nombre, count(p.id) as cuenta,
case
	when count(p.id) between 0 and 250 then 'NORMAL'
	when count(p.id) between 251 and 300 then 'SUPER'
	when count(p.id) between 301 and 320 then 'VIP'
	else 'otro valor'
end as categoria
from public.tbcompaniaenvios e 
inner join tbpedidos p on p.idcompanya = e.id
group by 1;


select nombre, 'VIP' from public.tbcompaniaenvios;