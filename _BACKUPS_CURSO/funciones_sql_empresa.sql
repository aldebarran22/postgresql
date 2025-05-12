SHOW lc_time;

-- Para cambiar a español
--SET lc_time = 'es_ES.UTF-8';  


-- Funciones:

-- Recuento de pedidos mensual del año 1997, ordenado por nombre del mes:
select now();

-- Nombre del mes:
select to_char(now(), 'TMMonth');

-- Número del mes:
select cast(to_char(now(), 'MM') as integer);

select fechapedido, to_char(fechapedido, 'TMMonth') as mes
from tbpedidos limit 10;