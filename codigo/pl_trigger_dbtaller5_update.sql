-- Crear un trigger de actualización

create trigger "schFinanciero.actualizarSaldo"
after update
on "schFinanciero"."cuentasClientes"
for each row execute procedure "schFinanciero".transferencia();