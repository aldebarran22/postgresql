-- Cargar una tabla con valores aleatorios y tx cada n inserciones:
do $$

declare
	yy integer;
	mm integer;
	dd integer;
	tope integer;
	n integer;
	sfecha varchar(20);
	fecha date;
	valor float;
	sql text;
begin
	--  Grabar 1000 reg. y cada 100 insertar un commit:
	delete from movimientos;
	for i in 0..10000 loop
		yy = 2000+floor((random()*10));
		mm = 1+floor((random()*12));
		if mm = 2 then
			dd = 1+floor((random()*27));
		else 
			dd = 1+floor((random()*30));
		end if;
		sfecha = to_char(yy, '9999')||'-'||to_char(mm,'09')||'-'||to_char(dd,'09');
		sfecha = replace(sfecha,' ','');
		fecha = to_date(sfecha, 'yyyy-mm-dd');
		valor = random() * 1000;
		sql = 'insert into movimientos(fecha, cantidad) values('''||sfecha||''','||valor||');';
		execute sql;
		if i > 0 and i % 1000 = 0 then
			raise info '% filas - commit', i;
			commit;
		end if;
	end loop;
	
--exception when others then
--	raise info 'error';
--	rollback;
end $$