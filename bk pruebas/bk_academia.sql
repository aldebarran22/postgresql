--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-05 19:20:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16701)
-- Name: ac_alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ac_alumnos (
    codalumn integer NOT NULL,
    nombre character varying(30),
    telefono character varying(20),
    direccion character varying(50),
    nacimiento character varying(20),
    edad integer,
    matricula character varying(5),
    movil character varying(10),
    email character varying(50)
);


ALTER TABLE public.ac_alumnos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16706)
-- Name: ac_asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ac_asignaturas (
    codasig integer NOT NULL,
    nombreasig character varying(40),
    precio integer
);


ALTER TABLE public.ac_asignaturas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16711)
-- Name: ac_clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ac_clases (
    codalumn character varying(20) NOT NULL,
    codprofe character varying(20) NOT NULL,
    codasig character varying(20) NOT NULL,
    aula character varying(20)
);


ALTER TABLE public.ac_clases OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16716)
-- Name: ac_profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ac_profesores (
    codprofe integer NOT NULL,
    nombre character varying(40),
    direccion character varying(40),
    dni character varying(20),
    telefono character varying(20),
    fecha date,
    puestofijo boolean,
    sueldo integer
);


ALTER TABLE public.ac_profesores OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16846)
-- Name: tabla1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabla1 (
    id integer NOT NULL,
    texto character varying(20)
);


ALTER TABLE public.tabla1 OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16845)
-- Name: tabla1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tabla1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tabla1_id_seq OWNER TO postgres;

--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 219
-- Name: tabla1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tabla1_id_seq OWNED BY public.tabla1.id;


--
-- TOC entry 4650 (class 2604 OID 16849)
-- Name: tabla1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla1 ALTER COLUMN id SET DEFAULT nextval('public.tabla1_id_seq'::regclass);


