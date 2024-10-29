

/* FUNCIONES PROGRAMADAS EN LA BD CSIC */

-- Fauna: pesos totales por campaña, barco y especie: CAPTURADO en KG
select survey, platform_code, species_code, count(*) as pesadas, sum(weight) as peso_total_capturas
from fauna
group by 1, 2, 3
order by 1,2,3;


-- Biologicos: esos totales por campaña, barco y especie MUESTREADO en gramos
select survey, platform_code, species_code, round( sum(pesotot)/1000.0, 2) as peso_total_muestras
from biologicos
group by 1, 2, 3
order by 1,2,3;



-- Calculo del porcentaje muestrado por campaña, barco y especie:
select c.survey, c.platform_code, c.species_code, round(m.peso_total_muestras / c.peso_total_capturas * 100, 2) as porcentaje_muestreado
from (select survey, platform_code, species_code, count(*) as pesadas, sum(weight) as peso_total_capturas
from fauna
group by 1, 2, 3
order by 1,2,3) c
inner join 
(select survey, platform_code, species_code, round( sum(pesotot)/1000.0, 2) as peso_total_muestras
from biologicos
group by 1, 2, 3
order by 1,2,3) m
on c.survey = m.survey and c.platform_code = m.platform_code and c.species_code = m.species_code
order by 4 desc;


-- Crear una vista materializada con capturas
create materialized view capturas as
select survey, platform_code, species_code, count(*) as pesadas, sum(weight) as peso_total_capturas
from fauna
group by 1, 2, 3
order by 1,2,3;

-- Crear una vista materializada con muestreo
create materialized view muestreo as
select survey, platform_code, species_code, round( sum(pesotot)/1000.0, 2) as peso_total_muestras
from biologicos
group by 1, 2, 3
order by 1,2,3

-- Consulta anterior utilizando las dos vistas:
select c.survey, c.platform_code, c.species_code, round(m.peso_total_muestras / c.peso_total_capturas * 100, 2) as porcentaje_muestreado
from capturas c
inner join 
muestreo m
on c.survey = m.survey and c.platform_code = m.platform_code and c.species_code = m.species_code
order by 4 desc;


-- Una función SQL que a partir de: survey, platform_code, species_code
-- devuelva el porcentaje muestreado:





select survey, platform_code, f.species_code, s.common_name, weight
from fauna f inner join species s
on f.species_code = s.species_code
where survey = 'CAMP2' and platform_code = '201176' and f.species_code = '10323';

select b.survey, b.platform_code, b.species_code,  s.common_name, round(b.pesotot/1000.0,2) as peso
from biologicos b 
inner join species s on b.species_code = s.species_code
where b.survey = 'CAMP2' and b.platform_code = '201176' and b.species_code = '10323';

