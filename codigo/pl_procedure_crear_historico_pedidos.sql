/*
Crear un procedimiento que le pasamos un año:
- Y tiene que crear el historio de ese año
- Comprobar si la tabla del historico existe y si ya se ha realizado
el historico de ese año.
- Si luego añadimos otro año al histórico tiene que mantener lo que tenía.
- Pasar un parámetro para eliminar o no los registro del origen

call crearHistoPedidos(1996) --> tiene que crear la tabla
call crearHistoPedidos(1997)
call crearHistoPedidos(1997) --> No hace nada
*/

create or replace procedure crearHistoricoPedidos(yy integer, borrar boolean default false)
language plpgsql
as
$$
declare
 sql text;
 sql2 text;
 nombreTb varchar(80);
 nombreTbDetalle varchar(100);
 nombreTbcopia varchar(80);
 nombreTbDetallecopia varchar(100);
begin
	-- Comprobar si hay pedidos del año indicado
	if not exists(select * from tbpedidos where date_part('year', fechapedido)=yy) then
		raise info 'No hay pedidos del año: %', yy;
		return; -- Terminar el procedure.
	end if;
	
	-- Comprobar si existe la tabla de tbpedidoshistorico:
	nombreTb = 'tbpedidoshistorico' || to_char(yy,'9999');
	nombreTb = replace(nombreTb, ' ','');
	
	nombreTbDetalle = 'tbdetallespedidoshistorico' || to_char(yy,'9999');
	nombreTbDetalle = replace(nombreTbDetalle, ' ','');
	
	if exists(select * from pg_tables where tablename=nombreTb) then
		-- Renombrar la tabla:
		nombreTbcopia = 'tbpedidoshistoricocopia' || to_char(yy,'9999');
		nombreTbcopia = replace(nombreTbcopia, ' ','');
	
		nombreTbDetallecopia = 'tbdetallespedidoshistoricocopia' || to_char(yy,'9999');
		nombreTbDetallecopia = replace(nombreTbDetallecopia, ' ','');
		
		-- Por si acaso existen las copias:
		execute 'drop table if exists ' || nombreTbcopia;
		execute 'drop table if exists ' || nombreTbDetallecopia;
		
		-- Renombrar las tablas del historico:
		execute 'alter table ' || nombreTb || ' rename to ' || nombreTbcopia;
		execute 'alter table ' || nombreTbDetalle || ' rename to ' || nombreTbDetallecopia;
		
	end if;
	
	-- Sabemos que no existe, siempre se crea:		
	sql = 'create table ' || nombreTb || ' as 
	(select * from tbpedidos where date_part(''year'', fechapedido)='||yy||');';

	sql2 = 'create table ' || nombreTbDetalle || ' as 
	(select d.* from tbdetallespedidos d inner join tbpedidos p
	on d.idpedido = p.id where date_part(''year'', fechapedido)='|| yy || ')';

	execute sql;
	execute sql2;

	raise info 'Se han creado las tablas del histórico con el año: %', yy;
	
	-- Comprobar si hay que borrar los datos originales:
	if borrar then
		-- borrar en la tabla de pedidos y detalles de pedidos el año indicado:
		delete from tbdetallespedidos d using tbpedidos p 
		where d.idpedido = p.id and date_part('year', p.fechapedido)=yy;
		
		delete from tbpedidos where date_part('year', fechapedido)=yy;
	end if;	
end
$$


