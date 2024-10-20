PGDMP      :            	    |           plano-metro    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    plano-metro    DATABASE     �   CREATE DATABASE "plano-metro" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "plano-metro";
                postgres    false            �            1259    16399 
   Estaciones    TABLE     N   CREATE TABLE public."Estaciones" (
    id bigint NOT NULL,
    nombre text
);
     DROP TABLE public."Estaciones";
       public         heap    postgres    false            �            1259    16413    Estaciones-Lineas    TABLE     m   CREATE TABLE public."Estaciones-Lineas" (
    "idEstacion" bigint NOT NULL,
    "idLinea" bigint NOT NULL
);
 '   DROP TABLE public."Estaciones-Lineas";
       public         heap    postgres    false            �            1259    16406    Lineas    TABLE     Z   CREATE TABLE public."Lineas" (
    id bigint NOT NULL,
    nombre text,
    color text
);
    DROP TABLE public."Lineas";
       public         heap    postgres    false            �          0    16399 
   Estaciones 
   TABLE DATA           2   COPY public."Estaciones" (id, nombre) FROM stdin;
    public          postgres    false    215          �          0    16413    Estaciones-Lineas 
   TABLE DATA           F   COPY public."Estaciones-Lineas" ("idEstacion", "idLinea") FROM stdin;
    public          postgres    false    217          �          0    16406    Lineas 
   TABLE DATA           5   COPY public."Lineas" (id, nombre, color) FROM stdin;
    public          postgres    false    216   <       &           2606    16417 (   Estaciones-Lineas Estaciones-Lineas_pkey 
   CONSTRAINT        ALTER TABLE ONLY public."Estaciones-Lineas"
    ADD CONSTRAINT "Estaciones-Lineas_pkey" PRIMARY KEY ("idEstacion", "idLinea");
 V   ALTER TABLE ONLY public."Estaciones-Lineas" DROP CONSTRAINT "Estaciones-Lineas_pkey";
       public            postgres    false    217    217            "           2606    16405    Estaciones Estaciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Estaciones"
    ADD CONSTRAINT "Estaciones_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Estaciones" DROP CONSTRAINT "Estaciones_pkey";
       public            postgres    false    215            $           2606    16412    Lineas Lineas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Lineas"
    ADD CONSTRAINT "Lineas_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Lineas" DROP CONSTRAINT "Lineas_pkey";
       public            postgres    false    216            '           1259    16423    fki_idEstacionesFK    INDEX     \   CREATE INDEX "fki_idEstacionesFK" ON public."Estaciones-Lineas" USING btree ("idEstacion");
 (   DROP INDEX public."fki_idEstacionesFK";
       public            postgres    false    217            (           1259    16429    fki_idLineaFK    INDEX     T   CREATE INDEX "fki_idLineaFK" ON public."Estaciones-Lineas" USING btree ("idLinea");
 #   DROP INDEX public."fki_idLineaFK";
       public            postgres    false    217            )           2606    16418     Estaciones-Lineas idEstacionesFK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estaciones-Lineas"
    ADD CONSTRAINT "idEstacionesFK" FOREIGN KEY ("idEstacion") REFERENCES public."Estaciones"(id) NOT VALID;
 N   ALTER TABLE ONLY public."Estaciones-Lineas" DROP CONSTRAINT "idEstacionesFK";
       public          postgres    false    217    215    4642            *           2606    16424    Estaciones-Lineas idLineaFK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estaciones-Lineas"
    ADD CONSTRAINT "idLineaFK" FOREIGN KEY ("idLinea") REFERENCES public."Lineas"(id) NOT VALID;
 I   ALTER TABLE ONLY public."Estaciones-Lineas" DROP CONSTRAINT "idLineaFK";
       public          postgres    false    216    4644    217            �      x������ � �      �      x������ � �      �      x������ � �     