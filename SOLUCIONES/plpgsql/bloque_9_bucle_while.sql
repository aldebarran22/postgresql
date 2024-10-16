-- bucle while
do $$
declare
	x integer:=1;
	
begin
	while x <= 10 loop
		raise notice 'Valor de x: %', x;
		x:=x+1;
	end loop;
end $$;