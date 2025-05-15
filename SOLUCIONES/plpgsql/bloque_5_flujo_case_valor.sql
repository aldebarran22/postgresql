-- case Evaluación por valor;
do $$
declare
  provincia integer:=32;
  nombre VARCHAR(40);
  
  begin
    case provincia
      when 32 then nombre:='Orense';
      when 36 then nombre:='Pontevedra';
      else nombre:= 'fuera de la comunidad';
    end case;
	
	raise notice 'nombre: %', nombre;
    
  end $$;