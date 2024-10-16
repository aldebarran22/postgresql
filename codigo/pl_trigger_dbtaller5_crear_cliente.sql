-- Función asociada al trigger que controla las altas de nuevos usuarios:
create function "schFinanciero".nuevocliente()
returns trigger
language plpgsql
as 
$$
	declare
		usuario varchar(20);
	begin
		-- Recuperar el usuario (de PostgreSQL) que ha creado el nuevo cliente:
		select user into usuario;
		
		-- Grabar un movimiento de alta con los datos del nuevo usuario:
		insert into "schFinanciero"."logCuentasClientes"
		values(usuario, now(), new.codigo, 'A', 0, 0);

		return new;
	end
$$