-- Consultas básicas con funciones de agregado

/* 

select campos from tabla
where criterios de FILA
group by columnas
having criterios de GRUPO

*/

-- Cuántos alumnos tenemos de Madrid:
select count(*) as cuenta from ac_alumnos where nacimiento = 'madrid';

-- Cuántos alumnos tenemos por ciudad --> GRUPOS
select nacimiento, count(*) as cuenta from ac_alumnos
group by nacimiento order by 2 desc;


-- De las asignaturas: cuantas, suma, media, minimo y maximo
select count(codasig) as cuenta, sum(precio) as suma, avg(precio) as media, min(precio) as minimo, max(precio) as maximo
from ac_asignaturas;

