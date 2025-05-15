-- bucles
do $$
declare
	i integer;
begin
	i:=0;
	loop
		if i > 5 then
			exit;
		end if;
		
		raise notice 'i = %', i;
		i:=i+1;
	
	end loop;

end $$;