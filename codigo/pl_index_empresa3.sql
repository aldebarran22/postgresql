-- Cear indices para la tabla de pedidos y reindexar:

create index idxpaises on tbpedidos(paisdestinatario);
create index idxfechas on tbpedidos(fechapedido, fechaentrega, fechaenvio);

reindex index idxpaises;
reindex table tbpedidos;

explain
select * from tbpedidos where fechapedido = '1997-01-12';