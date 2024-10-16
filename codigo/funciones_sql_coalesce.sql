-- Funciones condicionales:

-- Extraer el contacto de los alumnos:
select nombre, movil, telefono, coalesce(movil,  coalesce(telefono, email)) as contacto
from ac_alumnos;