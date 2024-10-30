/* TRIGGERS DE EMPRESA3 */

-- Añadir una nueva linea de pedido (tbdetallespedido) y queremos actualizar automáticamente con un trigger las existencias del producto
-- producto 1: te tiene 24 unidades en existencia, precio 18
-- producto 2: cerveza tiene 17 uds en existencia, precio 19

create or replace function actualizar_existencias()
returns trigger as $actualizar_productos$
begin

	update tbproductos
	set unidadesenexistencia = unidadesenexistencia - new.cantidad
	where id = new.idproducto;
	
end;
$actualizar_productos$ language 'plpgsql';


create or replace trigger actualizar_productos
after insert on public.tbdetallespedidos
for each row execute actualizar_existencias();



insert into tbdetallespedidos(idpedido, idproducto, preciounidad, cantidad, descuento) values(10250, 1, 18, 10, 0); 
insert into tbdetallespedidos(idpedido, idproducto, preciounidad, cantidad, descuento) values(10250, 2, 19, 15, 0); 


