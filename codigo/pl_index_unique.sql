-- Crear un índice único para los paises:

create unique index idxpais on paises(pais ASC);

insert into paises(pais) values('Alemania');
insert into paises(pais) values('Francia');
insert into paises(pais) values('Italia');

-- Repetir un pais:
insert into paises(pais) values('Italia');

insert into paises(pais) values(null);

delete from paises where pais is null;
