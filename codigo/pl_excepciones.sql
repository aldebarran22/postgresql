-- control de excepciones

do $$
declare
	cuenta integer;
	registro record;
	a integer;
	b integer;
	resul integer;
	
	text1 text;
	text2 text;
	text3 text;
begin
	select * into strict registro from tbpedidos where id > 1;
	raise info 'Pedido: %', registro;

	a = 10;
	b = 0;
	resul = a / b;
	
exception
	when too_many_rows then
		raise notice 'La cond. genera muchos resultados.';
	
	when division_by_zero then
		raise notice 'Se ha producido una excep.';
	
	
	when others then
		get stacked diagnostics text1 = MESSAGE_TEXT,
								text2 = PG_EXCEPTION_DETAIL,
								text3 = PG_EXCEPTION_HINT;
		raise info 'error: %, %, %', text1, text2, text3;
end $$