-- Crear grupos y usuarios
create group admin_empresa3;
create group operadores_empresa3;

-- Otorgar permisos al grupo 
grant all on tbcategorias to group admin_empresa3;
grant update on public.tbcompaniaenvios to group admin_empresa3;

grant select on tbcategorias to group operadores_empresa3;

create user admin1 with password 'antonio' in group admin_empresa3;
create user operador1 with password 'antonio' in group operadores_empresa3;

-- Quitar permiso select al grupo de operadores_empresa3;
revoke select on table tbcategorias from operadores_empresa3;

-- Comprobar el usuario:


SELECT
r.rolname,
ARRAY(SELECT b.rolname
FROM pg_catalog.pg_auth_members m
JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
WHERE m.member = r.oid) as memberof
FROM pg_catalog.pg_roles r
WHERE r.rolname NOT IN ('pg_signal_backend','rds_iam',
'rds_replication','rds_superuser',
'rdsadmin','rdsrepladmin')
ORDER BY 1;