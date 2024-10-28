

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

-- Sacamos una copia de la tabla de operaciones y luego la modificamos:
create table local.operations as select * from public.operations;

-- En la tabla de operations tenemos que arrastra el idsurvey para saber la operación a que campaña pertenece:
alter table local.operations add column idsurvey integer;

-- Actualizar idsurvey de la tabla de operations utilizando la tabla survey:
update local.operations o 
set idsurvey = s.id
from local.survey s
where o.survey = s.survey;

-- Comprobacion:
select s.id, s.survey, o.idsurvey, o.survey
from local.survey s inner join local.operations o
on s.id = o.idsurvey;


-- Borrar las dos columnas survey y platform_code de la tabla de operations:
alter table local.operations
drop column survey;

alter table local.operations
drop column platform_code;

-- la columna idsurvey es una clave FK:
alter table local.operations
add constraint survey_fk
foreign key (idsurvey) references local.survey(id)
on delete no action;

-- Se crea una tabla tipos_operaciones:
create table local.operations_types (
	id serial primary key,
	tipo varchar(20)
);

insert into local.operations_types(tipo) values('PESCA'),('FONDEO'),('PLANCTON'),('AVISTAMIENTO');

-- Crear en operaciones una clave foránea idtipooperacion (es un campo nuevo):
alter table local.operations
add column id_type_operation integer;

-- Hacerlo FK:
alter table local.operations
add constraint operation_type_fk
foreign key (id_type_operation) references local.operations_types(id)
on delete no action;

-- Actualizar el id del tipo de operación en este caso sabemo que es PESCA:
update local.operations o 
set id_type_operation = (select id from local.operations_types where tipo='PESCA');

-- Añadir una PK de tipo serial:
alter table local.operations
add column id serial primary key;


-- Copiar la tabla de species:
create table local.species as select * from public.species;

-- Copiar la tabla de biologicos:
create table local.biologicos as select * from public.biologicos;

alter table local.biologicos 
add column idoperation integer;

-- Montar una consulta que recupere el id, survey, platform_code y operation_code de local.operations
select o.id, s.survey, s.platform_code, o.operation_code
from local.survey s inner join local.operations o
on s.id = o.idsurvey;

-- trasladar la clave primaria de las operations a la tabla de biologicos:
SELECT survey , platform_code , operation_code, count(*)  FROM local.biologicos
group by 1,2,3
order by 4 desc;

-- actualizar idoperacion de la tabla de local.biologicos:
update local.biologicos b
set idoperation = v.id
from 
(select o.id, s.survey, s.platform_code, o.operation_code
from local.survey s inner join local.operations o
on s.id = o.idsurvey) v
where b.survey = v.survey and b.platform_code = v.platform_code and b.operation_code = v.operation_code;

-- Borrar de local.biologicos survey, platform_code y operation_code
alter table local.biologicos
drop column survey, 
drop column platform_code,
drop column operation_code;


-- Crear FK en local.biologicos con la columna: idoperation:
alter table local.biologicos
add constraint operation_fk
foreign key (idoperation) references local.operations(id)
on delete no action;

-- Añadir una PK a local.biologicos:
alter table local.biologicos
add column id serial primary key;












