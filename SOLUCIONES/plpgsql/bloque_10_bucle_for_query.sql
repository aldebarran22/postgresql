-- bucle for con una query:
do $$
declare
fila record;
begin
for fila in select * from tbcategorias loop
	raise notice '%',fila;
end loop;
end $$;