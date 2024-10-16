-- Crear Base de datos: dbtaller5;
CREATE SCHEMA "schFinanciero";

CREATE TABLE "schFinanciero"."cuentasClientes"
(
    codigo smallint,
    nombre character varying(20),
    saldo integer
)

TABLESPACE pg_default;

ALTER TABLE "schFinanciero"."cuentasClientes"
    OWNER to postgres;

CREATE INDEX idxcuentasclientes
    ON "schFinanciero"."cuentasClientes" USING btree (codigo ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE TABLE "schFinanciero"."logCuentasClientes"
(
    usuario character varying(20),
    fechahora timestamp without time zone,
    cliente integer,
    accion character(1),
    saldoanterior integer,
    nuevosaldo integer
);

CREATE PROCEDURE "schFinanciero"."crearCliente"(
	vcodigo integer,
	vnombre character varying)
LANGUAGE 'sql'
AS $$
INSERT INTO "schFinanciero"."cuentasClientes"
  VALUES (vcodigo, vnombre, 0);
$$;

CALL "schFinanciero"."crearCliente"(10, 'ALEJANDRO GUZMAN');
CALL "schFinanciero"."crearCliente"(20, 'ANDREA RIOS');
CALL "schFinanciero"."crearCliente"(30, 'DANNA KATHERINE');



CREATE OR REPLACE PROCEDURE "schFinanciero".transferir(
	origen integer,
	destino integer,
	valor numeric)
LANGUAGE 'sql'
AS $$
UPDATE "schFinanciero"."cuentasClientes"
     SET saldo = saldo - valor
   WHERE codigo = origen;
   
  UPDATE "schFinanciero"."cuentasClientes"
     SET saldo = saldo + valor
   WHERE codigo = destino;
$$;


  
