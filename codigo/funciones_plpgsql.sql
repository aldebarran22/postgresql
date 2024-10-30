create or replace function f1() returns float[]
as
$$
declare
resul float[2];
begin
	resul[0]:=1.2;
	resul[1]:=2.3;

	return resul;

end;
$$
language 'plpgsql';

select f1();


-- Resolver ecuación de 2 grado en una función:
create or replace function ecuacion(a float, b float, c float) returns float[]
as
$$
declare
	raiz float;
	resul float[2];
begin

	raiz := power(b, 2) - (4 * a * c);
	
	if raiz > 0 then
		resul[0]:= (-b + sqrt(raiz)) / (2 * a);
		resul[1]:= (-b - sqrt(raiz)) / (2 * a);
	else
		raise info 'La raíz es negativa';
		
	end if;	
	
	return resul;
end;
$$
language 'plpgsql';

-- Pruebas desde el SQL:
select ecuacion(1,5,4);
select ecuacion(1,2,3);

-- Pruebas desde PLPGSQL: bloque de código anónimo
do $$
declare
	soluciones float[2];
	x1 float;
	x2 float;

begin
	soluciones := ecuacion(1,5,4);

	x1 := soluciones[0];
	x2 := soluciones[1];

	raise info 'Soluciones: X1 = %, X2 = %', x1, x2;

end $$;


