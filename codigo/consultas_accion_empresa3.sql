
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


-- Actualizar datos:
-- update tabla set campo1=valor1, campo2=valor2, ... where condicion;

select count(*) from tbproductos where unidadesenpedido = 10;

-- Subir los precios un 5% de los productos que tengamos 10 unidades en existencia:
update tbproductos set preciounidad = preciounidad * 1.05 where unidadesenpedido = 10;


-- Bajar un 20% las Bebidas:
update tbproductos set preciounidad = preciounidad * 0.8 where idcategoria = (select id from tbcategorias where nombre='Bebidas');


-- Crear una tabla con el resultado de una consulta:
-- create table nombre_tabla as select ...
create table tbpedidos_suiza as
select * from tbpedidos where paisdestinatario = 'Suiza';





