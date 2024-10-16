-- listar las tablas de la BD empresa3 e imprimir el número de registros:
-- Bucle for para recorrer la tabla de categorias:
do $$
declare
	tabla pg_tables.tablename%type;
	cuenta integer;	
	sql text;
begin
	for tabla in (select tablename from pg_tables where tablename like 'tb%' and schemaname='public') loop
				
		sql = 'select count(*) from ' || tabla;
		execute sql into cuenta;
		--raise info 'sql: %', sql;
		raise info 'Tabla: % con % registros', tabla, cuenta;
	end loop;
end $$;