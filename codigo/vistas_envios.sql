-- Crear una vista con la información de los envios:
drop view vista_envios;
create or replace view vista_envios as
select p.pais as pais_origen, p2.pais as pais_destino, 
te.importe, te.descuentopordia, e.fecharecepcion, e.fechaentrega, 
e.fechaentrega-e.fecharecepcion as numdiasEnvio,
d.numdias as numDiasDel
from tb2_tiposenvio te 
inner join tb2_paises p on te.idpaisorigen = p.id
inner join tb2_paises p2 on te.idpaisdestino = p2.id
inner join tb2_envios e on te.id = e.idtipoenvio
inner join tb2_clientes c on e.idcliente = c.id
inner join tb2_delegaciones d on d.id = c.iddelegacion;

select * from vista_envios;


-- Obtener cuantos envios están fuera de fecha (con la vista)
select count(*) as cuenta from vista_envios where numdiasdel < numdiasenvio;

