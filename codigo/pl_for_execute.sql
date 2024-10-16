-- Utilizar execute dentro de un bucle for con parámetros:
--  sumar los pedidos de un año y mes concreto:
do $$
declare
	sql text;
	pedido record;
	yy integer;
	mm integer;
	total integer default 0;
begin
	yy = 1997;
	mm = 6;
	
	sql = 'select id, cargo from tbpedidos 
	where extract(year from fechapedido)=$1 and extract(month from fechapedido)=$2';
	for pedido in execute sql using yy, mm loop
		raise info '%', pedido;
		total = total + pedido.cargo;
	end loop;
	raise info 'Total: %', total;

end $$;