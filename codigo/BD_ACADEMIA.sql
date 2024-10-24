-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.clientes
(
    dni character varying(12) NOT NULL,
    nombre character varying(40),
    apellidos character varying(80),
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS public.libros
(
    codigo serial NOT NULL,
    "cod-editorial" integer,
    titulo character varying(50),
    precio numeric,
    PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS public.editoriales
(
    codigo serial NOT NULL,
    nombre character varying(40),
    PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS public.autores
(
    dni character varying(12) NOT NULL,
    nombre character varying(40),
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS public."clientes-libros"
(
    codigo serial NOT NULL,
    dni_cliente character varying(12),
    cod_libro integer,
    fecha_venta date,
    precio_venta numeric,
    cantidad integer,
    PRIMARY KEY (codigo)
);

COMMENT ON TABLE public."clientes-libros"
    IS 'Representan las ventas de los libros a los clientes';

CREATE TABLE IF NOT EXISTS public."autores-libros"
(
    codigo serial NOT NULL,
    dni_autor character varying(12),
    cod_libro integer,
    PRIMARY KEY (codigo)
);

COMMENT ON TABLE public."autores-libros"
    IS 'Los autores que participan en un libro';

ALTER TABLE IF EXISTS public.libros
    ADD CONSTRAINT "fk-editorial" FOREIGN KEY ("cod-editorial")
    REFERENCES public.editoriales (codigo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."clientes-libros"
    ADD CONSTRAINT "fk-clientes" FOREIGN KEY (dni_cliente)
    REFERENCES public.clientes (dni) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."clientes-libros"
    ADD CONSTRAINT "fk-libros" FOREIGN KEY (cod_libro)
    REFERENCES public.libros (codigo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."autores-libros"
    ADD CONSTRAINT "fk-autores" FOREIGN KEY (dni_autor)
    REFERENCES public.autores (dni) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."autores-libros"
    ADD CONSTRAINT "fk-libros" FOREIGN KEY (cod_libro)
    REFERENCES public.libros (codigo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;