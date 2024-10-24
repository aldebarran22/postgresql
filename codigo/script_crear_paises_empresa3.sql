
/* Normalizar el pais de la tabla de pedidos */

-- Borra la tabla de pedidos2:
drop table if exists tbpedidos2;

-- Borra la tabla de paises:
drop table if exists tbpaises;

-- Obtener una copia de la tabla de pedidos:
create table tbpedidos2 as select * from tbpedidos;

-- Creacion de la tabla de paises:
create table tbpaises (
	id serial primary key,
	pais varchar(20)
);

-- En la nueva tabla, arreglar el nombre del país España:
update tbpedidos2 set paisdestinatario = 'España' where paisdestinatario = 'EspaÃ±a';

-- Copiar los paises de la tabla de pedidos a la tabla de paises (sin repetidos):
insert into tbpaises(pais) select distinct paisdestinatario from tbpedidos2 order by 1;

-- Añadir una columna nueva a la tabla de paises: idpais
alter table tbpedidos2 add column idpais integer;

-- Rellenar la columna idpais en tbpedidos2, utilizando la tabla de países:
update tbpedidos2 pe
set idpais = pa.id
from tbpaises pa
where pa.pais = pe.paisdestinatario;

-- Hacer una comprobación de los resultados:
-- Contar los registros que no coincida el pais:
select count(*) as errores 
from tbpedidos2 pe 
inner join tbpaises p on p.id = pe.idpais
where p.pais != pe.paisdestinatario;

-- Borrar la columna de paisdestinatario en tbpedidos2
alter table tbpedidos2 drop column paisdestinatario;


-- Añadir la clave primaria en tbpedidos2;
ALTER TABLE IF EXISTS public.tbpedidos2
add primary key (id);


-- Añadir la claves foraneas en la tabla de tbpedidos2;
ALTER TABLE IF EXISTS public.tbpedidos2
    ADD CONSTRAINT "fk-compañias" FOREIGN KEY (idcompanya)
    REFERENCES public.tbcompaniaenvios (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tbpedidos2
    ADD CONSTRAINT "fk-clientes" FOREIGN KEY (idcliente)
    REFERENCES public.tbclientes (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tbpedidos2
    ADD CONSTRAINT "fk-empleado" FOREIGN KEY (idempleado)
    REFERENCES public.tbempleados (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tbpedidos2
    ADD CONSTRAINT "fk-pais" FOREIGN KEY (idpais)
    REFERENCES public.tbpaises (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

-- Borrar la tabla de pedidos original:
drop table if exists tbpedidos;


-- Renombrar la tabla de pedidos2 a pedidos:
alter table tbpedidos2 rename to tbpedidos;


--CREATE TABLE tbproductos2 (LIKE tbproductos INCLUDING DEFAULTS INCLUDING CONSTRAINTS INCLUDING INDEXES);