-- ejemplo de excepciones:
do $$
declare
  precio integer;
  valor integer:=0;
  text_var1 text;
  text_var2 text;
  text_var3 text;
  
begin
  -- Capturar el precio de un producto:
  select preciounidad into precio from tbproductos where id=699;
  raise notice 'El precio es %', precio;
  
  select preciounidad into precio from tbproductos where id = 4;
  raise notice 'El precio es %', precio;
   
  -- Producir una división por cero:
  precio := precio / valor;
  
exception

  when no_data_found then
    -- No hay datos:
    raise notice 'Error: no hay datos';
  
  when too_many_rows then
    raise notice 'Error: se devuelven demasiadas filas';
    
  when division_by_zero  then
    raise notice 'division por cero';
	GET STACKED DIAGNOSTICS text_var1 = MESSAGE_TEXT,
                          text_var2 = PG_EXCEPTION_DETAIL,
                          text_var3 = PG_EXCEPTION_HINT;
	raise notice 'mensaje: %, %, %', text_var1, text_var2, text_var3;
    
end $$;
