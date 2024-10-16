-- Pruebas con pgcryto:

-- FUNCIONES DE CIFRADO SIN RECUPERACION:
select md5('mensaje a cifrar');

-- bytea: array de bytes.

-- Rellenar la columna de los password de la tabla de clientes:
update tbclientes
set password = md5(id);

select id, password from tbclientes;

-- Desde una aplicacion:
select * from tbclientes where password=md5('ALFKI');

select digest('contenido del mensaje', 'md5');
-- Los datos binarios se codifican en hex:
select encode(digest('contenido del mensaje', 'md5'), 'hex');

-- Otro algoritmos: sha1, sha256 y sha512
select encode(digest('contenido del mensaje', 'sha512'), 'hex');

select encode(hmac('contenido', '1234', 'md5'), 'hex')
union
select encode(hmac('contenido', '1235', 'md5'), 'hex');

select gen_salt('md5');
select gen_salt('bf');

select crypt('mensaje a cifrar', gen_salt('md5'));
select crypt('mensaje a cifrar', gen_salt('bf'));

-- FUNCIONES DE CIFRADO SIMETRICO CON UNA CLAVE:
SELECT column_name                  --Seleccionamos el nombre de columna
FROM information_schema.columns     --Desde information_schema.columns
WHERE table_schema = 'public'       --En el esquema que tenemos las tablas en este caso public
AND table_name   = 'tbclientes'; 

-- Prueba funciones encriptado simétrico:
select encode(pgp_sym_encrypt('hola','12345'),'hex');


create or replace procedure encriptar_campo(
	tabla varchar, campo varchar, campo_destino varchar,
	clave text)
language plpgsql
as $$
declare
	sql text;
begin
	sql = 'alter table '||tabla||' add column '||campo_destino || ' text;'; 
	raise info '%', sql;
	--execute sql;
	
	sql = 'update ' || tabla || ' set ' || campo_destino || 
	' = pgp_sym_encrypt('||campo||','''||clave||''');'; 
	raise info '%', sql;
	execute sql;
	
	raise info 'ok';
end $$

call encriptar_campo('tbempleados','cargo','cargo_enc', '12345');
call desencriptar_campo('tbempleados','cargo_enc','cargo', '12345');




 




