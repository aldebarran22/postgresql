-- Definir una función que actualiza un 10% el precio de los productos
-- si estamos en la primera quincena del mes y un 15% si estamos en la 
-- segunda quincena.
create or replace function actualizarproductos() returns boolean
as
$$
declare
	dia integer;
begin
	-- Copiar la tabla de productos:
	create table if not exists tbproductos_copia as select * from tbproductos;
	
	-- Capturar el dia del mes en el que estamos:
	select extract(day from current_date) into dia;
	
	if dia <= 15 then
		update tbproductos set preciounidad = preciounidad * 1.10;
	else 
		update tbproductos set preciounidad = preciounidad * 1.15;
	end if;	
	return found;	
end
$$
language plpgsql;

select p1.preciounidad, p2.preciounidad 
from tbproductos p1 
inner join tbproductos_copia p2 on p1.id = p2.id;

-- Prueba funcion:
select actualizarproductos();

select extract(day from current_date);