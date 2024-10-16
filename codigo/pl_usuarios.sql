-- Gestión de roles, usuarios, grupos:
create role administrador with superuser login password 'antonio';

create role administrador2 with login password 'antonio';

create role usuario1 with login 
connection limit 1
password 'antonio'
valid until '2023-11-07 13:05:00';

-- Si no indicamos que puede hacer login se trata de un grupo.
create role grupo2 with createdb;

-- Crear un usuario que solo hace login pero que pertenece al grupo2 y hereda
create role usuario2 with login
password 'antonio'
in role grupo2;

create role usuario3 with login inherit
password 'antonio'
role grupo2;

drop role usuario3;

create role usuario4 with login
password 'antonio';

-- El usuario4 puede consultar todos los campos de tbclientes
grant select on tbclientes to usuario4;

-- El usuario4 de tbpedidos solo puede consultar: id, paisdestinatario
grant select (id, paisdestinatario) on tbpedidos to usuario4;









