
/* FUNCIONES EN PLPGSQL */

create or replace function calcularPorcentaje(total float, parcial float) returns float
as
$$
declare
 -- Variables locales
 porcentaje numeric;

begin
	porcentaje := (parcial / total * 100.0)::numeric;	
	--raise info 'porcentaje: %', porcentaje;
	return ROUND(porcentaje, 2);	
	
end;
$$
language 'plpgsql';

drop function calcularPorcentaje;


create or replace function calcular_porcentaje(total float, parcial float) returns float
as
$$
declare
  porcentaje numeric;
begin
  porcentaje := (parcial / total * 100.0)::numeric;
  return ROUND(porcentaje, 2); -- Redondea a 2 decimales
end;
$$
language 'plpgsql';


select calcular_Porcentaje(450.0, 56.7);

-- Crear una función que devuelva el numero muestras por specie y categoria:
create or replace function calcularNumMuestras(cod_specie varchar, cod_categoria integer) returns integer
as
$$
declare
	numero integer;
begin
	select count(*) into numero from biologicos
	where species_code = cod_specie and category_code = cod_categoria;
	return numero;
end;
$$
language 'plpgsql';

select calcularNumMuestras('10152', 0);

-- Número de categorias en biologicos: mas lenta, hace el mismo cálculo varias veces
select distinct category_code, species_code, calcularNumMuestras(species_code, category_code)  from biologicos;

-- Quita primero los repetidos: más rápida
select category_code, species_code, calcularNumMuestras(species_code, category_code)
from (select category_code, species_code from biologicos group by 1,2);

select category_code, species_code, count(*) as cuenta
from biologicos
group by 1,2;








