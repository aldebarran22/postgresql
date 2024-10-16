-- Pruebas con las funciones:

select calcularpedido(10248);
select calcular_iva(calcularpedido(10248),10);

select id, calcularpedido(id) from tbpedidos;

select id, cargo, calcular_iva(cast (cargo as numeric)) from tbpedidos;
