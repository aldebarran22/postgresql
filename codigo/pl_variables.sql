

-- programación en plpgsql

do $$
declare
	-- Definición de variables
	precio numeric := 254;
	iva numeric := 0.21;
	resultado numeric;

begin
	-- instrucciones

	resultado := (1 + iva) * precio;
	raise info 'EL resultado es %', resultado;

end $$;