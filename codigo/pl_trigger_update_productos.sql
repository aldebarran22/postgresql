-- Función trigger que actualiza el stock del producto solicitado en pedido
create function public."actualizarExistencias"()
returns trigger
language plpgsql
as 
$$
declare 
	uds integer;
begin
	select unidadesenexistencia into uds from tbproductos
	where id = new.idproducto; 

	update public.tbproductos
	set unidadesenexistencia  = unidadesenexistencia - new.cantidad
	where id = new.idproducto;
	
	raise info 'Actualizar el producto: % de cantidad: % a %', 
	new.idproducto, uds,new.cantidad;
	
	return new;
end
$$

-- Trigger de actualización: tiene que actualizar las unidades en existencia
-- en la tabla de tbproductos;
create trigger tgractualizarexistencias
after insert
on public.tbdetallespedidos
for each row execute procedure public."actualizarExistencias"();


-- Código Pl de prueba:
insert into public.tbdetallespedidos
values(10250, 14, 10, 20, 0);