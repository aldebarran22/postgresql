
-- CREAR UN TRIGGER QUE COPIE LOS PEDIDOS QUE SE VAN BORRANDO A UN HISTORICO DE PEDIDOS ADEMAS QUE AÑADA
-- UNA MARCA DE TIEMPO DE CUANDO SE HIZO EL BORRADO

-- Copiar la estructura de la tabla de tbpedidos sin datos
create table tbpedidos_historico
as (select * from tbpedidos where id=-1);

-- Añadir una columna de tipo timestamp
alter table tbpedidos_historico
add column tiempo timestamp;

-- Añadir el usuario que lo borra
alter table tbpedidos_historico
add column usuario text;


-- Crear la función del trigger
create or replace function copiar_pedido() returns trigger as $generarHistoPedidos$
begin
	-- Copiar el pedido al histórico
	insert into tbpedidos_historico select old.*, now(), current_user;
	return null;
end;
$generarHistoPedidos$ language plpgsql;


-- Crear el trigger en after delete sobre la tabla tbpedidos
create or replace trigger generarHistoPedidos
after delete on tbpedidos
for each row execute function copiar_pedido();


-- Borrar pedidos de la tabla tbpedidos
select count(*) from tbpedidos where paisdestinatario='Suiza';

delete from tbpedidos where paisdestinatario='Suiza';

select * from tbpedidos_historico;
