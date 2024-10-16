-- Función para calcular el IVA de un importe:
create or replace function calcular_iva(precio numeric, iva numeric default 21) 
returns numeric
as
$$
begin
	return precio * (1 + iva/100.0);
end
$$
language plpgsql;