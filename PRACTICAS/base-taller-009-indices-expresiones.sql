
CREATE TABLE productos
(
    codigo   smallint,
    descripcion  varchar(30)
);
CREATE INDEX idxproductos ON productos(descripcion);

INSERT INTO productos VALUES (1, 'Mesa en roble');
INSERT INTO productos VALUES (2, 'Escritorio computador');
INSERT INTO productos VALUES (3, 'Silla en roble');
INSERT INTO productos VALUES (4, 'Comoda en pino');
INSERT INTO productos VALUES (5, 'Cuna para Bebe');
INSERT INTO productos VALUES (6, 'Set 4 Sillas en pino');
INSERT INTO productos VALUES (7, 'Caja de madera para juguetes');
INSERT INTO productos VALUES (8, 'Estanteia en pino');
INSERT INTO productos VALUES (9, 'Cabecera de cama');
INSERT INTO productos VALUES (10, 'Cama sencilla Juvenil');

