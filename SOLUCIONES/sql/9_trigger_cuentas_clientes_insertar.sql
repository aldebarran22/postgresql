-- Crear un trigger

create trigger "schFinanciero.tgrInsertaCuentas"
after insert
on "schFinanciero"."cuentasClientes"
for each row execute procedure "schFinanciero"."logTblCuentaCliente"();