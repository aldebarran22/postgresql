
-- Prueba con Transacciones:
begin; -- inicia Tx
	insert into tbcategorias values(9,'música');
	delete from tbcategorias where id=10;
commit; -- confirmar

begin;
	delete from tbcategorias where id=9;
	insert into tbcategorias values(11,'viajes');
rollback; --revertir cambios


delete from tbcategorias where id=1;

update tbcategorias set nombre = 'viajes' where id=8;
select * from tbcategorias;
