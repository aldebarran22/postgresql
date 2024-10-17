--BASE DE DATOS DE EJEMPLO PARA CURSO

CREATE EXTENSION POSTGIS;

-- TABLA DE CAMPAÑAS

DROP TABLE IF EXISTS survey;
CREATE TABLE survey (
    survey VARCHAR(10) PRIMARY KEY,
    date_start DATE,
    date_end DATE
);

-- TABLA DE LANCES (OPERACIONES)
DROP TABLE IF EXISTS operations;
CREATE TABLE operations (
    survey VARCHAR(10),
    platform_code varchar(6),
    operation_code INTEGER,
    towstart_lat NUMERIC(12, 8),
    towstart_lon NUMERIC(12, 8),
    towstart_depth NUMERIC(5, 2),
    towstart_tmp TIMESTAMP WITH TIME ZONE,
    towend_lat NUMERIC(12, 8),
    towend_lon NUMERIC(12, 8),
    towend_depth NUMERIC(5, 2),
    towend_tmp TIMESTAMP WITH TIME ZONE,
    valid CHAR(1),
    PRIMARY KEY (survey, platform_code, operation_code),
    FOREIGN KEY (survey) REFERENCES survey(survey)
);


-- Para habilitarla espacialmente tenemos que añadir la columna espacial y luego el trigger que te he puesto más abajo
-- Doy por hecho que ya se hemos CREATE EXTENSION POSTGIS, claro.

SELECT AddGeometryColumn('operations', 'towstart_pt', 4326, 'POINT', 2);
SELECT AddGeometryColumn('operations', 'towend_pt', 4326, 'POINT', 2);
SELECT AddGeometryColumn('operations', 'operation_line', 4326, 'LINESTRING', 2);


--  2.3 TRIGGER FOR CREATION OF POSTGIS OBJETS (LINES AND POINTS)
--      FROM HAUL LANDMARKS.
--      ADITIONALLY, IT CREATES A LINE FROM HAUL END/START POINTS
--      SIX LANDMARKS ARE STORED in OPERATIONS TABLE:
--      Haul operations start: (netshoot_lat, netshoot_lon) -> netshoot_pt
--      Otter boards in water: (ottdown_lat,ottdown_lon) -> ottdown_pt
--      Tow starts: (towstart_lat,towstart_lon) ->towstart_pt
--      Tow ends: (towend_lat,towend_lon) -> towend_pt
--      Otter boards onboard: (ottup_lat,ottup_lon) -> ottup_pt
--      Haul operations end: (netonboard_lat,netonboard_lon) -> netonboard_pt
--      With towstart_pt and towend_pt tow_line is created.
--      SRC is WGS84 (EPSG 4326)
--      In case the coordinates are null it doesn't create any point

-- El trigger a continuación lo he simplificado y solo tiene los campos que te he metido en operations.
-- Primero la función:

DROP FUNCTION IF EXISTS operation_position() CASCADE;
CREATE FUNCTION operation_position() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
    BEGIN
        IF (NEW.towstart_lon is not null) AND (NEW.towstart_lat is not null) THEN 
            NEW.towstart_pt:=ST_SetSRID(ST_MakePoint(NEW.towstart_lon,NEW.towstart_lat),4326);
        END IF;

        IF (NEW.towend_lon is not null) AND (NEW.towend_lat is not null) THEN 
            NEW.towend_pt:=ST_SetSRID(ST_MakePoint(NEW.towend_lon,NEW.towend_lat),4326);
        END IF;
     IF (NEW.towstart_pt is not null) AND (NEW.towend_pt is not null) THEN
            NEW.operation_line:=ST_Makeline(NEW.towstart_pt,NEW.towend_pt);
        END IF;
            RETURN NEW;
    END;
$$;

-- Y ahora el trigger en sí

CREATE TRIGGER operation_position
    BEFORE INSERT OR UPDATE 
    ON operations
    FOR EACH ROW
    EXECUTE PROCEDURE operation_position();


-- TABLA DE ESPECIES
DROP TABLE IF EXISTS species;
CREATE TABLE species (
    species_code varchar(5) PRIMARY KEY,
    scientific_name VARCHAR(100),
    common_name VARCHAR(100)
);

-- TABLA DE BIOLOGICOS
DROP TABLE IF EXISTS biologicos;
CREATE TABLE biologicos (
    survey VARCHAR(10),
    platform_code varchar(6),
    operation_code INTEGER,
    species_code varchar(5),
    category_code INTEGER,
    sample_id INTEGER,
    sampling_type INTEGER,
    outlier boolean,
    observations TEXT,
    talla INTEGER,
    pesotot NUMERIC(10, 2),
    peviscerado NUMERIC(10, 2),
    sexo INTEGER,
    madurez INTEGER,
    observaciones TEXT,
    PRIMARY KEY (survey, platform_code, operation_code, species_code, category_code, sample_id, sampling_type),
    FOREIGN KEY (survey, platform_code, operation_code) REFERENCES operations(survey, platform_code, operation_code),
    FOREIGN KEY (species_code) REFERENCES species(species_code)
);

