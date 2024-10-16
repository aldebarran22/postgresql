-- Consultas de acción:

-- Delete:
-- delete from tabla where criterios

-- Borrar los alumnos que no tienen teléfono:
delete from ac_alumnos where telefono is null;


-- Borrar las asignaturas que no se imparten clases:
delete  from ac_asignaturas
where codasig not in (select distinct to_number(codasig,'99') from ac_clases);

select codalumn, nombre from ac_alumnos 
where codalumn  not in (select distinct to_number(codalumn,'99') from ac_clases);

select codasig, nombreasig from ac_asignaturas 
where codasig  not in (select distinct to_number(codasig,'99') from ac_clases);

