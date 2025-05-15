/* VISTAS */ 


-- Una vista equivalente a la tabla de public.biologicos pero utilizando las tablas del esquema local: survey, operations, biologicos
create or replace view local.vista_biologicos as 
select s.survey, s.platform_code, o.operation_code, b.species_code, b.category_code, b.sample_id, b.sampling_type,
b.outlier, b.observations, b.talla, b.pesotot, b.peviscerado, b.sexo, b.madurez, b.observaciones
from local.biologicos b 
inner join local.operations o on b.idoperation = o.id
inner join local.survey s on s.id = o.idsurvey;


-- Prueba vista biologicos
select * from local.vista_biologicos;


drop view vista_bilogicos;


-- Cuantos biologicos tenemos en cada campaña:
select survey, count(*) as cuenta
from local.vista_biologicos
group by 1;

-- Obtener los nombres de las species que se utilizan en la vista de biologicos:
select distinct s.common_name as nombre
from local.vista_biologicos v 
inner join local.species s on v.species_code = s.species_code
order by 1;

