
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


-- Crear otra función que devuelva el peso medio por specie y categoria:
create or replace function calcularPesoMedio(cod_specie varchar, cod_categoria integer) returns float
as
$$
declare
	media float;
begin
	select round(avg(pesotot),2) into media from biologicos
	where species_code = cod_specie and category_code = cod_categoria;
	return media;
end;
$$
language 'plpgsql';



select calcularNumMuestras('10152', 0);
select calcularPesoMedio('10152', 0);

-- Número de categorias en biologicos: mas lenta, hace el mismo cálculo varias veces
select distinct category_code, species_code, calcularNumMuestras(species_code, category_code)  from biologicos;

-- Quita primero los repetidos: más rápida
select species_code, category_code,
calcularNumMuestras(species_code, category_code) as cuenta,
calcularPesoMedio(species_code, category_code) as peso_medio
from (select category_code, species_code, talla from biologicos group by 1,2)
order by 1,2;

select species_code, category_code, count(*) as cuenta, round(avg(pesotot),2) as  peso_medio, round(avg(talla),2) as talla_media
from biologicos
group by 1,2
order by 1,2;








