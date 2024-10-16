/*
Prueba de bloques anidados!
*/
do $$
<<bloque_externo>>
begin
	raise notice 'dentro del bloque externo';
	
	<<bloque_interno>>
	begin
		raise notice 'dentro del bloque interno';
	end bloque_interno;

end bloque_externo $$;