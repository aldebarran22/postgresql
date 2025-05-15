-- Pruebas con el control de flujo

do $$
declare
	a integer:=5;
	b integer:=7;
	
begin
	if a < b then
		raise notice 'a < b';
	else
		raise notice 'b <= a';
	end if;
end $$;