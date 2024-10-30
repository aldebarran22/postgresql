
do $$
declare
   nombres  TEXT ARRAY  DEFAULT  ARRAY['María', 'Andrés','Paula','Gema','Andrea','Miguel'];
   perfil integer:=2;
   codigo integer:=200;
begin

-- Carga de personal: perfil 3 es médico, perfil 2 es celador
--insert into personal(codigo, idperfil, nombre, direccion, plaza, cv)

	for i in 1..6 loop
		raise notice 'nombre: %', nombres[i];

		insert into personal values (codigo, perfil, nombres[i], '',0,'');

		if i > 3 then
			perfil := 3;
		end if;

		codigo := codigo + 1;
		
	end loop;
	commit; -- confirmar datos

end $$



insert into especialidades values(1,'trauma',204);
insert into especialidades values(2,'digestivo',205);

insert into equipomedico_mal(idmedico, idcelador1, idcelador2, idespecialidad) values(204, 200, 201, 1);
insert into equipomedico_mal(idmedico, idcelador1, idcelador2, idespecialidad) values(205, 202, 203, 2);
insert into equipomedico_mal(idmedico, idcelador1, idcelador2, idespecialidad) values(12202, 201, null, 2);

insert into personal values ('500', 4, 'Angélica', '',0,'');
insert into personal values ('504', 4, 'Sofía', '',0,'');