--
-- TOC entry 4804 (class 0 OID 16701)
-- Dependencies: 215
-- Data for Name: ac_alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ac_alumnos VALUES (7, 'Belen', '914558877', 'parque norte 66', 'sevilla', 25, 'm7', NULL, NULL);
INSERT INTO public.ac_alumnos VALUES (4, 'Ramon', '912587788', 'boltaña 88', 'caceres', 22, 'm4', '600858274', NULL);
INSERT INTO public.ac_alumnos VALUES (14, 'Ana Maria', NULL, 'jacinto 33', 'bilbao', 32, 'm14', NULL, 'web@gmail.com
');


--
-- TOC entry 4805 (class 0 OID 16706)
-- Dependencies: 216
-- Data for Name: ac_asignaturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ac_asignaturas VALUES (1, 'excel', 22);
INSERT INTO public.ac_asignaturas VALUES (2, 'access', 22);
INSERT INTO public.ac_asignaturas VALUES (3, 'sql-server', 35);
INSERT INTO public.ac_asignaturas VALUES (4, 'visual basic', 45);
INSERT INTO public.ac_asignaturas VALUES (5, 'oracle', 40);
INSERT INTO public.ac_asignaturas VALUES (7, 'word', 22);
INSERT INTO public.ac_asignaturas VALUES (8, 'powerpoint', 22);


--
-- TOC entry 4806 (class 0 OID 16711)
-- Dependencies: 217
-- Data for Name: ac_clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ac_clases VALUES ('1', '1', '1', '1');
INSERT INTO public.ac_clases VALUES ('2', '1', '1', '1');
INSERT INTO public.ac_clases VALUES ('3', '1', '1', '1');
INSERT INTO public.ac_clases VALUES ('4', '1', '1', '1');
INSERT INTO public.ac_clases VALUES ('5', '2', '2', '2');
INSERT INTO public.ac_clases VALUES ('6', '2', '2', '2');
INSERT INTO public.ac_clases VALUES ('7', '2', '2', '2');
INSERT INTO public.ac_clases VALUES ('1', '2', '3', '1');
INSERT INTO public.ac_clases VALUES ('2', '2', '3', '1');
INSERT INTO public.ac_clases VALUES ('3', '2', '3', '1');
INSERT INTO public.ac_clases VALUES ('10', '5', '5', '2');
INSERT INTO public.ac_clases VALUES ('11', '5', '5', '2');
INSERT INTO public.ac_clases VALUES ('12', '5', '5', '2');
INSERT INTO public.ac_clases VALUES ('13', '3', '8', '1');
INSERT INTO public.ac_clases VALUES ('14', '3', '8', '2');
INSERT INTO public.ac_clases VALUES ('5', '4', '7', '2');
INSERT INTO public.ac_clases VALUES ('13', '4', '2', '2');
INSERT INTO public.ac_clases VALUES ('12', '2', '4', '1');
INSERT INTO public.ac_clases VALUES ('11', '2', '4', '1');
INSERT INTO public.ac_clases VALUES ('10', '2', '4', '1');
INSERT INTO public.ac_clases VALUES ('9', '2', '4', '1');
INSERT INTO public.ac_clases VALUES ('8', '2', '4', '1');
INSERT INTO public.ac_clases VALUES ('7', '2', '4', '1');
INSERT INTO public.ac_clases VALUES ('1', '5', '8', '2');
INSERT INTO public.ac_clases VALUES ('2', '5', '8', '2');
INSERT INTO public.ac_clases VALUES ('3', '5', '8', '2');
INSERT INTO public.ac_clases VALUES ('4', '5', '8', '2');
INSERT INTO public.ac_clases VALUES ('5', '5', '8', '2');
INSERT INTO public.ac_clases VALUES ('6', '4', '7', '1');
INSERT INTO public.ac_clases VALUES ('6', '4', '2', '1');
INSERT INTO public.ac_clases VALUES ('7', '1', '5', '1');
INSERT INTO public.ac_clases VALUES ('8', '1', '5', '1');
INSERT INTO public.ac_clases VALUES ('6', '3', '4', '2');
INSERT INTO public.ac_clases VALUES ('7', '3', '4', '2');
INSERT INTO public.ac_clases VALUES ('2', '4', '8', '1');
INSERT INTO public.ac_clases VALUES ('1', '5', '2', '2');


--
-- TOC entry 4807 (class 0 OID 16716)
-- Dependencies: 218
-- Data for Name: ac_profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ac_profesores VALUES (1, 'Jose Antonio', 'c/simancas', '51000001', '1111111', '1975-08-23', true, 1200);
INSERT INTO public.ac_profesores VALUES (2, 'Eva', 'c/gran via', '51000002', '2222222', '1968-05-04', false, 895);
INSERT INTO public.ac_profesores VALUES (3, 'Juan Jose', 'c/valverde', '51000003', '3333333', '1972-09-05', false, 1150);
INSERT INTO public.ac_profesores VALUES (4, 'Angelica', 'c/rodellar', '51000004', '4444444', '1982-08-05', true, 1350);
INSERT INTO public.ac_profesores VALUES (5, 'Tito', 'c/betanzos', '51000005', '5555555', '1974-09-05', true, 1180);


--
-- TOC entry 4809 (class 0 OID 16846)
-- Dependencies: 220
-- Data for Name: tabla1; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tabla1 VALUES (1, 'texto1');
INSERT INTO public.tabla1 VALUES (2, 'texto2');
INSERT INTO public.tabla1 VALUES (3, 'texto3');


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 219
-- Name: tabla1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabla1_id_seq', 3, true);


--
-- TOC entry 4652 (class 2606 OID 16705)
-- Name: ac_alumnos ac_alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ac_alumnos
    ADD CONSTRAINT ac_alumnos_pkey PRIMARY KEY (codalumn);


--
-- TOC entry 4654 (class 2606 OID 16710)
-- Name: ac_asignaturas ac_asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ac_asignaturas
    ADD CONSTRAINT ac_asignaturas_pkey PRIMARY KEY (codasig);


--
-- TOC entry 4656 (class 2606 OID 16715)
-- Name: ac_clases ac_clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ac_clases
    ADD CONSTRAINT ac_clases_pkey PRIMARY KEY (codalumn, codprofe, codasig);


--
-- TOC entry 4658 (class 2606 OID 16720)
-- Name: ac_profesores ac_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ac_profesores
    ADD CONSTRAINT ac_profesores_pkey PRIMARY KEY (codprofe);


--
-- TOC entry 4660 (class 2606 OID 16851)
-- Name: tabla1 tabla1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabla1
    ADD CONSTRAINT tabla1_pkey PRIMARY KEY (id);


-- Completed on 2023-11-05 19:20:36

--
-- PostgreSQL database dump complete
--

