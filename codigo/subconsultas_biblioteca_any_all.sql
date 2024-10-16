-- BD Biblioteca:

-- Sacar la editorial de cada libro:
select e.nombre, l.titulo, l.autor from editoriales e
inner join libros l on l.codigoeditorial = e.codigo;

-- Mostrar los títulos de los libros de  "Borges" de editoriales que 
-- también han publicado de "Richard Bach":
select titulo from libros where autor = 'Borges'
and codigoeditorial = any(select e.codigo from editoriales e
inner join libros l 
on l.codigoeditorial = e.codigo where l.autor like '%Bach%');

-- Con all
select titulo from libros where autor = 'Borges'
and codigoeditorial = all(select e.codigo from editoriales e
inner join libros l 
on l.codigoeditorial = e.codigo where l.autor like '%Bach%');

-- Obtener los titulos y los precios de los libros de Borges
-- Si el precio supera alguno de los libros de Batch:
-- some y any es lo mismo:
select l.titulo, l.precio, l.autor from libros l  
where autor = 'Borges' and
 l.precio > some ( select l.precio from libros l
 where l.autor = 'Richard Bach') ;
