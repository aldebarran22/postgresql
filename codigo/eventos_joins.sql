-- Consultas con joins:

/*
Tb1     Tb2
A		A
B		C
E		F
Z		Z

inner join (A-A, Z-Z) selecciona la filas donde ambas claves coincidan!
tb1 left join tb2 (A-A, B-null, E-null, Z-Z)
tb1 right join tb2 (A-A, C-null, F-null, Z-Z)
*/

-- Cargar nombres en comida:
/*
insert into comida values('Raquel');
insert into comida values('Angel');
insert into comida values('Raul');
insert into comida values('Sonia');
insert into comida values('Andres');

-- Cargar nombres en cena:

insert into cena values('Angel');
insert into cena values('Raul');
insert into cena values('Sonia');
insert into cena values('Sandra');
insert into cena values('Jose');*/


-- Quienes van a comer y a cenar:
select co.nombre from comida co 
inner join cena ce on co.nombre = ce.nombre;

-- Quienes van solo a comer:
select co.nombre from comida co 
left join cena ce on co.nombre = ce.nombre
where ce.nombre is null;

select co.nombre from cena ce 
right join comida co on co.nombre = ce.nombre
where ce.nombre is null;

-- Quienes van solo a cenar:
select ce.nombre from comida co 
right join cena ce on co.nombre = ce.nombre
where co.nombre is null;


-- Dar de alta una persona repetida en las cenas
-- Obtener quien está repetido en las cenas:
--insert into cena values('Sandra');
select nombre from cena
group by nombre
having count(nombre) > 1;

-- Obtener quien va solo a uno de los dos eventos:
select co.nombre as _comida, ce.nombre as _cena 
from comida co full join cena ce on
co.nombre = ce.nombre
where co.nombre is null or ce.nombre is null;


-- Quienes han participado en los eventos:
select nombre from comida
union
select nombre from cena;

-- Con repetidos:
select nombre from comida
union all
select nombre from cena;

/*
intersect -> intersección (quien va a comer y a cenar)
except -> diferencia: A = {1,2,3,4}, B = {3,4,5,6} A-B = {1,2}, B-A={5,6}
*/

--quien va a comer y a cenar, inner join
select nombre from comida
intersect
select nombre from cena;

-- Quien va solo a comer:
select nombre from comida
except
select nombre from cena;





