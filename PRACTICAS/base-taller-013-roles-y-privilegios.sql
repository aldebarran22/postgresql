
CREATE TABLE clientes
(
    nombre  varchar(20),
    apellido  varchar(20),
    edad smallint,
    telefono varchar(15)
);

INSERT INTO clientes(nombre, apellido, edad, telefono)
VALUES
('Alejandro','Guzman', 47, '+573046239396'),
('Juan','Castro', 35, '+543078239328'),
('Christian','Alvarez', 28, '+562046247396'),
('Dennisse','Peterson', 35, '+582046237845'),
('Carolina','Roberts', 42, '+522006235699'),
('George','Wood', 39, '+543086469766'),
('Harvey','Strickland', 55, '+543017233466'),
('Andrea','Rivera', 43, '+573086234391');

CREATE ROLE consulta LOGIN PASSWORD 'consulta123';

GRANT ALL ON clientes TO consulta;

CREATE ROLE daniel LOGIN PASSWORD 'daniel123' IN ROLE consulta;
