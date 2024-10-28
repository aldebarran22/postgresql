
-- Comprobar el esquema local de la BD Csic

-- Las campañas:
select * from local.survey;


select survey, platform_code from public.operations
group by 1,2;