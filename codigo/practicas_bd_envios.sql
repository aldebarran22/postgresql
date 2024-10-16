-- Funciones SQL:

-- Pruebas con el grupo de fecha/hora:
select current_date, current_time, current_timestamp;

select current_date+5;
select current_date-7;

select current_date-(current_date-7);

select to_date('2024-02-28','yyyy-mm-dd')+1;
select to_date('2023-02-28','yyyy-mm-dd')+1;

select extract(second from current_timestamp) as SG;

select to_char(current_date, 'month') as mes_actual;
select to_char(localtimestamp(0), 'month');
select to_char(current_date, 'mm') as mes_actual_numero;


-- Obtener un listado de los clientes calculando los años de antigüedad. 
-- Ordenarlo decreciente por el campo antigüedad.
-- Si queremos la antiguedad con decimales dividir por 365.0
select c.nombre, d.delegacion, c.fechaalta as fecha_alta, 
(current_date-c.fechaalta) / 365 as antiguedad 
from tb2_clientes c 
inner join tb2_delegaciones d 
on c.iddelegacion=d.id order by 4 desc;

-- Obtener el número de envíos que pasan por un determinado país 
-- durante el mes de Febrero. 
-- El país se indicará cada vez que se ejecute la consulta
deallocate envios_feb;
prepare envios_feb(varchar) as
select count(*) as numRegistros 
from tb2_envios e 
inner join tb2_tiposenvio te on e.idtipoenvio = te.id
inner join tb2_paises p  on te.idpaisorigen = p.id
inner join tb2_paises p1 on te.idpaisdestino = p1.id
where (to_number(to_char(e.fechaentrega, 'mm'),'99') = 2) 
and (p.pais=$1 or p1.pais=$1);

execute envios_feb('Alemania');

select p.pais as origen, p1.pais as destino, 
date_part('month',e.fechaentrega) as mes
from tb2_envios e 
inner join tb2_tiposenvio te on  e.idtipoenvio = te.id
inner join tb2_paises p  on te.idpaisorigen = p.id
inner join tb2_paises p1 on te.idpaisdestino = p1.id
where (p.pais='Alemania' or p1.pais='Alemania');

select to_number(to_char(current_date,'mm'),'99');
select to_number(to_char(to_date('2022-02-05','yyyy-mm-dd'),'mm'),'99');

-- Obtener el número de envíos solicitados por cada cliente y mes.
-- Ordenar por cliente y por mes: enero, febrero, marzo ...
-- Establece el locale en Español!
set lc_time to 'es_ES.utf8';
select to_char(now(), 'TMDay, DD TMMonth YYYY');
select to_char(current_date, 'TMMonth');

select nombre, mes from (
select c.nombre, date_part('month',e.fecharecepcion) as num_mes, 
	to_char(e.fecharecepcion, 'TMMonth') as mes,
count(e.id) as cuenta
from tb2_clientes c 
inner join tb2_envios e on e.idcliente = c.id
group by 1,2,3
order by 1,2);

insert into tb2_envios 
values((select max(id)+1 from tb2_envios),'2006-04-05','2006-04-07',1,1,5);


-- Pruebas con now() / current_date y sumar/restar intervalos
select current_date + 10; -- Por defecto son días!

-- Podemos indicar el intervalo de uds que queremos sumar:
select current_date + interval '2 month';

select current_date - interval '5 year';

select now() + interval '10 minute';

select age(timestamp '1957-06-13');

-- Utilizando sign generar un campo nuevo en los envios que nos indique
-- si el envío está en tiempo o se ha retrasado.
with estado_envios as (
select e.fecharecepcion, e.fechaentrega, 
e.fechaentrega-e.fecharecepcion as diasTrans,
d.numdias,
case
	when sign(d.numdias - (e.fechaentrega-e.fecharecepcion)) >= 0 then 'OK'
	else 'RETRASO'	
end as estado
from tb2_delegaciones d 
inner join tb2_clientes c on c.iddelegacion=d.id
inner join tb2_envios e on e.idcliente = c.id)
select 
sum(
	case estado
		when 'OK' then 1
		else 0
	end
	) as OK,
sum(
	case estado
		when 'RETRASO' then 1
		else 0
	end
	) as RETRASO
from estado_envios;

-- Funciones de texto:
-- A partir de la tabla de ciudades, localizar ciudades en mayúsculas, minúsculas
-- Madrid, madrid, MADRID
insert into cuentas_ciudades(ciudad, importe) values ('madrid',100);
insert into cuentas_ciudades(ciudad, importe) values ('Madrid',200);
insert into cuentas_ciudades(ciudad, importe) values ('madrid',400);
insert into cuentas_ciudades(ciudad, importe) values ('MADRID',-100);
insert into cuentas_ciudades(ciudad, importe) values ('madRID',100);

select * from cuentas_ciudades where upper(ciudad) = 'MADRID';
select * from cuentas_ciudades where lower(ciudad) = 'madrid';

select substring('hola que tal' from 1 for 4);
select substring('hola que tal' from 5);
select substring('hola que tal' from position(' ' in 'hola que tal'));

select nombre,
substring(nombre from 1 for position(' ' in nombre)-1) as nombre,
substring(nombre from position(' ' in nombre)+1) as apellido
from cuentas_ciudades;

select rpad(delegacion, 15, '-') from tb2_delegaciones;

select nullif(145, 345);







