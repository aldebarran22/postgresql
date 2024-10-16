-- Práctica 6  - Vistas:

-- Fechas: año y mes
-- Fecha actual
select CURRENT_DATE;

select extract(year from CURRENT_DATE) AS año, 
extract(month from CURRENT_DATE) AS mes;

-- La vista
create view vista_e_s as
select extract(year from m.fechamovimiento) AS año, 
extract(month from m.fechamovimiento) AS mes,
m.codigoproducto, p.descripcion,
sum(
	case tipomovimiento
   		when 'E' then m.cantidad 
		else 0
	end
   ) as Entradas,
sum(
	case tipomovimiento
   		when 'S' then m.cantidad 
		else 0
	end
   ) as Salidas
from "schComercial".movimientos m inner join "schComercial".productos p
on m.codigoproducto = p.codigoproducto
group by 1,2,3,4;

select * from vista_e_s;

