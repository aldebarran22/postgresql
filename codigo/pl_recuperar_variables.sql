-- Recuperar variables desde PL
do $$
declare
	fpedido date;
	fenvio date;
	fentrega date;
begin
	-- Recuperar más de una variable en un select:
	select fechapedido, fechaentrega, fechaenvio into fpedido, fentrega, fenvio
	from tbpedidos where id=10248;
	
	raise info 'Las fechas son: % % %', fpedido, fentrega, fenvio;

end $$;