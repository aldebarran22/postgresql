-- bloque: carga una variable con una consulta:
do $$
declare
	cuenta integer;
begin
	-- calcular el numero de pedidos:
	select count(*) into cuenta from tbpedidos;
	raise notice 'numero de pedidos: %', cuenta;
end $$;