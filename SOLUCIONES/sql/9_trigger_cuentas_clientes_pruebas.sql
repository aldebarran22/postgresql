-- Pruebas para el trigger de la dbtaller5 y de la tabla: cuentasClientes
select * from "schFinanciero"."cuentasClientes";

insert into "schFinanciero"."cuentasClientes" values(40, 'NUEVO CLIENTE',0);
-- A través del trigger se inserta una nueva fila en la tabla de log.


-- Cuando actualizamos el saldo mediante el procedimiento transferir
-- Tiene que saltar el trigger y registrar el movimiento
update "schFinanciero"."cuentasClientes" set saldo=10000;

-- Hacemos otra transferencia para probar el trigger:
call "schFinanciero".transferir(10, 30, 2000);

-- listar triggers
SELECT  event_object_table AS table_name ,trigger_name         
FROM information_schema.triggers  
GROUP BY table_name , trigger_name 
ORDER BY table_name ,trigger_name 