

-- Pruebas con funciones estadísticas:
CREATE TABLE IF NOT EXISTS trayectoria
(
    id integer,
    fecha date,
    hora time without time zone,
    estado character(3) COLLATE pg_catalog."default",
    lat double precision,
    lon double precision,
    nudos integer,
    presion integer,
    
    CONSTRAINT huracan_pkey PRIMARY KEY (id)
);


create or replace function ECA() returns numeric as
$$
declare
	valorECA numeric;
	
begin
	select power(10,-4) * sum(power(nudos, 2)) into valorECA from trayectoria where nudos >= 35;
	return valorECA;
end;
$$
language plpgsql;


select ECA();

select * from trayectoria;

-- Velocidad media, minima y máxima:
select round(avg(nudos),2) as media, min(nudos) as vel_min, max(nudos) as vel_max from trayectoria;

-- Correlación entre velocidad y presion:
select round(corr(nudos, presion)::numeric, 4) as correlacion from trayectoria;

-- Desviación típica y varianza:
select variance(nudos) as varianza, stddev(nudos) as desviacion from trayectoria;


select power(10,-4);

-- La moda:
select mode() within group (order by nudos) as moda from trayectoria;


-- Percentiles:
select 
percentile_cont(0.25) within group (order by nudos) as perc_25,
percentile_cont(0.5) within group (order by nudos) as perc_50,
percentile_cont(0.75) within group (order by nudos) as perc_75
from trayectoria;




