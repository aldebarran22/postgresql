 create table if not exists tb2_categoriasoperador 
   (	id integer not null primary key, 
	categoria character varying(50), 
	sueldobase float, 
	prima float
   ) ;


  create table if not exists tb2_clientes 
   (	id integer not null primary key, 
	nombre character varying(50), 
	iddelegacion integer, 
	fechaalta date
   ) ;

  create table if not exists tb2_delegaciones 
   (	id integer not null primary key, 
	delegacion character varying(50), 
	numdias integer
   ) ;

  create table if not exists tb2_envios 
   (	id integer not null primary key, 
	fecharecepcion date, 
	fechaentrega date, 
	idtipoenvio integer, 
	idcliente integer, 
	idoperador integer
   ) ;

  create table if not exists tb2_operadores 
   (	id integer not null primary key, 
	codigo character varying(20), 
	nombre character varying(20), 
	iddelegacion integer, 
	idcategoria integer
   ) ;

  create table if not exists tb2_paises 
   (	id integer not null primary key, 
	pais character varying(40)
   ) ;

  create table if not exists tb2_tiposenvio 
   (	id integer not null primary key, 
	idpaisorigen integer, 
	idpaisdestino integer, 
	importe float, 
	descuentopordia float
   ) ;