-- TABLA DE FAUNÍSTICA
DROP TABLE IF EXISTS fauna;
CREATE TABLE fauna (
    survey VARCHAR(10),
    platform_code varchar(6),
    operation_code INTEGER,
    species_code varchar(5),
    category_code INTEGER,
    weight NUMERIC(10, 3),
    PRIMARY KEY (survey, platform_code, operation_code, species_code, category_code),
    FOREIGN KEY (survey, platform_code, operation_code) REFERENCES operations(survey, platform_code, operation_code),
    FOREIGN KEY (species_code) REFERENCES species(species_code)
);

-- TABLA DE TALLAS
DROP TABLE IF EXISTS tallas;
CREATE TABLE tallas (
    survey VARCHAR(10),
    platform_code varchar(6),
    operation_code INTEGER,
    species_code varchar(5),
    category_code integer,
    length_class NUMERIC(4, 1),
    num INTEGER,
    sample_weight NUMERIC(10, 3),
    length_units VARCHAR(10),
    PRIMARY KEY (survey, platform_code, operation_code, species_code, category_code, length_class),
    FOREIGN KEY (survey, platform_code, operation_code) REFERENCES operations(survey, platform_code, operation_code),
    FOREIGN KEY (species_code) REFERENCES species(species_code) 
);

-- Aquí te dejo unas funciones que uso yo para calcular clase de talla a partir de una talla en mm, un json...
-- Lo mismo te sirven de inspiración para ejercicio, etc.

--  2.2 FUNCTIONS FOR CALCULATING LENGTH CLASS FROM LENGTH. 
--      VERSIONS FOR JSON, NUMERIC AND VARCHAR ARE PROVIDED
--      Second parameter of the function call stands for output
--      length class in centimeters ('c') or half centimeters ('m')

DROP FUNCTION IF EXISTS length_class(jsonb, character varying);
CREATE FUNCTION length_class(jsonb, character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
    DECLARE
        lngth int;
        integer_lngth int;
        remain_lngth int;
        peak_lngth numeric;
        length_class numeric;
    BEGIN
        lngth:=cast(cast($1 as text) as integer);
        integer_lngth:=trunc(lngth/10);
        remain_lngth:=lngth%10;
        IF $2='c' THEN
            RETURN integer_lngth+0.0;
        ELSIF $2='m' THEN
            IF remain_lngth>=5 then peak_lngth:=0.5;
                return integer_lngth+peak_lngth;
            ELSE peak_lngth:=0.0;
                return integer_lngth+peak_lngth;
            END IF;
        END IF;
    END;
$_$;

DROP FUNCTION IF EXISTS length_class(numeric, character varying);
CREATE FUNCTION length_class(numeric, character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
    DECLARE
        integer_lngth int;
        remain_lngth int;
        peak_lngth numeric;
        length_class numeric;
    BEGIN
        integer_lngth:=trunc($1/10);
        remain_lngth:=$1%10;
        IF $2='c' THEN
            RETURN integer_lngth+0.0;
        ELSIF $2='m' THEN
            IF remain_lngth>=5 then peak_lngth:=0.5;
                return integer_lngth+peak_lngth;
            ELSE peak_lngth:=0.0;
                return integer_lngth+peak_lngth;
            END IF;
        END IF;
    END;
$_$;

DROP FUNCTION IF EXISTS length_class(text, character varying);
CREATE FUNCTION length_class(text, character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
DECLARE
    lngth int;
    integer_lngth int;
    remain_lngth int;
    peak_lngth numeric;
    length_class numeric;
BEGIN
    lngth:=cast($1 as integer);
    integer_lngth:=trunc(lngth/10);
    remain_lngth:=lngth%10;
    IF $2='c' THEN
        RETURN integer_lngth+0.0;
    ELSIF $2='m' THEN
        IF remain_lngth>=5 then peak_lngth:=0.5;
            return integer_lngth+peak_lngth;
        ELSE peak_lngth:=0.0;
            return integer_lngth+peak_lngth;
        END IF;
    END IF;
END;
$_$;

-- POR ULTIMO, LAS SENTENCIAS \copy POR SI TE QUIERES AHORRRAR TIEMPO
\copy survey from 'survey.csv' with delimiter ';' csv header
\copy operations (survey,platform_code,operation_code,towstart_lat,towstart_lon,towstart_depth,towstart_tmp,towend_lat,towend_lon,towend_depth,towend_tmp,valid) from 'operations.csv' with delimiter ';' csv header
\copy species from 'species.csv' with delimiter ';' csv header
\copy biologicos from 'biologicos.csv' with delimiter ';' csv header
\copy fauna from 'fauna.csv' with delimiter ';' csv header
\copy tallas from 'tallas.csv' with delimiter ';' csv header
