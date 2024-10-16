select user;

-- Activar extensión dblink;
create extension dblink;

select * 
from dblink('dbname=empresa3 user=postgres password=antonio options=-csearch_path=',
		   'select id,nombre from public.tbcategorias')
		   as t1(id integer, nombre varchar);
		   
select * 
from dblink('host=localhost dbname=empresa3 port=5432 user=postgres password=antonio',
		   'select id,nombre from public.tbcategorias')
		   as t1(id integer, nombre varchar);
		   
select * 
from dblink('dbname=empresa3 user=postgres password=antonio',
		   'select id,nombre from public.tbcategorias')
		   as t1(id integer, nombre varchar);
		   
-- Testear si conecta, crea una conexión que la llama: unamed		   
select dblink_connect('dbname=empresa3 user=postgres password=antonio');

-- Crear una conexión con nombre:
select dblink_connect('conexion1','dbname=empresa3 user=postgres password=antonio');

-- Lanzar varias consultas:
select * from dblink('conexion1', 'select * from tbcategorias'
					) as t1(id integer, nombre varchar);
select count(t2.*) from dblink('conexion1','select * from tbcompaniaenvios')
					as t2(id integer, nombre varchar, telefono varchar);
-- Cerrar la conexión:
select dblink_disconnect('conexion1');

-- Comprobar los pedidos del historico contra la bd remota: empresa3
select count(t3.id) as cuenta 
from dblink('conexion1','select id from public.tbpedidos')
as t3(id integer)
where t3.id not in (select id from (
	select * from tbpedidoshistorico1996
	union
	select * from tbpedidoshistorico1997
	union
	select * from tbpedidoshistorico1998
	)
);

select t3.id 
from dblink('conexion1','select id from public.tbpedidos')
as t3(id integer)
where t3.id not in (select id from (
	select * from tbpedidoshistorico1996
	union
	select * from tbpedidoshistorico1997
	union
	select * from tbpedidoshistorico1998
	)
);

select count(id) as cuenta from tbpedidos
where id not in (select id from (
	select * from tbpedidoshistorico1996
	union
	select * from tbpedidoshistorico1997
	union
	select * from tbpedidoshistorico1998
	)
);

create schema temporal1;

create table temporal1.tbidpedidos as (select t3.id 
from dblink('conexion1','select id from public.tbpedidos')
as t3(id integer));

					



