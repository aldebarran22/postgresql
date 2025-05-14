
/* Actualizamos los precios de las bebidas en función si el dia del mes es par o impar
Si el día es par bajamos los precios un 5%
Si el día es impar se suben un 8%
*/

do $$
declare
	dia integer;
	incremento numeric;

begin
	-- Obtener el dia del mes de la fecha actual:
	dia := extract(day from current_date);
	raise info 'El dia es %', dia;

	if dia % 2 = 0 then
		-- El dia es un número par:
		incremento := 0.95;
		raise info 'Bajan los precios un 5%%'; -- El doble % es para escapar el simbolo %

	else
		-- El día es un número impar:
		raise info 'Suben los precios un 8%%';
		incremento := 1.08;

	end if;

	update tbproductos set preciounidad = preciounidad * incremento where idcategoria = (select id from tbcategorias where nombre='Bebidas');

end $$;

--select * from tbproductos where idcategoria = 1;



/*
select extract(day from current_date);
select 14 % 2 = 0;*/

