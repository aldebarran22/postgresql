-- Subconsultas con los eventos de comer y cenar:

/*
select col1 from tb1
where col1 in (select col2 from tb2 where col1 = col2)
*/

-- Quien va a comer y a cenar:
select nombre from comida 
where nombre in (select nombre from cena);

-- Quien va solo a comer:
select nombre from comida 
where nombre not in (select nombre from cena);

-- Quien va solo a cenar:
select nombre from cena 
where nombre not in (select nombre from comida);

