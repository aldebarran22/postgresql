

-- Seleccionar filas a partir de un campo que puede tener mayúsculas o minúsculas:
select * from ac_alumnos
where upper(nacimiento) = 'CACERES' OR lower(nacimiento) = 'cáceres';

-- Obtener el nombre y primer apellidos de los alumnos que tenga nombre y apellido en el campo nombre:
select * from ac_alumnos 
where position(' ' in nombre) > 0;

-- char_length(substring(nombre from 1 for position(' ' in nombre)-1))

select 
nombre,
substring(nombre from 1 for position(' ' in nombre)-1) as nombre,
substring(nombre from position(' ' in nombre)+1 for char_length(nombre) - position(' ' in nombre)) as apellido
from ac_alumnos 
where position(' ' in nombre) > 0;

select trim('-' from '--Hola Mundo----');

select rpad(nombre, 20, '*') as nombre from ac_alumnos;



