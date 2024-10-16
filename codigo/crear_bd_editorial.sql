drop table if exists editoriales;
drop table if exists libros;

create table editoriales(
codigo serial,
nombre varchar(30),
primary key (codigo)
);

create table libros (
codigo serial,
titulo varchar(40),
autor varchar(30),
codigoeditorial smallint,
precio decimal(5,2),
primary key(codigo)
);

insert into editoriales(nombre) values('Planeta');
insert into editoriales(nombre) values('Emece');
insert into editoriales(nombre) values('Paidos');
insert into editoriales(nombre) values('Siglo XXI');

insert into libros(titulo,autor,codigoeditorial,precio) values('Uno','Richard Bach',1,15);
insert into libros(titulo,autor,codigoeditorial,precio) values('Ilusiones','Richard Bach',4,18);
insert into libros(titulo,autor,codigoeditorial,precio) values('Puente al infinito','Richard Bach',2,20);
insert into libros(titulo,autor,codigoeditorial,precio) values('Aprenda PHP','Mario Molina',4,40);
insert into libros(titulo,autor,codigoeditorial,precio) values('El aleph','Borges',2,10);
insert into libros(titulo,autor,codigoeditorial,precio) values('Antología','Borges',1,20);
insert into libros(titulo,autor,codigoeditorial,precio) values('Cervantes y el quijote','Borges',3,25);
