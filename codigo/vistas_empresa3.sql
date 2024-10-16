-- Vista que muestra productos que son Bebidas
create or replace view vista_bebidas as
select p.* from tbproductos p
where p.idcategoria = (select id from tbcategorias where nombre='Bebidas')
with check option;

create materialized view vista_bebidas2 as
select p.* from tbproductos p
where p.idcategoria = (select id from tbcategorias where nombre='Bebidas');

select * from vista_bebidas;
select * from vista_bebidas2;

refresh materialized view vista_bebidas2;

insert into vista_bebidas values(103, 'Fanta',1,1,1,100,'1 pack de 12',50);