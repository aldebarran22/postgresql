

-- Resolver ecuación de 2 grado en un procedimiento:
create or replace procedure ecuacion2(a float, b float, c float, out x1 float, out x2 float)
language 'plpgsql'
as
$$
declare
	raiz float;
begin

	raiz := power(b, 2) - (4 * a * c);
	
	if raiz > 0 then
		x1 := (-b + sqrt(raiz)) / (2 * a);
		x2 := (-b - sqrt(raiz)) / (2 * a);
	else
		raise info 'La raíz es negativa';
		
	end if;	
	
end;
$$


-- Pruebas desde PLPGSQL: bloque de código anónimo para llamar al procedimiento
do $$
declare
	x1 float;
	x2 float;

begin
	call ecuacion2(1,5,4, x1, x2);

	if x1 is null or x2 is null then
		raise info 'No hay solución';
		
	else			
		raise info 'Soluciones: X1 = %, X2 = %', x1, x2;
		
	end if;
end $$;