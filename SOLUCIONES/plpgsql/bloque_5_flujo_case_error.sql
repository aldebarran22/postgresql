-- bloque case con error
do $$
declare
  provincia integer:=48;
  nombre VARCHAR(40);
  
  begin
    case provincia
      when 32 then nombre:='Orense';
      when 36 then nombre:='Pontevedra';
   
    end case;
	
	raise notice 'nombre: %', nombre;
    
  end $$;