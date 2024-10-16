do $$
declare
	pais record;
	sql text;
	
begin
	for pais in (select * from paises.tbpaises) loop
		sql = 'drop table if exists paises.pedidos_' || replace(pais.pais, ' ', '_') || ';';
		execute sql;
		
		sql = 'create table paises.pedidos_' || replace(pais.pais, ' ', '_') ||
		' as select * from tbpedidos where paisdestinatario = ' || 
		quote_literal(pais.pais);
		--raise info 'SQL: %', sql;
		execute sql;
	end loop;
	raise info 'Proceso finalizado ...';
				  
end $$;