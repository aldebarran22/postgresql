

-- Actualizar la ciudad de los alumnos:
update ac_alumnos 
set nacimiento = replace(nacimiento, 'm', 'M')
where nacimiento = 'madrid';

select * from ac_alumnos;

update ac_alumnos
set direccion = replace(direccion, 'caceres', 'Cáceres');

select to_char(now(), 'TMMonth');



