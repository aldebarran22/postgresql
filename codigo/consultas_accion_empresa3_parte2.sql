-- Consultas de inserción (filas)

-- 1) crear una tabla tbpedidos2 con los pedidos de 1996
-- create table nombre_tabla as (sql);

-- Los pedidos del 1996:
select * from tbpedidos where extract(year from fechapedido) = 1996;

create table tbpedidos2 as (select * from tbpedidos where extract(year from fechapedido) = 1996);

-- Truncar la tabla:
truncate tbpedidos2;

-- Insertar pedidos en pedidos2, los pedidos de Suiza:
insert into tbpedidos2 select * from tbpedidos where paisdestinatario = 'Suiza';

-- Insertar una nueva bebida coca cola, se asocia al proveedor: Exotic Liquids
-- la clave del nuevo producto será: la última+1
insert into tbproductos(id, nombre, idproveedor, idcategoria, preciounidad, unidadesenpedido, cantidadporunidad, unidadesenexistencia)
values ( 
	(select max(id)+1 from tbproductos), 'Coca Cola', 
	(select id from tbproveedores where nombre='Exotic Liquids'),
	(select id from tbcategorias where nombre='Bebidas'),
	2, 50, '6 latas de 33 ml.', 50
);

select * from tbproductos order by id desc limit 5;

-- Una fecha 30 años anterior;
select current_date - (30 * 365);


-- Dar de alta en la tabla de empleados a la hermana de Robert King, nombre Sara, edad: la fecha de hoy 30 años antes,
-- Tratamiento: Srta, apellido, pais, telefono, dirección igual que el hermano:









-- Consultas de actualización (columnas)
