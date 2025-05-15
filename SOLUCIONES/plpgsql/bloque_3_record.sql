-- pruebas con el tipo record:
do $$

declare
	registro record;
begin
	select * into registro from tbcategorias where id=1;
	raise notice 'registro: %', registro;
	
	select * into registro from tbproductos where id=10;
	raise notice 'registro: %', registro;
end $$;