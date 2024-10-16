-- Lanzar una exception desde PL
do $$
declare
	producto record;
	text1 text;
	text2 text;
	text3 text;
begin
	select * into producto from tbproductos where id=100;
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
		raise info 'error: %, %, %', text1, text2, text3;
	
end $$

