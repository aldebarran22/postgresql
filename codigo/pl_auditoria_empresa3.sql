create extension dblink;

-- Funcion del trigger:
create or replace function funcion_audit() returns trigger as
$$
declare
	fila_nueva text;
	fila_vieja text;
	cad_sql text;
begin
	-- TG_OP -> ES LA OPERACION QUE SE HA REALIZADO INSERT, UPDATE O DELETE
	-- TG_TABLE_NAME -> NOMBRE DE LA TABLA DONDE SE HA REALIZADO LA OPERACION
	
	raise info '% %', TG_OP, TG_TABLE_NAME;
	
	perform dblink_connect('dbname=audit user=postgres password=antonio');
	if TG_OP='DELETE' then
		cad_sql = 'insert into tabla_auditoria(nombre_tabla,operacion,
						   valor_viejo, valor_nuevo, fecha_actual, usuario) values
							('''||TG_TABLE_NAME||''', '''||TG_OP||''','''||OLD||''',
						   NULL, now(), USER);';
		
	elsif TG_OP='INSERT' then
		cad_sql = 'insert into tabla_auditoria(nombre_tabla,operacion,
						   valor_viejo, valor_nuevo, fecha_actual, usuario) values
							('''||TG_TABLE_NAME||''', '''||TG_OP||''',NULL,
						   '''||NEW||''', now(), USER);';
		
	elsif TG_OP='UPDATE' then
		cad_sql = 'insert into tabla_auditoria(nombre_tabla,operacion,
						   valor_viejo, valor_nuevo, fecha_actual, usuario) values
							('''||TG_TABLE_NAME||''', '''||TG_OP||''','''||OLD||''',
						   '''||NEW||''', now(), USER);';
	end if;
						   
	raise info 'sql: %', cad_sql;
	perform dblink_exec(cad_sql);
	perform dblink_disconnect();
	return null;
end;
$$
language 'plpgsql';


-- Trigger categorías:
create trigger tg_audit_categorias 
after insert or update or delete
on tbcategorias
for each row execute procedure funcion_audit();

-- Trigger compañías:
--drop trigger tg_audit_categorias on tbcompaniaenvios;
create trigger tg_audit_tbcompaniaenvios 
after insert or update or delete
on tbcompaniaenvios
for each row execute procedure funcion_audit();

-- Pruebas para ver como se registran los datos:
insert into tbcategorias values(11, 'viajes');
insert into tbcategorias values(17, 'ocio4');
delete from tbcategorias where id>12;
update public.tbcompaniaenvios
set telefono='123456789'
where id=1;
