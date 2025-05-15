do $$
declare
	categoria record;
	cur_cat cursor(idcat integer) for select * from tbcategorias where id > idcat;

begin
	open cur_cat(5);
	
	loop
		fetch cur_cat into categoria;
		exit when not found;
		
		raise info 'cat: %', categoria;
	
	end loop;
	close cur_cat;
	
end $$;