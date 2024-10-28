-- Funciones de SQL con los pedidos

-- Obtener la fecha de pedido y luego en dia nombre del mes en mayúsculas y el año con 4 dígitos.

set lc_time = 'es_ES.UTF-8';
select fechapedido, to_char(fechapedido, 'TMDAY DD TMMONTH YYYY') from tbpedidos;

-- De los pedidos obtener el idpedido y el cargo. El cargo como mínimo será 10.
select id, cargo, greatest(10, cargo) from tbpedidos;

