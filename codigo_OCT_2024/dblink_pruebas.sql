/* Lanzar consultas a otra base de datos */

-- Crear una conexión con nombre:
--select dblink_connect('con_empresa3','dbname=empresa3 user=postgres password=antonio');

-- Consulta a través de la conexión creada:
select * from dblink('con_empresa3', 'select * from tbcategorias') as t1(id integer, nombre varchar);


-- En la parte del where para filtrar texto o fechas duplicar la comilla simple
select * from dblink('con_empresa3', 'select id, fechapedido from tbpedidos where paisdestinatario=''Alemania''') as t1(id integer, fechapedido date);

-- Cerrar la conexión
--select dblink_disconnect('con_empresa3');

