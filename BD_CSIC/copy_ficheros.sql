-- POR ULTIMO, LAS SENTENCIAS \copy POR SI TE QUIERES AHORRAR TIEMPO

--grant select on survey to public;
copy survey from 'C:\Users\ANGELA\Desktop\postgresql\repositorio\BD CSIC\survey.csv' with delimiter ';' csv header
--copy operations (survey,platform_code,operation_code,towstart_lat,towstart_lon,towstart_depth,towstart_tmp,towend_lat,towend_lon,towend_depth,towend_tmp,valid) from 'C:\Users\ANGELA\Desktop\postgresql\repositorio\BD CSIC\operations.csv' with delimiter ';' csv header
--copy species from 'C:\Users\ANGELA\Desktop\postgresql\repositorio\BD CSIC\species.csv' with delimiter ';' csv header
--copy biologicos from 'C:\Users\ANGELA\Desktop\postgresql\repositorio\BD CSIC\biologicos.csv' with delimiter ';' csv header
--copy fauna from 'C:\Users\ANGELA\Desktop\postgresql\repositorio\BD CSIC\fauna.csv' with delimiter ';' csv header
--copy tallas from 'C:\Users\ANGELA\Desktop\postgresql\repositorio\BD CSIC\tallas.csv' with delimiter ';' csv header
