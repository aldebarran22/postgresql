--ejemplo continue:
do $$
declare
x integer;
begin
x:=0;
<<incremento>>
loop
	x:=x+1;
	exit incremento when x > 10;
	continue incremento when mod(x, 2) =0;
	-- Cuando se cumple la condición esta línea no se ejecuta:
	insert into clientes (numerocliente)  values (x);
end loop incremento;
commit;
end $$;
