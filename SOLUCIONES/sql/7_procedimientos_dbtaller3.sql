create or replace procedure "schFinanciero"."sumarSaldos"()
language plpgsql
as
$$
declare
	suma int;
begin
	select sum(saldo) into suma from "schFinanciero"."cuentasClientes";
	raise notice 'El saldo total es %', suma;
end
$$

call "schFinanciero"."sumarSaldos"();
