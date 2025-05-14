

-- Crear triggers para llevar una auditoria de las modificaciones que hacemos en una serie de tablas:

-- Crear la tabla de auditoría
CREATE TABLE paises.auditoria (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    accion TEXT,
	tabla TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create or replace function paises.registrar_cambio() returns trigger as $auditaralemania$
begin
	insert into paises.auditoria(usuario_id, accion, tabla) values(current_user, TG_OP, TG_NAME);
	return new;
end;
$auditaralemania$ language plpgsql;


create or replace trigger auditaralemania
after insert or update or delete on paises.alemania
for each row execute function paises.registrar_cambio();


