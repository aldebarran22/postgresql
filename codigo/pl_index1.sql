-- Indices sobre la BD dbtaller7:
create index idxclase on "schComercial"."claseMovimiento"
using btree(clasemovimiento);

explain
select * from "schComercial"."claseMovimiento"
where tipomovimiento = 'E';

explain
select * from "schComercial"."claseMovimiento"
where clasemovimiento = 101;

-- por defecto btree y sobre la fechamovimiento asc de la tabla movimiento
create index idxmovimientos on "schComercial"."movimientos"
(fechamovimiento ASC);

select * from pg_indexes where schemaname='schComercial';

-- Crear un indice indicando el tablespace:
create index idx2movimientos on "schComercial".movimientos
(tipomovimiento ASC)
tablespace pg_default;

-- Indice multicolumna: en reporteMovimiento
create index idxreporte1 
on "schComercial"."reporteMovimiento"
using btree (anio, mes);

create index idxreporte2 
on "schComercial"."reporteMovimiento"
using btree (mes, anio);

drop index "schComercial".idxreporte2;

explain
select * from "schComercial"."reporteMovimiento"
where anio = 2023 and mes=11;

explain
select * from "schComercial"."reporteMovimiento"
where totalentradas > 0;-- and anio=2023;




