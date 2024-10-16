CREATE DATABASE dbtaller3;
\connect dbtaller3;
CREATE SCHEMA "schFinanciero";

CREATE TABLE "schFinanciero"."cuentasClientes"
( codigo smallint,
  nombre varchar(20),
  saldo integer
);

CREATE INDEX idxcuentasClientes on "schFinanciero"."cuentasClientes" (codigo);

INSERT INTO "schFinanciero"."cuentasClientes" VALUES(10, 'Alejandro', 10000);
INSERT INTO "schFinanciero"."cuentasClientes" VALUES(12, 'Andrea', 10000);
INSERT INTO "schFinanciero"."cuentasClientes" VALUES(14, 'Danna', 10000);
