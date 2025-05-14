
-- Programación plpgsql: bucles: loop, while, for

do $$

declare
	num integer;
begin

	-- Imprimir los números del 1 al 10 con loop

	num := 1;
	loop
		raise info 'num = %', num;
		
		if num = 10 then
			exit
		end if;
		
		num := num + 1;
		
	end loop;

end $$;