
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


drop function ultimoDiaMes;

create or replace function ultimoDiaMes(date) returns date as
$$
	select date_trunc('month', $1) + interval '1 month - 1 day';
$$
language sql;


create or replace function precioMedioProductos() returns numeric as 
$$
	select avg(preciounidad) from tbproductos;
$$
language sql;


create or replace function precioMedioProductosCat(categoria text) returns numeric as 
$$
	select avg(preciounidad) from tbproductos p inner join tbcategorias c on p.idcategoria = c.id where lower(c.nombre) = lower(categoria);
$$
language sql;



create or replace function nuevaCategoria(nuevoid numeric, categoria text) returns numeric as
$$
	insert into tbcategorias values(nuevoid, categoria) returning id;
$$
language sql;


-- Prueba funciones:
select nuevaCategoria(proximoIdCat(), 'Tartas');



select precioMedioProductosCat('bebidas'), precioMedioProductosCat('BEBIDAS'), precioMedioProductosCat('beBIDaS');

select precioMedioProductos();
-- Obtener productos por encima de la media:
select * from tbproductos where preciounidad > precioMedioProductos() order by preciounidad;



select getCargoPedido(10248) as cargo;
select calcularLineaPedido(10248, 1) as subtotal;

select unnest(array[1,2,3,4,5]);

select string_to_array('hola que tal', ' ');

select split('hola que tal estas');

select proximoIdCat();

select date_trunc('month', current_date);

select ultimoDiaMes(current_date);

select fechapedido, ultimoDiaMes(fechapedido) from tbpedidos;

select ultimoDiaMes('2020-02-04');





