create table if not exists ac_alumnos 
   (	codalumn integer not null primary key, 
	nombre character varying(30), 
	telefono character varying(20), 
	direccion character varying(50), 
	nacimiento character varying(20), 
	edad integer, 
	matricula character varying(5)
   );
   
   create table if not exists ac_asignaturas 
   (	codasig integer not null primary key, 
	nombreasig character varying(40), 
	precio integer
   );
   
   create table if not exists ac_clases 
   (	codalumn character varying(20), 
	codprofe character varying(20), 
	codasig character varying(20), 
	aula character varying(20),
	primary key(codalumn, codprofe, codasig)
   );
   
   create table if not exists ac_profesores 
   (	codprofe integer not null primary key, 
	nombre character varying(40), 
	direccion character varying(40), 
	dni character varying(20), 
	telefono character varying(20), 
	fecha date, 
	puestofijo boolean,
	sueldo integer
   ) ;
