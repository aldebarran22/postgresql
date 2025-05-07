
-- Ejemplos con Joins

/* 

Tabla1
col 1  col 2
1      AAA
2      BBB
3      CCC


Tabla2
col 1  col 2
1      aaa
3      ccc
5      fff

c1 = {1,2,3} c2 = {1,3,5}  c1 inner join c2 -> {1,3} intersección de conjuntos

c1 = {1,2,3} c2 = {1,3,5}  la unión => {1,2,3,5}

c1 = {1,2,3} c2 = {1,3,5}  c1 left join c2 ->  c1 - c2 = {2}       diferencia de conjuntos
c1 = {1,2,3} c2 = {1,3,5}  c2 left join c1 ->  c2 - c1 = {5} 



select t1.col1, t1.col2, t2.col1, t2.col2 from tabla1 t1
inner join tabla2 t2
on t1.col1 = t2.col1
 1, AAA, 1, aaa
 3, CCC, 3, ccc

select t1.col1, t1.col2, t2.col1, t2.col2 from tabla1 t1
left join tabla2 t2
on t1.col1 = t2.col1
 1, AAA, 1, aaa
 2, BBB, null, null
 3, CCC, 3, ccc

select t1.col1, t1.col2, t2.col1, t2.col2 from tabla1 t1
right join tabla2 t2
on t1.col1 = t2.col1
 1, AAA, 1, aaa
 3, CCC, 3, ccc
 5, fff, null, null


*/


-- QUIEN VA A COMER Y A CENAR
select co.nombre, ce.nombre from comida co inner join cena ce on co.nombre = ce.nombre;
select nombre from comida where nombre in (select nombre from cena);


-- para ver los nulos
select co.nombre, ce.nombre from comida co left join cena ce on co.nombre = ce.nombre;

-- quien va solo a comer:
select co.nombre from comida co left join cena ce on co.nombre = ce.nombre where ce.nombre is null;
select co.nombre from cena ce right join comida co on co.nombre = ce.nombre where ce.nombre is null;
select nombre from comida where nombre not in (select nombre from cena);
-- hacerlo con operadores a nivel de conjunto:
select nombre from comida
except
select nombre from cena;


-- quien va solo a cenar:
select ce.nombre from cena ce left join comida co on ce.nombre = co.nombre where co.nombre is null;
select ce.nombre from comida co right join cena ce on co.nombre = ce.nombre where co.nombre is null;
select nombre from cena where nombre not in (select nombre from comida);
select nombre from cena
except
select nombre from comida;


-- Una persona se apunta dos veces a comer, ¿cómo lo detectamos?
insert into comida values('Raquel');








