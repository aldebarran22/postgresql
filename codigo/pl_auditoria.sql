
create extension dblink;

CREATE TABLE IF NOT EXISTS public.tabla_auditoria
(
    id_auditoria serial,
    nombre_tabla character varying(45) COLLATE pg_catalog."default" NOT NULL,
    operacion character varying(20) COLLATE pg_catalog."default" NOT NULL,
    valor_viejo text COLLATE pg_catalog."default",
    valor_nuevo text COLLATE pg_catalog."default",
    fecha_actual timestamp with time zone NOT NULL,
    usuario character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tbauditoria_pkey PRIMARY KEY (id_auditoria)
);

