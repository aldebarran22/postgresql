-- Crear indices:
create index idxclase
	on "schComercial"."claseMovimiento"
	using btree (clasemovimiento);
	
	
create index idx1movimientos
	on "schComercial".movimientos
	(fechamovimiento ASC);
	
create index idx2movimientos
	on "schComercial".movimientos
	(tipomovimiento ASC)
	tablespace pg_default;
	
create index idxproductos
	on "schComercial".productos
	(codigoproducto ASC);
	
create index idx1reporte
on "schComercial"."reporteMovimiento"
using btree (codigoproducto ASC);

create index idx2reporte
on "schComercial"."reporteMovimiento"
using btree (anio, mes);

-- borrado de indices:
drop index "schComercial".idx1movimientos;
drop index "schComercial".idx2reporte;

-- Listar los indices:
select * from pg_indexes where schemaname='schComercial';

