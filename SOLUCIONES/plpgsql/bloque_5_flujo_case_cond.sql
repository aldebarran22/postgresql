-- Case evaluar por condición:
do $$
declare 
    provincia integer:=14;
    comunidad VARCHAR(40);
  begin
    case
      when provincia in (02,13,16,19,45) THEN
        comunidad:='Castilla la mancha';
      when provincia in (04,11,14,18,21,23,29,41) then
        comunidad:='Andalucía';
      else
        comunidad:='Otra comunidad';
      end case;
	  
	  raise notice 'comunidad: %', comunidad;
  end $$;