
select user;

select *
from dblink('dbname=empresa3 user=postgres password=antonio options=-csearch_path=', 
			'select id,nombre from public.tbcategorias')
			as t1(id integer, nombre varchar);
			
			
select dblink_connect('dbname=empresa3 user=postgres password=antonio');

select dblink_connect('con1','dbname=empresa3 user=postgres password=antonio');

select id, nombre from dblink('con1', 'select * from public.tbcategorias')
as t1(id integer, nombre varchar);

select dblink_disconnect('con1');

