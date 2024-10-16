--create schema "schComercial";

CREATE TABLE "schComercial".productos
(
    codigoproducto numeric(12,0) NOT NULL,
    descripcion character varying(30) COLLATE pg_catalog."default" NOT NULL,
    activo boolean NOT NULL DEFAULT true,
    existencias numeric NOT NULL DEFAULT 0,
    fechasaldo date,
    CONSTRAINT productos_pkey PRIMARY KEY (codigoproducto)
)
TABLESPACE pg_default;
ALTER TABLE "schComercial".productos OWNER to postgres;
COMMENT ON TABLE "schComercial".productos IS 'Información de los productos de la empresa';	

INSERT INTO "schComercial".productos VALUES (778045, 'Portatil Asus A15', TRUE, 0, '2021-05-01');
INSERT INTO "schComercial".productos VALUES (778085, 'Portatil Asus X512da', TRUE, 0, '2021-05-01');
INSERT INTO "schComercial".productos VALUES (778125, 'Portatil Asus X409ja', TRUE, 0, '2021-05-01');
INSERT INTO "schComercial".productos VALUES (778155, 'Portail Gaming ASUS Fa506ii', TRUE, 0, '2021-05-01');
INSERT INTO "schComercial".productos VALUES (778205, 'Portatil Asus X509', FALSE, 0, '2021-05-01');



CREATE TABLE "schComercial"."claseMovimiento"
(
    clasemovimiento smallint NOT NULL,
    tipomovimiento character(1) NOT NULL,
    descripcion varchar(30) NOT NULL,
    CONSTRAINT clasemovimiento_pkey PRIMARY KEY (clasemovimiento)
)

TABLESPACE pg_default;
ALTER TABLE "schComercial"."claseMovimiento" OWNER to postgres;
COMMENT ON TABLE "schComercial"."claseMovimiento" IS 'Clases de movimientos';

INSERT INTO "schComercial"."claseMovimiento" VALUES (101, 'E', 'Compra a proveedores');
INSERT INTO "schComercial"."claseMovimiento" VALUES (103, 'E', 'Devoluciones de Mercancia');
INSERT INTO "schComercial"."claseMovimiento" VALUES (201, 'S', 'Ventas a Clientes');
INSERT INTO "schComercial"."claseMovimiento" VALUES (203, 'S', 'Mercancia dañada');



CREATE TABLE "schComercial".movimientos
(
    consecutivo serial NOT NULL ,
    fechamovimiento date NOT NULL DEFAULT now(),
    clasemovimiento smallint NOT NULL,
    tipomovimiento character(1) NOT NULL,
    codigoproducto numeric(12,0) NOT NULL,
    cantidad smallint NOT NULL DEFAULT 0,
    CONSTRAINT movimientos_pkey PRIMARY KEY (consecutivo),
    CONSTRAINT productos1_fkey FOREIGN KEY (codigoproducto) REFERENCES "schComercial".productos (codigoproducto),
    CONSTRAINT clase1mov_fkey FOREIGN KEY (clasemovimiento) REFERENCES "schComercial"."claseMovimiento" (clasemovimiento)
)
TABLESPACE pg_default;
ALTER TABLE "schComercial".movimientos OWNER to postgres;
COMMENT ON TABLE "schComercial".movimientos IS 'Movimientos de entrada y salida de productos';

CREATE INDEX idx1movimientos ON "schComercial".movimientos USING btree
    (fechamovimiento ASC NULLS LAST) TABLESPACE pg_default;

CREATE INDEX idx2movimientos ON "schComercial".movimientos USING btree
    (tipomovimiento COLLATE pg_catalog."default" ASC NULLS LAST) TABLESPACE pg_default;

DELETE FROM "schComercial".movimientos;
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-02', 101, 'E', 778045, 100);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-02', 101, 'E', 778085, 100);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-02', 101, 'E', 778125, 100);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-02', 101, 'E', 778155, 100);

INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-04', 201, 'S', 778045, 13);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-06', 201, 'S', 778085, 25);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-05', 201, 'S', 778125, 5);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-03', 201, 'S', 778155, 17);

INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-09', 201, 'S', 778045, 19);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-10', 201, 'S', 778085, 12);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-13', 201, 'S', 778125, 9);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-15', 201, 'S', 778155, 21);

INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-07', 201, 'S', 778045, 12);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-15', 201, 'S', 778085, 17);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-21', 201, 'S', 778125, 19);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-18', 201, 'S', 778155, 13);

INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-02', 201, 'S', 778045, 18);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-05', 201, 'S', 778085, 14);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-13', 201, 'S', 778125, 9);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-06', 201, 'S', 778155, 10);

INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-15', 101, 'E', 778045, 25);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-15', 101, 'E', 778085, 25);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-15', 101, 'E', 778125, 25);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-15', 101, 'E', 778155, 25);


INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-18', 103, 'E', 778045, 2);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-23', 103, 'E', 778085, 1);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-21', 103, 'E', 778125, 3);
INSERT INTO "schComercial".movimientos (fechamovimiento, clasemovimiento, tipomovimiento, codigoproducto, cantidad) VALUES ('2021-05-16', 103, 'E', 778155, 5);



CREATE TABLE "schComercial"."reporteMovimiento"
(
    anio  smallint NOT NULL,
    mes   smallint NOT NULL,
    codigoproducto numeric(12,0) NOT NULL,
    clasemovimiento smallint NOT NULL,
    totalentradas numeric(12,0) NOT NULL DEFAULT 0,
    totalsalidas numeric(12,0) NOT NULL DEFAULT 0,
    CONSTRAINT reportemov_pkey PRIMARY KEY (anio, mes, codigoproducto, clasemovimiento),
    CONSTRAINT productos1_fkey FOREIGN KEY (codigoproducto) REFERENCES "schComercial".productos (codigoproducto),
    CONSTRAINT clase1_fkey FOREIGN KEY (clasemovimiento) REFERENCES "schComercial"."claseMovimiento" (clasemovimiento)
)

TABLESPACE pg_default;
ALTER TABLE "schComercial"."reporteMovimiento" OWNER to postgres;
COMMENT ON TABLE "schComercial"."reporteMovimiento" IS 'Reporte general de movimiento de productos';

