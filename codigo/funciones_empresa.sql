

-- Funciones de plpgsql:


-- Una función que devuelva el IVA de un precio:

create or replace function calcularIVA(precio numeric) returns numeric
as
$$
begin
	return precio * 0.21;
end;
$$
language 'plpgsql';

select nombre, preciounidad, calcularIVA(cast(preciounidad as numeric)) as iva from tbproductos;

-- Imprimir mensajes:
create or replace function imprimirMensaje() returns integer
as
$$
begin

	raise info 'mensaje desde la funcion';
	return 0;
end;
$$
language 'plpgsql';

select imprimirMensaje();


-- Conversor de coordenadas: 40.4 -> 40 24 0 
create or replace function conversorLatitud(grados numeric) returns numeric[]
as
$$
declare
	minutos numeric;
	segundos numeric;
	resultado numeric[4];
begin
	-- grados
	resultado[0] := abs(trunc(grados));
	
	-- minutos:
	minutos := (abs(grados) % 1) * 60.0;
	resultado[1] := minutos;

	-- segundos:
	segundos := (minutos % 1) * 60.0;
	resultado[2] := segundos;

	-- latitud N = 1, latitud S = -1
	resultado[3] := sign(grados);

	return resultado;
end;
$$
language 'plpgsql';

select conversorLatitud(40.4), conversorLatitud(-56.7);


create or replace function getLatLon(lat numeric, lon numeric) returns latlon
as
$$
declare
	resul latlon;
	latitud coordenada;
	longitud coordenada;
begin
	-- Conversión de la latitud:
	if lat < 0 then
		latitud.dir := 'S';
	else
		latitud.dir := 'N';

	end if;
	
	latitud.g := 0;
	latitud.m := 0;
	latitud.s := 0;
	

	-- Conversion de la longitud:
	if lon < 0 then
		longitud.dir := 'W';
	else
		longitud.dir := 'E';
	end if;

	longitud.g := 0;
	longitud.m := 0;
	longitud.s := 0;
	

	-- Rellenar el resultado:
	resul.latitud := latitud;
	resul.longitud := longitud;

	return resul;
	
end;
$$
language 'plpgsql';

select getLatLon(40.4, -3.68);


create type coordenada as (
 g integer,
 m integer,
 s integer,
 dir char(1)
);

create type latlon as (
  latitud coordenada,
  longitud coordenada
);









