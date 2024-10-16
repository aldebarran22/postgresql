DROP PROCEDURE "schComercial"."calcularReporte";

CREATE OR REPLACE PROCEDURE "schComercial"."calcularReporte"()
LANGUAGE 'plpgsql'
AS $$
DECLARE
    varsql text;
    datos record;
    vanio integer;
	vmes integer;
BEGIN
   UPDATE "schComercial".productos SET existencias = 0, fechasaldo = null;

   varsql := 'SELECT a.fechamovimiento, b.tipomovimiento, b.descripcion, 
       a.codigoproducto, a.clasemovimiento, a.cantidad FROM "schComercial"."movimientos" a,
       "schComercial"."claseMovimiento" b WHERE a.clasemovimiento = b.clasemovimiento';
   FOR datos IN EXECUTE varsql
   LOOP
      vanio := EXTRACT(YEAR from datos.fechamovimiento);
      vmes := EXTRACT(MONTH from datos.fechamovimiento);

      IF datos.tipomovimiento = 'E' THEN	  
         UPDATE "schComercial"."reporteMovimiento"
	    SET totalentradas = totalentradas + datos.cantidad
          WHERE anio = vanio AND mes = vmes
	        AND codigoproducto = datos.codigoproducto
		AND clasemovimiento = datos.clasemovimiento;
	 IF NOT FOUND THEN
	    INSERT INTO "schComercial"."reporteMovimiento"
	    VALUES (vanio, vmes, datos.codigoproducto, datos.clasemovimiento, datos.cantidad, 0) ;
         END IF;
         UPDATE "schComercial".productos 
	    SET existencias = existencias + datos.cantidad,
                fechasaldo = now()
          WHERE codigoproducto = datos.codigoproducto;
      END IF;
      IF datos.tipomovimiento = 'S' THEN	  
         UPDATE "schComercial"."reporteMovimiento"
	    SET totalsalidas = totalsalidas + datos.cantidad
          WHERE anio = vanio AND mes = vmes
	        AND codigoproducto = datos.codigoproducto
		AND clasemovimiento = datos.clasemovimiento;
	 IF NOT FOUND THEN
	    INSERT INTO "schComercial"."reporteMovimiento"
	    VALUES (vanio, vmes, datos.codigoproducto, datos.clasemovimiento, 0, datos.cantidad) ;
         END IF;
         UPDATE "schComercial".productos 
	    SET existencias = existencias - datos.cantidad,
                fechasaldo = now()
          WHERE codigoproducto = datos.codigoproducto;
      END IF;

    END LOOP;
END
$$;

CALL "schComercial"."calcularReporte"()


