-- POR ULTIMO, LAS SENTENCIAS \copy POR SI TE QUIERES AHORRAR TIEMPO

--grant select on survey to public;
copy survey from 'D:\OneDrive\Escritorio\postgreSQL\repositorio\BD_CSIC\survey.csv' with delimiter ';' csv header
copy operations from 'D:\OneDrive\Escritorio\postgreSQL\repositorio\BD_CSIC\operations.csv' with delimiter ';' csv header
copy species from 'D:\OneDrive\Escritorio\postgreSQL\repositorio\BD_CSIC\species.csv' with delimiter ';' csv header
copy biologicos from 'D:\OneDrive\Escritorio\postgreSQL\repositorio\BD_CSIC\biologicos.csv' with delimiter ';' csv header
copy fauna from 'D:\OneDrive\Escritorio\postgreSQL\repositorio\BD_CSIC\fauna.csv' with delimiter ';' csv header
copy tallas from 'D:\OneDrive\Escritorio\postgreSQL\repositorio\BD_CSIC\tallas.csv' with delimiter ';' csv header
