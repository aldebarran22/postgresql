-- SQL Parametrizado:
-- Define la consulta con un parámetro
prepare query_pedidos(text) as
select id, paisdestinatario from tbpedidos where paisdestinatario=$1;

-- Ejecuta la consulta indicando el nombre de la consulta y el valor del 
-- parámetro
execute query_pedidos('Noruega');
execute query_pedidos('Italia');

-- Definir una consulta que sume los pedidos que están dentro de un rango
-- que se indica por parámetro:
deallocate sumaPedidos; -- Borrar el prepare
prepare sumaPedidos(numeric,numeric) as
select sum(cargo) as total from tbpedidos 
where cargo between $1 and $2;

execute sumaPedidos(1,1);

select cargo as total from tbpedidos 
where cargo between 1 and 1;

