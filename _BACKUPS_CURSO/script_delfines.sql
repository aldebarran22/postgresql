
CREATE TABLE Regiones (
	id 		SERIAL PRIMARY KEY,
	name 	        VARCHAR(20) NOT NULL,
	area		GEOMETRY NOT NULL,
	settled_family  VARCHAR(20)
);

CREATE TABLE Delfines (
	id 		SERIAL PRIMARY KEY,
	family_name	VARCHAR(20) NOT NULL,
	last_position	GEOMETRY NOT NULL,
	movement 	GEOMETRY NOT NULL 
);


INSERT INTO Regiones (name, area, settled_family) VALUES 
('Alpha',  'POLYGON((2 17, 7 22, 13 22, 13 15, 7 15, 2 17))', 'Javadelphis'), 
('Bravo',  'POLYGON((13 22, 22 22, 22 15, 13 15, 13 22))', null),
('Charlie',  'POLYGON((2 10, 2 17, 7 15, 13 15, 11 10, 2 10))', 'Lagenonaut'),
('Delta',  'POLYGON((11 10, 13 15, 22 15, 23 10, 19 4, 11 10))', null),
('Echo',  'POLYGON((2 10, 11 10, 7 1, 3 1, 2 10))', null),
('Foxtrot',  'POLYGON((11 10, 19 4, 17 1, 7 1, 11 10))', 'Delphinuspring');


INSERT INTO Delfines (family_name, last_position, movement) VALUES 
('Javadelphis', 'POINT(7 18)', 'LINESTRING(6 18, 7 18)'),
('Javadelphis', 'POINT(11 20)', 'LINESTRING(12 18, 16 18, 16 20, 11 20)'),
('Javadelphis', 'POINT(10 17)', 'LINESTRING(10 17, 9 18, 11 18, 10 17)'),
('Javadelphis', 'POINT(14 19)', 'LINESTRING(9 17, 10 13, 16 13, 20 17, 20 21, 14 19)'),
('Javadelphis', 'POINT(25 25)', 'LINESTRING(8 18, 10 20, 10 24, 17 21, 25 25)'),
('Lagenonaut', 'POINT(7 12)', 'LINESTRING(4 15, 7 12)'),
('Lagenonaut', 'POINT(8 13)', 'LINESTRING(12 14, 10 12, 9 12, 8 13)'),
('Lagenonaut', 'POINT(11 14)', 'LINESTRING(9 14, 9 16, 11 16, 11 14)'),
('Lagenonaut', 'POINT(22 12)', 'LINESTRING(9 11, 15 10, 22 12)'),
('Delphinuspring', 'POINT(12 5)', 'LINESTRING(12 3, 13 4, 12 5)'),
('Delphinuspring', 'POINT(14 5)', 'LINESTRING(16 2, 14 3, 14 5)'),
('Delphinuspring', 'POINT(5 12)', 'LINESTRING(10 3, 10 4, 5 11, 5 12)');
