

ALTER TABLE IF EXISTS public.tb2_envios
    ADD FOREIGN KEY (idoperador)
    REFERENCES public.tb2_operadores (id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


ALTER TABLE IF EXISTS public.tb2_operadores
    ADD FOREIGN KEY (iddelegacion)
    REFERENCES public.tb2_delegaciones (id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
    NOT VALID;


-- Funciones:

-- Obtener los envíos que tienen penalizacion:
select fechaentrega - fecharecepcion as dias_entrega_paq, d.numdias
from tb2_envios e
inner join tb2_operadores o on o.id = e.idoperador
inner join tb2_delegaciones d on o.iddelegacion = d.id
where sign( (fechaentrega - fecharecepcion) - d.numdias) > 0;

select sign(-12), sign(0), sign(8);


select substring('Juan Jose' from 1 for position(' ' in 'Juan Jose')),
substr('Juan Jose', position(' ' in 'Juan Jose')+1);


-- Fecha actual, 12 de mayo de 2025
select current_date, to_char(current_date, 'DD "de" TMMonth "de" YYYY');

select greatest(current_date, current_date-6);
select least(67, 6,-1, 8);













