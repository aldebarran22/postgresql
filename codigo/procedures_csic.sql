/* procedimientos almacenados en BD CSIC */


-- crear un procedimiento almacenado que obtenga el peso medio y el numero de muestras para una specie y una categoria dada:

create or replace procedure muestrasPesoMedio(cod_specie varchar, cod_categoria integer, out peso_medio float, out numero_muestras integer)
language plpgsql
as
$$
begin
	select round(avg(pesotot),2), count(*) into peso_medio, numero_muestras from biologicos
	where species_code = cod_specie and category_code = cod_categoria;
end
$$


do $$
declare
	media float;
	numero integer;
begin
	call muestrasPesoMedio('10152', 0, media, numero);
	raise notice 'media: %, numero: %', media, numero;
end $$;

