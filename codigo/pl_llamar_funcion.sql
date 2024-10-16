-- Bloque de prueba del PL:

do $$
declare 
	-- Definir una var. e inicializarla
	idpedido integer=10250;
begin
	raise info 'El iva de 100 son %', calcular_iva(100);
	raise info 'El importe total del pedido: % es %', idpedido, calcularpedido(idpedido);
end $$;

