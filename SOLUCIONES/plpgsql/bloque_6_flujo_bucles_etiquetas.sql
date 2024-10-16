-- bucles con etiquetas:
do $$
declare
	i integer;
	j integer;
begin
	i:=0;
	<<exterior>>
	loop
		exit when i > 3; 		
		raise notice 'i = %', i;
		i:=i+1;
		
		j:=0;
		loop
			exit exterior when i>0 and j>2;
			raise notice 'j = %', j;
			j:=j+1;		
		
		end loop;
	
	end loop exterior;

end $$;