-- Crear función para el trigger de actualización de saldos:
create function "schFinanciero".transferencia()
returns trigger
language plpgsql
as $$
	declare
		usuario varchar(20);		
	begin
		select user into usuario;
		
		insert into "schFinanciero"."logCuentasClientes"
		values(usuario, now(), new.codigo, 'M', old.saldo, new.saldo);
		
		return new;
	end
$$