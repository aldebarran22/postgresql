-- La funcion asociada al trigger: logTblCuentaCliente
create function "schFinanciero"."logTblCuentaCliente"()
returns trigger
language PLPGSQL
as $$
	declare 
		vusuario varchar(20);
		vcodigo integer;
		
	begin
		vcodigo := new.codigo;
		
		select user into vusuario;
		
		insert into "schFinanciero"."logCuentasClientes" 
		values (vusuario, now(), vcodigo, 'A',0,0);
		
		return new;

	end 
$$