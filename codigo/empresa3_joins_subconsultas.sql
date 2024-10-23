
/* jOINS Y SUBCONSULTAS */

-- Obtener los nombres de los proveedores que nos surten productos de bebidas:
select distinct pv.nombre from tbproveedores pv
inner join tbproductos p on pv.id = p.idproveedor
inner join tbcategorias c on c.id = p.idcategoria
where c.nombre = 'Bebidas'
order by 1;


-- OJO ESTO NO ES CORRECTO: ESTOY RELACIONANDO DATOS QUE NO LO ESTAN: HAY QUE UTILIZAR LA TABLA PUENTE DE PRODUCTOS
select c.nombre, p.nombre from tbcategorias c
inner join tbproveedores p on c.id = p.id;


-- Cual es la empresa de envios que más pedidos realiza:
