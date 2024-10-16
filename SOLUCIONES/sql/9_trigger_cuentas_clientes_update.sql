-- Trigger de actualización

create trigger "schFinanciero.trgUpdateCuentas"
after update
on "schFinanciero"."cuentasClientes"
for each row execute procedure "schFinanciero"."logUpdateCuentaCliente"();
