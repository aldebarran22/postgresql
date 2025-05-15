create table paises
(
	codigo char(2),
	pais varchar(20)
);

create unique index uidproductos on paises(codigo);

