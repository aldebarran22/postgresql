-- crear el procedure para transferir el dinero de un 

create or replace procedure "schFinanciero".transferir(origen int, destino int, valor dec)
language sql
as
$$
	update "schFinanciero"."cuentasClientes"
	set saldo=saldo-valor
	where codigo=origen;
	
	update "schFinanciero"."cuentasClientes"
	set saldo=saldo+valor
	where codigo=destino;
$$


-- La llamada:
call "schFinanciero".transferir(10,12,5000);

select * from "schFinanciero"."cuentasClientes";