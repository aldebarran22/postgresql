-- Lanzar una exception desde PL en un bloque anidado

do $$
<<externo>>
declare
	text1 text;
	text2 text;
	text3 text;
begin
		<<interno>>
		declare
			producto record;
			text1 text;
			text2 text;
			text3 text;
		begin
			select * into producto from tbproductos where id=1;
			if found then
				raise info 'producto: %', producto;
			else
				raise exception 'no existe el producto';
			end if;

		exception
			when others then
				get stacked diagnostics text1 = MESSAGE_TEXT,
										text2 = PG_EXCEPTION_DETAIL,
										text3 = PG_EXCEPTION_HINT;
				raise info 'No existe el producto en interno, relanzamos al externo';
				raise exception 'error: %, %, %', text1, text2, text3;

		end interno;
		
		raise info 'en el bloque externo debajo del interno';
		
exception
	when others then
		get stacked diagnostics text1 = MESSAGE_TEXT,
								text2 = PG_EXCEPTION_DETAIL,
								text3 = PG_EXCEPTION_HINT;
		raise info 'error externo: %, %, %', text1, text2, text3;


end externo $$;

