-- Crear el trigger que monitoriza las inserciones en la tabla cuentasClientes
create trigger "schFinanciero.tgrCrearCliente"
after insert
on "schFinanciero"."cuentasClientes"
for each row execute procedure "schFinanciero".nuevocliente();


-- Borrar un trigger: drop trigger [if exists] name_trigger on nombre_table
drop trigger "schFinanciero.tgrInsertaCuentas" on "schFinanciero"."cuentasClientes";
drop function "schFinanciero"."logTblCuentaCliente";