-- Funciones para el cifrado asimétrico:
-- Partimos de dos tablas: privada y publica con las dos claves:
create or replace function cifrar(texto text) returns bytea as $$
declare
	key text; -- Almacenar la clave publica
	linea text; -- una linea de la clave
	cifrado text; -- El texto cifrado
begin
	-- concatenar todas las filas de la clave en un string
	key = '';
	for linea in select llave from publica loop
		key = key || linea || E'\n'; 
	end loop;
	
	--raise info 'Clave publica: \n';
	--raise info '%', key;
	
	cifrado = pgp_pub_encrypt(texto, dearmor(key));
	return cifrado;
end;
$$ language plpgsql


create or replace function descifrar(texto bytea, frase text) returns text as $$
declare
	key text; -- Almacenar la clave privada
	linea text; -- una linea de la clave
	descifrado text; -- El texto cifrado
begin
	-- concatenar todas las filas de la clave en un string
	key = '';
	for linea in select llave from privada loop
		key = key || linea || E'\n'; 
	end loop;
	
	--raise info 'Clave privada: \n';
	--raise info '%', key;
	-- Se descifra pasando la frase y la clave privada:
	descifrado = pgp_pub_decrypt(texto, dearmor(key), frase);
	return descifrado;
end;
$$ language plpgsql;

select encode(cifrar('hola que tal'), 'hex');
select descifrar(cifrar('hola que tal'), 'antonio');

-- Prueba: encripta con cifrado asimétrico el campo descripcion_enc
-- de la tabla de tbclientes:
update tbclientes 
set descripcion_enc = cifrar(descripcion);

select descripcion, encode(descripcion_enc,'hex') as enc 
from tbclientes limit 3;

select descripcion, descifrar(descripcion_enc, 'antonio')
from tbclientes limit 3;


