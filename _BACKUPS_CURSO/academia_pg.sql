PGDMP       6            	    |           academia    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16418    academia    DATABASE     {   CREATE DATABASE academia WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE academia;
                postgres    false            �            1259    16419 
   ac_alumnos    TABLE     	  CREATE TABLE public.ac_alumnos (
    codalumn integer NOT NULL,
    nombre character varying(30),
    telefono character varying(20),
    direccion character varying(50),
    nacimiento character varying(20),
    edad integer,
    matricula character varying(5)
);
    DROP TABLE public.ac_alumnos;
       public         heap    postgres    false            �            1259    16422    ac_asignaturas    TABLE        CREATE TABLE public.ac_asignaturas (
    codasig integer NOT NULL,
    nombreasig character varying(40),
    precio integer
);
 "   DROP TABLE public.ac_asignaturas;
       public         heap    postgres    false            �            1259    16425 	   ac_clases    TABLE     �   CREATE TABLE public.ac_clases (
    codalumn character varying(20) NOT NULL,
    codprofe character varying(20) NOT NULL,
    codasig character varying(20) NOT NULL,
    aula character varying(20)
);
    DROP TABLE public.ac_clases;
       public         heap    postgres    false            �            1259    16428    ac_profesores    TABLE       CREATE TABLE public.ac_profesores (
    codprofe integer NOT NULL,
    nombre character varying(40),
    direccion character varying(40),
    dni character varying(20),
    telefono character varying(20),
    fecha date,
    puestofijo boolean,
    sueldo integer
);
 !   DROP TABLE public.ac_profesores;
       public         heap    postgres    false            �          0    16419 
   ac_alumnos 
   TABLE DATA           h   COPY public.ac_alumnos (codalumn, nombre, telefono, direccion, nacimiento, edad, matricula) FROM stdin;
    public          postgres    false    215   +       �          0    16422    ac_asignaturas 
   TABLE DATA           E   COPY public.ac_asignaturas (codasig, nombreasig, precio) FROM stdin;
    public          postgres    false    216   �       �          0    16425 	   ac_clases 
   TABLE DATA           F   COPY public.ac_clases (codalumn, codprofe, codasig, aula) FROM stdin;
    public          postgres    false    217   "       �          0    16428    ac_profesores 
   TABLE DATA           n   COPY public.ac_profesores (codprofe, nombre, direccion, dni, telefono, fecha, puestofijo, sueldo) FROM stdin;
    public          postgres    false    218   �       "           2606    16432    ac_alumnos ac_alumnos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ac_alumnos
    ADD CONSTRAINT ac_alumnos_pkey PRIMARY KEY (codalumn);
 D   ALTER TABLE ONLY public.ac_alumnos DROP CONSTRAINT ac_alumnos_pkey;
       public            postgres    false    215            $           2606    16434 "   ac_asignaturas ac_asignaturas_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.ac_asignaturas
    ADD CONSTRAINT ac_asignaturas_pkey PRIMARY KEY (codasig);
 L   ALTER TABLE ONLY public.ac_asignaturas DROP CONSTRAINT ac_asignaturas_pkey;
       public            postgres    false    216            &           2606    16436    ac_clases ac_clases_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.ac_clases
    ADD CONSTRAINT ac_clases_pkey PRIMARY KEY (codalumn, codprofe, codasig);
 B   ALTER TABLE ONLY public.ac_clases DROP CONSTRAINT ac_clases_pkey;
       public            postgres    false    217    217    217            (           2606    16438     ac_profesores ac_profesores_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ac_profesores
    ADD CONSTRAINT ac_profesores_pkey PRIMARY KEY (codprofe);
 J   ALTER TABLE ONLY public.ac_profesores DROP CONSTRAINT ac_profesores_pkey;
       public            postgres    false    218            �   p  x�M�Kn�0���)t�`hI~,�"	0@���fñC�,Nh�,r��!+=7�	�'� <�c�ڶ�`*���V0� i ��	M�e���1�Ih��CO}�8C�a����3�G�D+)���z��L�x�M�w5���8/��l�~�S�؟����I,"h�W~��₩Uܰ�Q�H���Obö�T�~����A�6���%ں�9�S���i᧤yI��$G>r�6�\��Y�jlM{�1�ԧx�Y���;�;�C*�2�%J!ud���$Q���w�e��O)�c��`���L|�,�l�8-+��tNQ.�Y���?�'t�F���5M�f�����[�)�/�ћ�c�?��"      �   g   x��A�0���)z	p6�X"R�P�B�_��ټ'�ǒ�9Df1���>�1�S} �3�7��-1|������w4`;^��ш��Z�	{�D���G��%�?�/�      �   t   x�5���0���S���^���ZH�U�Llbur�ANq�.r��稽� 푙���o�8�DOy��h+t����0��!�-�.'�$W�ˊ^�؄����ߛ���離$_      �   �   x�=Ͻ� ����*��*��������ؐTH�������̓�@��9��i�)ft�9�|��K�D��=�F�Fi, %�P����0��[�ߌ���9�F23xµVh\����2\�����е2�ٲeHd�08�!��+�S��8�i���Щr%C�R3��ť|��>��5[+k�ƈ�����hBn     