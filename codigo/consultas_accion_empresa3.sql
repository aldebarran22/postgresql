-- Consultas de Acción en Empresa3

-- Borrar los pedidos que no tienen productos asociados:
select count(*) from tbpedidos
where id not in (select distinct idpedido from tbdetallespedidos);

delete from tbpedidos
where id not in (select distinct idpedido from tbdetallespedidos);

-- Borrar en la tabla de pedidos de Alemania, todos los pedidos 
-- del Empleado: Davolio.
delete from tbpealemania Ale 
using tbempleados emp
where Ale.idempleado=emp.id and emp.apellidos='Davolio';

-- Borrar pedidos por pais en un prepare:
prepare borraPedidosxPais(text) as 
delete from tbpedidos where paisdestinatario=$1;

execute borraPedidosxPais('Alemania');

prepare borraPedidos(text) as 
delete from tbpedidos where paisdestinatario like $1 || '%';

execute borraPedidos('F');

select distinct paisdestinatario from tbpedidos order by 1;

-- Inserción de nuevas filas:
-- Una nueva categoria:
insert into tbcategorias values(9, 'Viajes');
insert into tbcategorias values(
	(select max(id)+1 from tbcategorias), 'Películas');
	
-- Prepare para insertar una nueva categoria:
prepare nuevaCat(text) as
insert into tbcategorias values(
	(select max(id)+1 from tbcategorias), $1);
	
execute nuevaCat('Ocio');

-- Otra forma de insertar:
-- insert into tabladestino select 
create table if not exists pedidos as
select * from tbpedidos where id=1;

-- Copiar a la tabla pedidos los pedidos de 1998 (fechapedido):
insert into pedidos select * from tbpedidos 
where fechapedido between '01-01-1998' and '31-12-1998';

create table contactos (
	id serial primary key,
	nombre varchar(20)
);

insert into contactos(nombre) values('contacto1');
insert into contactos(nombre) values('contacto2');
insert into contactos(nombre) values('contacto3');
insert into contactos(nombre) values('contacto4'),('contacto5');

delete from contactos;

-- Para reiniciar los campos serial hay que especificar "restart identity"
truncate contactos restart identity;

select * from contactos;

-- Actualización de campos:
-- Subir el precio de las bebidas un 10%:
prepare subirPrecios(text,numeric) as
update tbproductos p
set preciounidad = preciounidad * (1 + $2/100)
from tbcategorias c
where p.idcategoria = c.id and c.nombre = $1;

execute subirPrecios('Bebidas',10);

select CURRENT_DATE-(30*365);


/*
Insertar una nueva empleada, es la hermana de King Robert Id = 7. 
Se llama Sara King, tratamiento = “Srta.”, FechaNacimiento = 5-abr-1965 y 
fecha de contratación: hoy. Resto de campos, copiarlos del hermano.
*/

insert into tbempleados
select (select max(id)+1 from tbempleados),
apellidos, 'Sara','Comercial','Srta.',CURRENT_DATE-(365*30),
ciudad, pais, telefono
from tbempleados
where nombre='Robert' and apellidos='King';









