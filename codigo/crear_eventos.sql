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

-- Quien va solo a comer:
select co.nombre 
from comida co left join cena ce
on co.nombre = ce.nombre where ce.nombre is null;

-- Quien va solo a cenar:
select ce.nombre 
from comida co right join cena ce
on co.nombre = ce.nombre where co.nombre is null;
