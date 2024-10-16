-- Crear una tabla de pedidos por cada pais de la tabla de Pedidos
do $$
declare
	sql varchar(200);
	sql2 varchar(200);
	pais varchar(50);
begin
	for pais in execute 'select distinct paisdestinatario from tbpedidos' loop
		--raise notice 'pais: %', pais;
		sql := 'drop table if exists pedidos_' || replace(pais, ' ', '_') || ';';			

		raise notice '%', sql;
		execute sql;	

	end loop;

end $$;


