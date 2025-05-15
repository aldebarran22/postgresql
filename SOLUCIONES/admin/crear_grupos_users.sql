create group administradores;
create group directores;
create group supervisores;

create user admin_jose with password 'clave1' in group administradores;

select * from pg_shadow;