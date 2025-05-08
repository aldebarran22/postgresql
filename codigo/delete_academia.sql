
-- Consultas de acción en academia

-- Borrar las clases de la asignatura de word:
delete from ac_clases2 c using ac_asignaturas a
where c.codasig = a.codasig and a.nombreasig = 'word';
