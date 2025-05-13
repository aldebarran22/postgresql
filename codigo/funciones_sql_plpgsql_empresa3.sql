
-- Funciones:

-- Recuperar el cargo de un pedido:
create or replace function getCargoPedido(id_pedido numeric) returns numeric as
$$
	select cargo from tbpedidos where id = id_pedido;	
$$ 
language sql;


-- Calcular el importe de una linea de pedido: idpedido, idproducto
create or replace function calcularLineaPedido(numeric, numeric) returns numeric as
$$
	select preciounidad * cantidad * (1-descuento/100.0) from tbdetallespedidos where idpedido=$1 and idproducto=$2;
$$
language sql;


-- Partir una cadena en palabras:
create or replace function split(texto text) returns table(palabra text) as
$$
	select unnest(string_to_array(texto, ' '));
$$
language sql;

-- Una función sql que nos devuelve el próximo id de la tabla de categorias:
create or replace function proximoIdCat() returns numeric as
$$
	select max(id)+1 from tbcategorias;
$$
language sql;


create or replace function ultimoDiaMes(fecha date) returns date as
$$
	select date_trunc('month', fecha) + interval '1 month - 1 day';
$$
language sql;



-- Prueba funciones:
select getCargoPedido(10248) as cargo;
select calcularLineaPedido(10248, 1) as subtotal;

select unnest(array[1,2,3,4,5]);

select string_to_array('hola que tal', ' ');

select split('hola que tal estas');

select proximoIdCat();

select date_trunc('month', current_date);





