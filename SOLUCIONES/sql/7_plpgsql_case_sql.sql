select ce.id, ce.nombre, count(*) as cuenta, 
case 
  when count(*) >= 150 and count(*) < 250 then 'Simple'
  when count(*) >= 250 and count(*) < 300 then 'Normal'
  when count(*) >= 300 and count(*) < 350 then 'Super'
end as clasificacion    
from tbcompaniaenvios ce
left join tbpedidos pe
on pe.idcompanya = ce.id
group by ce.id, ce.nombre
order by ce.id;