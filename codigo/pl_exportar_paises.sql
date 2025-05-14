

/* Crear un nuevo esquema "paises" y generar una tabla por cada país con sus pedidos y se guardarán dentro del esquema paises */

do $$

declare
	reg_pais record;
	nombreTabla varchar(30);

begin
	-- Crear un nuevo esquema en la BD:
	create schema if not exists paises;
	
	
	for reg_pais in (select * from tbpaises) loop
		
		nombreTabla := replace(reg_pais.nombre, ' ', '_');		
		execute format('create table paises.%s as (select * from public.tbpedidos where idpais = %s)', lower(nombreTabla), reg_pais.id);

		raise info 'Creando tabla: %', nombreTabla;
		
	end loop;

end $$;

-----------------------------------------------------------------------------------------

-- PARA BORRAR LAS TABLAS:

do $$

declare
	reg_pais record;
	nombreTabla varchar(30);

begin
		
	for reg_pais in (select * from tbpaises) loop
		
		nombreTabla := replace(reg_pais.nombre, ' ', '_');		
		--execute format('drop table paises.%I', nombreTabla); -- Si las habíamos creado con %I
		execute format('drop table paises.%s', nombreTabla); -- Si se han creado si las comillas.

		raise info 'Borrando tabla: %', nombreTabla;
		
	end loop;

end $$;



select * from paises.FRANCIA;