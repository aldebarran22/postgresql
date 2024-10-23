/* Operaciones con joins 

inner join
==========
A		B
1		1
2		2
3		5
4
6

Resul: 1-1, 2-2

left join
=========
A		B
1		1
2		2
3		5
4
6

Resul: 1-1, 2-2, 3-null, 4-null, 6-null

right join
==========
A		B
1		1
2		2
3		5
4
6

Resul: 1-1, 2-2, 5-null

*/

/*
insert into comida values('Miguel');
insert into comida values('Ana');
insert into comida values('Jaime');
insert into comida values('Maria');
insert into comida values('Raquel');

insert into cena values('Javier');
insert into cena values('Ana');
insert into cena values('Juan');
insert into cena values('Maria');
insert into cena values('Sofia');*/


-- Quien va a comer y a cenar:
select co.nombre, ce.nombre 
from comida co inner join cena ce
on co.nombre = ce.nombre;

-- Lo mismo con operadores a nivel de conjunto:
select nombre from comida
intersect
select nombre from cena;

-- Con subconsultas:
select nombre from comida 
where nombre in (select nombre from cena);



-- Quien va solo a comer:
select co.nombre 
from comida co left join cena ce
on co.nombre = ce.nombre where ce.nombre is null;

-- Lo mismo con operadores a nivel de conjunto:
select nombre from comida
except
select nombre from cena;

-- Con subconsultas:
select nombre from comida 
where nombre not in (select nombre from cena);

-- Quien va solo a cenar:
select ce.nombre 
from comida co right join cena ce
on co.nombre = ce.nombre where co.nombre is null;

-- Con subconsultas:
select nombre from cena 
where nombre not in (select nombre from comida);


-- Lo mismo con operadores a nivel de conjunto:
select nombre from cena
except
select nombre from comida;



--insert into comida values('Miguel');  Miguel se apunta dos veces a comer como lo detectamos?
select nombre
from comida
group by 1
having  count(*) > 1;



-- Quienes van un solo evento: coalesce devuelve el primer valor distinto de null.
select distinct coalesce(co.nombre, ce.nombre) as nombre
from comida co full join cena ce
on co.nombre = ce.nombre
where co.nombre is null or ce.nombre is null;

-- Con conjuntos: (comida - cena) | (cena - comida)
-- | union, & intersección, - diferencia
(select nombre from comida except select nombre from cena)
union
(select nombre from cena except select nombre from comida);

(select nombre from cena union select nombre from comida)
except
(select nombre from cena intersect select nombre from comida);


-- union:
select nombre from comida union select nombre from cena; -- QUITA LOS REPETIDOS

-- union all;
select nombre from comida union all select nombre from cena; -- NO QUITA REPETIDOS


-- Cuantas personas han participado en los eventos;
select count(*) from (select nombre from comida union select nombre from cena);





