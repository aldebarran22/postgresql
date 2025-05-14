
-- Programación plpgsql: bucles: loop, while, for

do $$

declare
	num integer;
begin

	-- Imprimir los números del 1 al 10 con loop
	
	num := 1;
	loop
		raise info 'num = %', num;

		exit when num = 10;
		
		/*
		if num = 10 then
			exit;
		end if;
		*/
		
		num := num + 1;
		
	end loop;

	-- Hacer lo mismo con un bucle for:
	for i in 1..10 loop
		raise info 'i = %', i;
	end loop;
	

end $$;