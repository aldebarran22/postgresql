-- Tipos basados en cols o en tablas:
do $$
declare
	categoria tbcategorias%rowtype;
	pais tbpedidos.paisdestinatario%type;
begin
	select * into categoria from tbcategorias where id=3;
	raise notice 'categoria: %', categoria;
	raise notice 'categoria: %, %', categoria.id, categoria.nombre;
	
	select paisdestinatario into pais from tbpedidos where id=10250;
	raise notice 'pais: %', pais;
end $$;