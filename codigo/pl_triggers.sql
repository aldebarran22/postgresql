

-- Triggers:

-- Crear una tabla para el histórico de pedidos:
create table tbpedidos_historico as (select * from tbpedidos where id = -1);

-- Añadir un par de columnas a la tabla del histórico:
alter table tbpedidos_historico 
add column tiempo timestamp;

alter table tbpedidos_historico 
add column usuario varchar(20);


/* Otra forma más corta:
create table pedidos_historico as (select tbpedidos.*,
null::varchar(20) as user,
null::timestamp as hora from tbpedidos where id=-1)

*/

-- La función que ejecutamos cuando se lanza el trigger:
create or replace function copiar_pedido() returns trigger as $generarPedidoHistorico$
begin
	-- Una consulta para copiar el pedido a la tabla de pedidos histórico y además la marca de tiempo y el usuario:
	raise info 'borramos: %', old;
	insert into tbpedidos_historico select old.*, now(), current_user;
	return null;
end;
$generarPedidoHistorico$ language plpgsql;


create or replace trigger generarPedidoHistorico
after delete on tbpedidos
for each row execute function copiar_pedido();

call borrarpedido(10252);


