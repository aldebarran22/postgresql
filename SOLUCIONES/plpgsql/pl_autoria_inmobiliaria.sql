create extension dblink;

-- funcion para ejecutar a través de un trigger
create or replace function funcion_auditar() returns trigger as
$$
begin
	perform dblink_connect('dbname=auditoria user=postgres password=antonio');
	if TG_OP='DELETE' then
		
		perform dblink_exec('insert into tabla_auditoria(nombre_tabla,operacion,
						   valor_viejo, valor_nuevo, fecha_actual, usuario) values
							('''||TG_TABLE_NAME||''', '''||TG_OP||''','''||OLD||''',
						   NULL, now(), USER);');
				
	elsif TG_OP = 'UPDATE' then
		perform dblink_exec('insert into tabla_auditoria(nombre_tabla,operacion,
						   valor_viejo, valor_nuevo, fecha_actual, usuario) values
							('''||TG_TABLE_NAME||''', '''||TG_OP||''','''||OLD||''',
						   '''||NEW||''', now(), USER);');			
	
	elsif TG_OP = 'INSERT' then
		perform dblink_exec('insert into tabla_auditoria(nombre_tabla,operacion,
						   valor_viejo, valor_nuevo, fecha_actual, usuario) values
							('''||TG_TABLE_NAME||''', '''||TG_OP||''',NULL,
						   '''||NEW||''', now(), USER);');			
	end if;
	
	perform dblink_disconnect();
	return null;

end;
$$
language 'plpgsql';

-- EL trigger:
create trigger tbl_atributos_tg_audit
after insert or update or delete 
on "Contrato"
for each row execute procedure funcion_auditar();

-- Insercciones en la tabla de contrato, deben activar el trigger y debería
-- generar registros en la base de datos auditoria -> tabla_auditoria;
insert into "Contrato" values('con001', 300, 'contado',150, TRUE, '2023-11-05',
							'2024-01-20', 'inm001','emp002','cli001',4);
insert into "Contrato" values('con002', 1300, 'contado',250, TRUE, '2023-11-15',
							'2024-06-01', 'inm002','emp002','cli041',4);
update "Contrato" set importe_mensual_con = 550
where id_con = 'con001';
delete from "Contrato" where id_con='con002';

