
/* Consultas de acción 

- insert into: inserta filas completas
- update: actualiza las columnas para las filas que cumplen la condición.
- delete: borra filas completas que cumplan la condición.

*/


select (select max(id)+1 from tbempleados), apellidos, 'Sara', 'Gerente', 'Srta.', '1990-07-05', ciudad, pais, telefono
from tbempleados where apellidos='King' and nombre='Robert';

-- Añadir un empleado que es la hermana de Robert King, se llama Sara King, vive en el mismo domicilio, cargo "Gerente", fecha nacimiento: 12/07/1990.
insert into tbempleados(id, apellidos, nombre, cargo, tratamiento, fechanacimiento, ciudad, pais, telefono)
select (select max(id)+1 from tbempleados), apellidos, 'Sara', 'Gerente', 'Srta.', '1990-07-05', ciudad, pais, telefono
from tbempleados where apellidos='King' and nombre='Robert';