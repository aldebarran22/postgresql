-- bucles:
do $$
declare
	i integer;
begin
	i:=0;
	loop
		exit when i > 9; 
		
		raise notice 'i = %', i;
		i:=i+1;
	
	end loop;

end $$;