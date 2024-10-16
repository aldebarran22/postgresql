-- otros tipos de variables:
do $$
declare
	nombre varchar:= 'Juan Sanz';
	nombreCompleto ALIAS FOR nombre;
begin
	raise notice 'El nombre completo: %', nombreCompleto;
end $$;