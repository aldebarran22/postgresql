-- PRUEBAS CON EL BUCLE LOOP
do $$
declare
	i integer;
begin
	i = 1;
	loop
		raise info 'i: %', i;
		i = i + 1;
		if i > 10 then
			exit;
		end if;	
	end loop;
	
	i = 1;
	loop
		raise info 'i: %', i;
		i = i + 1;
		exit when i > 10;				
	end loop;

end $$;