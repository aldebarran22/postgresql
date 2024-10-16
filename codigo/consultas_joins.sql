-- Consultas con joins:

/*
Tb1     Tb2
A		A
B		C
E		F
Z		Z

inner join (A-A, Z-Z) selecciona la filas donde ambas claves coincidan!
tb1 left join tb2 (A-A, B-null, E-null, Z-Z)
tb1 right join tb2 (A-A, C-null, F-null, Z-Z)
*/

-- ¿Hay clientes que no compran?
select c.id, c.nombre from tbclientes c
left join tbpedidos p
on c.id = p.idcliente
where p.idcliente is null;

-- Con joins imprimir nombre cat, prod y provee.
select c.nombre as nombreCat, pv.nombre as nombreProv, p.nombre as nombreProd
from tbcategorias c 
inner join tbproductos p on c.id = p.idcategoria
inner join tbproveedores pv on pv.id = p.idproveedor
order by 1,2,3;

-- Hay algún producto que no se compre

-- A que países se envían bebidas
select distinct p.paisdestinatario 
from tbcategorias c
inner join tbproductos pr on c.id = pr.idcategoria
inner join tbdetallespedidos d on pr.id = d.idproducto
inner join tbpedidos p on p.id = d.idpedido
where c.nombre = 'Bebidas'
order by 1;


-- A que países se envían quesos
select distinct p.paisdestinatario 
from tbproductos pr 
inner join tbdetallespedidos d on pr.id = d.idproducto
inner join tbpedidos p on p.id = d.idpedido
where pr.nombre like '%Queso%'
order by 1;

-- Cuantos pedidos se han enviado por la compañía "Federal Shipping"
select count(p.id) as numpedidos
from tbcompaniaenvios c 
inner join tbpedidos p on c.id = p.idcompanya
where c.nombre = 'Federal Shipping';

-- Número de pedidos por cada compañía de envío (sacando o no las que tiene 0 pedidos)
select c.nombre, count(p.id) as cuenta
from tbcompaniaenvios c 
left join tbpedidos p on p.idcompanya = c.id
group by c.nombre;






