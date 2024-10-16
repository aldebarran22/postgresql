
CREATE SCHEMA "schComercial";

CREATE TABLE "schComercial".productos
(
    codigoproducto numeric(12,0) NOT NULL,
    descripcion character varying(30) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    existencias numeric NOT NULL DEFAULT 0,
    fechasaldo date
)
TABLESPACE pg_default;

ALTER TABLE "schComercial".productos OWNER to postgres;
COMMENT ON TABLE "schComercial".productos IS 'Información de los productos de la empresa';	

CREATE TABLE "schComercial"."claseMovimiento"
(
    clasemovimiento smallint NOT NULL,
    tipomovimiento character(1) NOT NULL,
    descripcion varchar(30) NOT NULL
)

TABLESPACE pg_default;
ALTER TABLE "schComercial"."claseMovimiento" OWNER to postgres;
COMMENT ON TABLE "schComercial"."claseMovimiento" IS 'Clases de movimientos';

CREATE TABLE "schComercial".movimientos
(
    consecutivo serial NOT NULL ,
    fechamovimiento date NOT NULL DEFAULT now(),
    clasemovimiento smallint NOT NULL,
    tipomovimiento character(1) NOT NULL,
    codigoproducto numeric(12,0) NOT NULL,
    cantidad smallint NOT NULL DEFAULT 0
)
TABLESPACE pg_default;
ALTER TABLE "schComercial".movimientos OWNER to postgres;
COMMENT ON TABLE "schComercial".movimientos IS 'Movimientos de entrada y salida de productos';

CREATE TABLE "schComercial"."reporteMovimiento"
(
    anio  smallint NOT NULL,
    mes   smallint NOT NULL,
    codigoproducto numeric(12,0) NOT NULL,
    clasemovimiento smallint NOT NULL,
    totalentradas numeric(12,0) NOT NULL DEFAULT 0,
    totalsalidas numeric(12,0) NOT NULL DEFAULT 0
)

TABLESPACE pg_default;
ALTER TABLE "schComercial"."reporteMovimiento" OWNER to postgres;
COMMENT ON TABLE "schComercial"."reporteMovimiento" IS 'Reporte general de movimiento de productos';

