-- Crear una tabla de pedidos por cada pais de la tabla de Pedidos
do $$
declare
	sql varchar(200);
	sql2 varchar(200);
	pais varchar(50);
begin
	for pais in execute 'select distinct paisdestinatario from tbpedidos' loop
		--raise notice 'pais: %', pais;
		sql := 'create table pedidos_' || replace(pais, ' ', '_') || 
		' as select * from tbpedidos 
		where paisdestinatario = ' || quote_literal(pais) || ';';			

		raise notice 'Generando tabla para %', pais;
		execute sql;	

	end loop;

end $$;


