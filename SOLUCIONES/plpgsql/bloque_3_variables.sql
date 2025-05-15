-- definicion de vars e impresion
do $$
declare
	entero integer:=100;
	real float:= 45.77;
	texto varchar(20):='mensaje';
begin
	entero := entero + 1;
	real := real * 10;

	raise notice 'impresion de variables: % % %', entero, real, texto;
	raise notice 'entero %', entero;
	raise notice 'real %', real;
	raise notice 'texto: %', texto;
end $$;