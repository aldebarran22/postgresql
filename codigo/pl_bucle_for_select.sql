-- Bucle for para recorrer la tabla de categorias:
do $$
declare
	categoria record;
	
begin
	for categoria in (select * from tbcategorias) loop
		raise info 'Categoría: %', categoria;
	end loop;

end $$;


