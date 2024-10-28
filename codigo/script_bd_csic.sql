

-- Rediseñar la BD CSIC
-- El esquema public tiene las tablas originales
-- El esquema local las nuevas tablas

-- COPIAR las campañas: de public a local
insert into local.survey(survey, date_start, date_end, platform_code) 
select ps.survey, ps.date_start, ps.date_end, po.platform_code 
from public.survey ps inner join public.operations po
on ps.survey = po.survey group by 1,2,3,4;


/*
select ps.survey, ps.date_start, ps.date_end, po.platform_code 
from public.survey ps inner join public.operations po
on ps.survey = po.survey group by 1,2,3,4;
*/

-- Creamos una tabla de platform y otra de tipoOperacion.
insert into local.platforms select platform_code, 'BARCO ' || platform_code, 'I', current_timestamp
from local.survey group by 1,2,3,4;

/*
select platform_code, 'BARCO ' || platform_code, 'I', current_timestamp
from local.survey group by 1,2,3,4
*/


