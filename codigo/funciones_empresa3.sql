
select to_char(now(), 'TMMonth');

-- Obtener numero de pedidos por mes (indicando el nombre) durante el año 1997, ordenado por el nombre del mes: enero, febrero ... diciembre
select count(id) as total_mes
from tbpedidos
where extract(year from fechapedido) = 1997;