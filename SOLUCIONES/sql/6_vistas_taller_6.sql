create view "schComercial"."movProductoMes"
as
select extract(year from fechamovimiento) as vanio,
		extract(month from fechamovimiento) as mes,
		a.codigoproducto,
		b.descripcion,
		sum(case a.tipomovimiento
			when 'E' then cantidad
			else 0 end) as entradas,
		sum (case a.tipomovimiento
			when 'S' then cantidad
			else 0 end) as salidas
			from "schComercial".movimientos a
			inner join "schComercial".productos b
			on a.codigoproducto = b.codigoproducto
			group by 1,2,3,4;
			
select * from "schComercial"."movProductoMes";


create materialized view "schComercial"."movProductoMes2"
as
select extract(year from fechamovimiento) as vanio,
		extract(month from fechamovimiento) as mes,
		a.codigoproducto,
		b.descripcion,
		sum(case a.tipomovimiento
			when 'E' then cantidad
			else 0 end) as entradas,
		sum (case a.tipomovimiento
			when 'S' then cantidad
			else 0 end) as salidas
			from "schComercial".movimientos a
			inner join "schComercial".productos b
			on a.codigoproducto = b.codigoproducto
			group by 1,2,3,4;
			
-- OJO no refresca los datos: aunque hagamos select.
select * from "schComercial"."movProductoMes2";

-- Insertar un movimiento:
insert into "schComercial".movimientos
(fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto,cantidad)
values ('2021-06-01','101','E',778045,20);

-- OJO no refresca los datos: aunque hagamos select.
select * from "schComercial"."movProductoMes2";

-- Para refrescar la vista
refresh materialized view "schComercial"."movProductoMes2";

-- Ahora si refresca los datos: aunque hagamos select.
select * from "schComercial"."movProductoMes2";

			
			