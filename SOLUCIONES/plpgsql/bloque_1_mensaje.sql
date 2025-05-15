-- bloque anonimo

do $$
<<helloworld>>
begin
	raise notice 'prueba desde plpgsql';

end helloworld $$;