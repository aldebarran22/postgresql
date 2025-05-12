

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

-- Crear una vista para solo las bebidas;
drop view bebidas;

create or replace view bebidas as
select p.id, p.nombre, p.idproveedor, p.idcategoria, p.preciounidad, p.unidadesenpedido, 
p.cantidadporunidad, p.unidadesenexistencia 
from tbproductos p
inner join tbcategorias c
on p.idcategoria = c.id
where lower(c.nombre) = 'bebidas'


select * from bebidas;

-- insertar con la vista:
-- Esto daría error porque no es una vista actualizable: tiene dos tablas!
--insert into bebidas values(200, 'Plátanos', 1, 7, 3, 50, 'cajas de 2kg', 30);


select * from tbproductos where id>=200;


-- Vista actualizable:
create or replace view solo_bebidas as
select p.id, p.nombre, p.idproveedor, p.idcategoria, p.preciounidad, p.unidadesenpedido, 
p.cantidadporunidad, p.unidadesenexistencia 
from tbproductos p
where p.idcategoria = 1;

insert into solo_bebidas values(201, 'Naranjas', 1, 7, 3, 50, 'cajas de 2kg', 30);


