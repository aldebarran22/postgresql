update tbdetallespedidos 
set cantidad = 10
where cantidad = 0;


select sum(preciounidad * cantidad * (1-descuento/100.0)) as total
from tbdetallespedidos
where idpedido = 10249;


/* FUNCIONES DE SQL PROGRAMADAS */

-- Definir una función que calcule el importe total de un pedido. El parámetro será el idpedido:
create or replace function calcularImportePedido(idpedido integer) returns float
as 'select sum(preciounidad * cantidad * (1-descuento/100.0)) as total
from tbdetallespedidos
where idpedido = $1'
language 'sql';

-- Calcular importe de un pedido con la función:
select calcularImportePedido(10248);

select id, calcularImportePedido(id) from tbpedidos;