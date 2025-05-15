do $$

declare
	precio numeric;
begin
	select  preciounidad into strict precio from tbproductos where id>1;
	
	
	if found then
		raise notice 'El precio es: %', precio;
	else 
		raise exception 'No se ha encontrado el producto';
	end if;
	
exception
	when no_data_found then
		raise notice 'no hay datos';
		
	when too_many_rows then
		raise notice 'Devuelven varias filas';			
		
	when others then
		raise notice 'error no existe el producto';

end $$;