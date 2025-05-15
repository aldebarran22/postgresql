-- Función para cifrado asimétrico:

create or replace function cifra(texto text) returns bytea
as $$
declare
	linea text;
	key text;
	cifrado text;
	
begin
	key = '';
	for linea in select llave from publica loop
		key = key || linea || E'\n';		
	end loop;
	raise notice 'LLAVE:';
	raise notice '======';
	raise notice '%', key;
	cifrado = pgp_pub_encrypt(texto, dearmor(key));
	return cifrado;

end;
$$ language plpgsql;


create or replace function descifra(texto bytea) returns text
as $$
declare
	linea text;
	key text;
	descifrado text;
begin
	key = '';
	for linea in select llave from privada loop
		key = key || linea || E'\n';
	end loop;
	-- Tenemos que pasar la frase.
	descifrado = pgp_pub_decrypt(texto, dearmor(key),'antonio');
	return descifrado;
end;
$$ language plpgsql;