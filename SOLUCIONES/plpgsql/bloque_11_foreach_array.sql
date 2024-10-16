-- bucle foreach 
do $$
declare
	numeros int[];
	numeros2 int[]:=array[1,2,3,4];
	item integer;
begin
for i in 0..10 loop
	numeros[i]:=i*100;
end loop;
	
foreach item in array numeros  loop
	raise notice 'item: %', item;
end loop;

foreach item in array numeros2 loop
	raise notice 'item2: %', item;
end loop;
end $$;