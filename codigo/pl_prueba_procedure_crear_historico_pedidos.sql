-- Prueba del procedure crearHistoPedidos

do $$
declare
	numeros int[] = array[1995,1996,1997,2000,1998];
	yy integer;
begin
	foreach yy in array numeros loop
		raise info 'Crear histórico año: %', yy;
		if yy = 1997 then
			call crearHistoricoPedidos(yy, true);
		else
			call crearHistoricoPedidos(yy);
		end if;
	end loop;
end $$


-- Comprobar con las 3 tablas de historico si tenemos todos los pedidos:
select count(id) as cuenta from tbpedidos
where id not in (select id from (
	select * from tbpedidoshistorico1996
	union
	select * from tbpedidoshistorico1997
	union
	select * from tbpedidoshistorico1998
	)
);

--select * from dblink('Server=localhost port=5432 dbname=empresa3 Username=postgres Password=antonio', 'select count(*) as cuenta from tbpedidos')
--as tb1(cuenta integer);
--select dblink_connect('server=localhost port=5432 dbname=empresa3 username=postgres uassword=antonio');

