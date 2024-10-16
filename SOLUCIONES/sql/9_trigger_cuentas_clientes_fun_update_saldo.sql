-- Trigger para las actualizaciones:
create function "schFinanciero"."logUpdateCuentaCliente"()
returns trigger
language PLPGSQL
as $$
	declare 
		vusuario varchar(20);
		vcodigo integer;
		vvalorantes integer;
		vvalornuevo integer;
		
	begin
		vcodigo = new.codigo;
		vvalorantes = old.saldo;
		vvalornuevo = new.saldo;
		
		select user into vusuario;
		insert into "schFinanciero"."logCuentasClientes"
		values(vusuario, now(), vcodigo, 'M',vvalorantes, vvalornuevo);
		
		return new;
		
	end
$$