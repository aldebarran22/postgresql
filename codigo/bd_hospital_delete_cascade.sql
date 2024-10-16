-- Prueba borrado en cascada:

insert into perfiles(nombre) values ('medico'),('enfermero'),('celador');

select * from perfiles;

insert into personal values('A23','nombre1',1);
insert into personal values('A24','nombre2',1);
insert into personal values('A25','nombre3',1);

insert into personal values('B2','enf1',2);
insert into personal values('B4','enf2',2);

select * from personal;

delete from perfiles where id=1;

delete from personal where idperfil=2;