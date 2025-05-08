
-- Proceso para crear una nueva tabla en la BD Academia de la clases con las columnas con el tipo integer
-- y se añade las 3 claves foráneas.


-- Borra la tabla si ya existe:
drop table if exists ac_clases2;


-- Crear una tabla con una consulta:
create table ac_clases2 as (
	select cast(codalumn as integer) as codalumn, 
	cast(codprofe as integer) as codprofe, 
	cast(codasig as integer) as codasig,
	cast(aula as integer) as aula
	from ac_clases
);

-- NOT VALID: Crea la foreign key pero NO se verifica inmediatamente;
ALTER TABLE IF EXISTS public.ac_clases2
    ADD CONSTRAINT "fk-alumnos" FOREIGN KEY (codalumn)
    REFERENCES public.ac_alumnos (codalumn) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

ALTER TABLE IF EXISTS public.ac_clases2
    ADD CONSTRAINT "fk-asignaturas" FOREIGN KEY (codasig)
    REFERENCES public.ac_asignaturas (codasig) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

ALTER TABLE IF EXISTS public.ac_clases2
    ADD CONSTRAINT "fk-profesores" FOREIGN KEY (codprofe)
    REFERENCES public.ac_profesores (codprofe) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;

