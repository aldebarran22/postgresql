-- Pruebas con esquemas

create schema financiero;

create table financiero.productos as select * from "schComercial".productos;
create table public.productos as select * from "schComercial".productos;

select * from productos; --public
select * from financiero.productos;

delete from public.productos where activo=true;
delete from financiero.productos where activo=false;

set search_path to public, financiero, "schComercial";
set search_path to "schComercial", public, financiero;

select * from productos; -- ojo busca primero en schComercial
select * from public.productos;



