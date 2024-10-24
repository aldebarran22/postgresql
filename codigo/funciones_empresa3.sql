
select to_char(now(), 'TMMonth');

-- Obtener numero de pedidos por mes (indicando el nombre) durante el año 1997, ordenado por el nombre del mes: enero, febrero ... diciembre
select to_char(fechapedido, 'TMMonth') as mes, count(id) as total_mes
from tbpedidos
where extract(year from fechapedido) = 1997
group by extract(month from fechapedido), to_char(fechapedido, 'TMMonth')
order by extract(month from fechapedido);



-- Nombre del mes que mas pedidos tiene
with meses as (select to_char(fechapedido, 'TMMonth') as mes, count(id) as total_mes
from tbpedidos
where extract(year from fechapedido) = 1997
group by extract(month from fechapedido), to_char(fechapedido, 'TMMonth')
order by extract(month from fechapedido))
select mes from meses where total_mes = (select max(total_mes) from meses);


create temp table tbmeses as (select to_char(fechapedido, 'TMMonth') as mes, count(id) as total_mes
from tbpedidos
where extract(year from fechapedido) = 1997
group by extract(month from fechapedido), to_char(fechapedido, 'TMMonth')
order by extract(month from fechapedido));


select * from tbmeses;

select * from tbmeses order by 2 desc limit 3;

drop table tbmeses;





