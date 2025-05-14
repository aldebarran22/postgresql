
-- programación en plpgsql: Condicionales

do $$
declare
	num1 numeric := 474;
	num2 numeric := 4400;

begin
	-- Cual es el menor de los dos numeros:
	if num1 < num2 then
		raise info 'El menor es: %', num1;

	elsif num1 = num2 then
		raise info 'Son iguales: %', num1;

	else
		raise info 'El menor es: %', num2;

	end if;

end $$;