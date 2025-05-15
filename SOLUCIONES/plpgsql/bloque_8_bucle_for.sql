-- ejemplo bucle for:
do $$
begin
	for n in 100..110 loop
		raise notice 'Valor de n: %', n;
	end loop;
end $$;