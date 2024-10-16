
-- Ejemplos con select case:

-- Acumulado de pedidos por compañia:
select c.nombre, count(p.id) as cuenta,
case 
	when count(p.id) < 250 then 'normal'
	when count(p.id) < 300 then 'super'
	else 'vip'
end as tipo
from tbcompaniaenvios c inner join tbpedidos p
on c.id = p.idcompanya
group by 1;

select 
case tratamiento
	when 'Srta.' then 'SEÑORITA'
	when 'Dr.' then 'DOCTOR'
	when 'Sr.' then 'SEÑOR'	
	when 'Sra.' then 'SEÑORA'
end as tratamiento2,
nombre, apellidos, tratamiento
from tbempleados;
