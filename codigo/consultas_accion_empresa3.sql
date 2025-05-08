

-- Consultas de acción: delete, update e insert

-- Prueba a borrar un empleado:
delete from tbempleados where id=1;

-- Borrar categorías que no tienen productos:
select nombre from tbcategorias where id not in (select distinct idcategoria from tbproductos);

delete from tbcategorias where id not in (select distinct idcategoria from tbproductos);

