-- Consultas con with:
with pedidos_suiza as (select * from tbpedidos where paisdestinatario='Suiza'),
empleados as (select * from tbempleados), clientes as (select * from tbclientes)
select sum(p.cargo) as total from pedidos_suiza p 
inner join empleados e on e.id = p.idempleado
inner join clientes c on p.idcliente = c.id;

-- Con With un resultado que muestre el nombre del emple  y de la 
-- compañia. Sobre esto calcular el total facturado por compañia y empleado.
with empleados_compa as (select c.nombre as compañia, e.nombre as empleado,
						 p.cargo from tbpedidos p
						 inner join tbempleados e on e.id = p.idempleado
						 inner join tbcompaniaenvios c on c.id = p.idcompanya
)
select compañia, empleado, sum(cargo) as total
from empleados_compa
group by compañia, empleado
order by 3 desc;
select * from empleados_compa;


 


