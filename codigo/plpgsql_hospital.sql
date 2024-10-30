
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


-- Bloque para repatir los datos de equipomedico_mal a dos tablas: equipocmedicos y celadores


do $$
declare
	numeroCelador integer:=1;
	equipo equipomedico_mal%rowtype;
	enfermera1 integer; -- almacena el codigo de la enfermera1
	enfermera2 integer; -- almacena el codigo de la enfermera2
	
begin
	-- Recuperar el codigo de personal de las enfermeras:
	select codigo into enfermera1 from personal where nombre = 'Angélica';
	select codigo into enfermera2 from personal where nombre = 'Sofía';

	raise notice 'Enfermera1: %, Enfermera2: %', enfermera1, enfermera2;

	for equipo in (select * from equipomedico_mal) loop
		raise notice 'procesando eq. medico -> id: %, idmedico: %', equipo.id, equipo.idmedico;

		-- Insertar un registro en la tabla de eq. médicos. 
		insert into equipomedico(id, idespecialidad, idmedico, idenfermera1, idenfermera2) 
		values(equipo.id, equipo.idespecialidad, equipo.idmedico, enfermera1, enfermera2);

		if equipo.idcelador1 is not null then
			-- Si tenemos el celador1 lo copiamos a la tabla de celadores
			insert into celadores(id, idcelador, idequipomedico) 
			values(numeroCelador, equipo.idcelador1, equipo.idespecialidad); 
			numeroCelador := numeroCelador + 1;
		end if;

		if equipo.idcelador2 is not null then
			-- Si tenemos el celador2 lo copiamos a la tabla de celadores
			insert into celadores(id, idcelador, idequipomedico) 
			values(numeroCelador, equipo.idcelador2, equipo.idespecialidad); 
			numeroCelador := numeroCelador + 1;
		end if;
		
	end loop;
	commit;

end $$


-- Consultas de comprobación:
select eq.id, eq.idmedico, p.nombre as medico, pr.perfil, e.especialidad, p2.nombre as celador1
from public.equipomedico_mal eq 
inner join public.personal p on p.codigo = eq.idmedico
inner join public.personal p2 on p2.codigo = eq.idcelador1
inner join public.perfiles pr on p.idperfil = pr.id
inner join public.especialidades e on e.id = eq.idespecialidad;




