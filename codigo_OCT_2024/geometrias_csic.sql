

SELECT GeometryType(operation_line), st_astext(towstart_pt), st_astext(towend_pt),  st_astext(operation_line), st_srid(towstart_pt) from operations limit 1;