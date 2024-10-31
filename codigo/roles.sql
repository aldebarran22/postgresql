

-- Creamos grupos
create group administradores;
create group directores;
create group supervisores;

-- Crear usuario
create user antonio with password 'antonio' in group administradores;

select * from pg_shadow;

grant select on tbclientes to group empleados;

SELECT r.rolname,
r.rolsuper,
r.rolinherit,
r.rolcreaterole,
r.rolcreatedb,
r.rolcanlogin,
r.rolconnlimit,
ARRAY( SELECT b.rolname
FROM pg_catalog.pg_auth_members m
JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
WHERE m.member = r.oid
) as miembrode
FROM pg_catalog.pg_roles r
ORDER BY 1;




create user juan with password 'juan';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO juan;




