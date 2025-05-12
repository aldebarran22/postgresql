SHOW lc_time;

-- Para cambiar a español
--SET lc_time = 'es_ES.UTF-8';  


-- Funciones fecha/hora:

-- Recuento de pedidos mensual del año 1997, ordenado por nombre del mes:
select now();

-- Nombre del mes:
select to_char(now(), 'TMMonth');

-- Número del mes:
select cast(to_char(now(), 'MM') as integer);

select fechapedido, to_char(fechapedido, 'TMMonth') as mes
from tbpedidos limit 10;

select  cast(to_char(fechapedido, 'MM') as integer) as num_mes, 
to_char(fechapedido, 'TMMonth') as mes, 
count(id) as cuenta from tbpedidos 
where date_part('year',fechapedido)=1997
group by 1, 2
order by 1;

select current_date + interval '2 month';
select current_date - interval '3 year'

select now(), cast(to_char(now(), 'mi') as integer) as minutos;


-- Otras funciones, sin unidad son segundos:
select pg_sleep(2);

