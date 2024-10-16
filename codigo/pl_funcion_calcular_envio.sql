-- Cálculo del importe de un envío utilizando una función:
create or replace function calcular_envio(numdiasdel integer,
										 fecharecepcion date,
										 fechaentrega date,
										 importe double precision,
										 descuentopordia double precision) 
										 returns double precision
as
$$
declare
	numdiasenvio integer;
	numdiaspasados integer;
	nuevoimporte double precision;
begin
	numdiasenvio = fechaentrega - fecharecepcion;
	
	if numdiasenvio > numdiasdel then
		numdiaspasados = numdiasenvio - numdiasdel;
		nuevoimporte = importe - (numdiaspasados * descuentopordia);
		--raise info 'Dias envio: % se pasa %', numdiasenvio, numdiaspasados;
		if nuevoimporte >= 0 then
			return nuevoimporte;
		else
			return 0.0;
		end if;	
		
	else
		--raise info 'Dias envio: % ok', numdiasenvio;
		return importe;
	end if;	
end
$$
language plpgsql;


select d.numdias, e.fecharecepcion, e.fechaentrega, 
te.importe, te.descuentopordia, 
calcular_envio(d.numdias, e.fecharecepcion, e.fechaentrega, te.importe, te.descuentopordia)
as precio_envio
from tb2_delegaciones d 
inner join tb2_clientes c on c.iddelegacion = d.id
inner join tb2_envios e on e.idcliente = c.id
inner join tb2_tiposenvio te on te.id = e.idtipoenvio;