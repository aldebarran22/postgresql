-- Probar el procedure:

do $$

declare
	nombreCompleto varchar(60);
	nombre varchar(30);
	apellido1 varchar(30);
begin
	nombreCompleto = 'Raul Gomez';
	--call nombreapellido(nombreCompleto, nombre, apellido1);
	call nombreapellido('Raul Gomez', nombre, apellido1);
	raise info 'Nombre: %, Apellido1: %', nombre, apellido1;
end $$;