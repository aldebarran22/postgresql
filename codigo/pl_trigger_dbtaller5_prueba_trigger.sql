-- Insertar clientes y realizar transferencias para comprobar el funcionamiento de los triggers

do $$
declare

begin
	-- Insertar nuevos clientes con el procedure crearCliente:
	--call "schFinanciero"."crearCliente"(60, 'Eva');
	--call "schFinanciero"."crearCliente"(70, 'Miguel');	
	
	call "schFinanciero".transferir(20, 60, 3000);
	call "schFinanciero".transferir(20, 70, 3000);

end $$

-- Listar los triggres:
SELECT event_object_table AS table_name, trigger_name
FROM information_schema.triggers
GROUP BY table_name, trigger_name
ORDER BY table_name, trigger_name;