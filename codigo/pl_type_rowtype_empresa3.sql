-- Definir variables que son del mismo tipo que una columna o una fila de una tabla

do $$
declare
	-- El mismo tipo que una fila de la tabla: tbempleados
	empleado tbempleados%rowtype;  
	-- El mismo tipo que la col: nombre de la tabla: tbcategorias
	categoria tbcategorias.nombre%type; 
	-- Cargar una fila en una variable de tipo registro:
	producto record;

begin
	-- Cargar las variables:
	select * into empleado from tbempleados where id=1;
	select nombre into categoria from tbcategorias where id=1;
	select * into producto from tbproductos where id=1;
	
	raise info 'La categoría: %', categoria;
	raise info 'Datos empleado: % % %', empleado.apellidos, empleado.nombre, empleado.cargo;
	raise info 'empl: %', empleado;
	raise info 'producto: %', producto;

end $$;