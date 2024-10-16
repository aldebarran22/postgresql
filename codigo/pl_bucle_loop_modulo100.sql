do $$
declare
	i integer;
	tope integer;
	vuelta integer;
begin
	i = 1;
	tope = 1000;
	vuelta = 100;
	loop
		if i % vuelta = 0 then
			raise info 'commit';
			raise info 'i: %', i;
		end if;
		
		i = i + 1;
		if i > tope then
			exit;
		end if;	
	end loop;
end $$;