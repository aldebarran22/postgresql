

-- Crear vistas:

drop view empleados_ventas;

-- Crear una vista con los empleados relacionados con las ventas:
create view empleados_ventas as
select nombre, apellidos from tbempleados where cargo like '%ventas%';


select * from empleados_ventas;


-- Crear otra vista con los pedidos de Alemania:
create or replace view pedidos_alemania as
select * from tbpedidos where paisdestinatario = 'Alemania';

select * from pedidos_alemania;

-- Facturación total por cliente en la vista:
select idcliente, sum(cargo) as total
from pedidos_alemania
group by idcliente
order by 2 desc;

