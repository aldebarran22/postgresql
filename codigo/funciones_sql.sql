

-- Seleccionar filas a partir de un campo que puede tener mayúsculas o minúsculas:
select * from ac_alumnos
where upper(nacimiento) = 'CACERES' OR lower(nacimiento) = 'cáceres';