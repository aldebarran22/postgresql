-- Crear las tablas de la BD metro:

create table estaciones (
	cod_est serial primary key,
	nombre varchar(50) not null
);

create table lineas (
	numero int primary key,
	nombre varchar(30),
	color varchar(20)
);

create table lineas_estaciones (
	cod_est int not null,
	numero int not null,
	
	primary key (cod_est, numero),
	foreign key (cod_est) references estaciones (cod_est) on delete cascade,
	foreign key (numero) references lineas (numero) on delete cascade	
);