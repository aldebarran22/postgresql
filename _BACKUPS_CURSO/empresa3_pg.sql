PGDMP  ,    2            	    |           empresa3    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16482    empresa3    DATABASE     {   CREATE DATABASE empresa3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE empresa3;
                postgres    false            �            1259    16483    tbcategorias    TABLE     `   CREATE TABLE public.tbcategorias (
    id integer NOT NULL,
    nombre character varying(50)
);
     DROP TABLE public.tbcategorias;
       public         heap    postgres    false            �            1259    16486 
   tbclientes    TABLE     �   CREATE TABLE public.tbclientes (
    nombre character varying(50),
    descripcion character varying(50),
    id character varying(5) NOT NULL
);
    DROP TABLE public.tbclientes;
       public         heap    postgres    false            �            1259    16489    tbcompaniaenvios    TABLE     �   CREATE TABLE public.tbcompaniaenvios (
    id integer NOT NULL,
    nombre character varying(50),
    telefono character varying(15)
);
 $   DROP TABLE public.tbcompaniaenvios;
       public         heap    postgres    false            �            1259    16492    tbdetallespedidos    TABLE     �   CREATE TABLE public.tbdetallespedidos (
    idpedido integer NOT NULL,
    idproducto integer NOT NULL,
    preciounidad double precision,
    cantidad integer,
    descuento double precision
);
 %   DROP TABLE public.tbdetallespedidos;
       public         heap    postgres    false            �            1259    16495    tbempleados    TABLE     L  CREATE TABLE public.tbempleados (
    id integer NOT NULL,
    apellidos character varying(50),
    nombre character varying(50),
    cargo character varying(50),
    tratamiento character varying(10),
    fechanacimiento date,
    ciudad character varying(50),
    pais character varying(50),
    telefono character varying(15)
);
    DROP TABLE public.tbempleados;
       public         heap    postgres    false            �            1259    16498 	   tbpedidos    TABLE       CREATE TABLE public.tbpedidos (
    id integer NOT NULL,
    idcliente character varying(5),
    idempleado integer,
    fechapedido date,
    fechaentrega date,
    fechaenvio date,
    idcompanya integer,
    cargo double precision,
    paisdestinatario character varying(50)
);
    DROP TABLE public.tbpedidos;
       public         heap    postgres    false            �            1259    16501    tbproductos    TABLE       CREATE TABLE public.tbproductos (
    id integer NOT NULL,
    nombre character varying(50),
    idproveedor integer,
    idcategoria integer,
    preciounidad double precision,
    unidadesenpedido integer,
    cantidadporunidad character varying,
    unidadesenexistencia integer
);
    DROP TABLE public.tbproductos;
       public         heap    postgres    false            �            1259    16506    tbproveedores    TABLE     <  CREATE TABLE public.tbproveedores (
    id integer NOT NULL,
    nombre character varying(50),
    nombrecontacto character varying(50),
    cargocontacto character varying(50),
    ciudad character varying(50),
    region character varying(50),
    pais character varying(50),
    telefono character varying(15)
);
 !   DROP TABLE public.tbproveedores;
       public         heap    postgres    false            �          0    16483    tbcategorias 
   TABLE DATA           2   COPY public.tbcategorias (id, nombre) FROM stdin;
    public          postgres    false    215   �!       �          0    16486 
   tbclientes 
   TABLE DATA           =   COPY public.tbclientes (nombre, descripcion, id) FROM stdin;
    public          postgres    false    216   "       �          0    16489    tbcompaniaenvios 
   TABLE DATA           @   COPY public.tbcompaniaenvios (id, nombre, telefono) FROM stdin;
    public          postgres    false    217   l+       �          0    16492    tbdetallespedidos 
   TABLE DATA           d   COPY public.tbdetallespedidos (idpedido, idproducto, preciounidad, cantidad, descuento) FROM stdin;
    public          postgres    false    218   �+       �          0    16495    tbempleados 
   TABLE DATA           y   COPY public.tbempleados (id, apellidos, nombre, cargo, tratamiento, fechanacimiento, ciudad, pais, telefono) FROM stdin;
    public          postgres    false    219   VO       �          0    16498 	   tbpedidos 
   TABLE DATA           �   COPY public.tbpedidos (id, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, idcompanya, cargo, paisdestinatario) FROM stdin;
    public          postgres    false    220   �P       �          0    16501    tbproductos 
   TABLE DATA           �   COPY public.tbproductos (id, nombre, idproveedor, idcategoria, preciounidad, unidadesenpedido, cantidadporunidad, unidadesenexistencia) FROM stdin;
    public          postgres    false    221   
�       �          0    16506    tbproveedores 
   TABLE DATA           r   COPY public.tbproveedores (id, nombre, nombrecontacto, cargocontacto, ciudad, region, pais, telefono) FROM stdin;
    public          postgres    false    222   Շ       .           2606    16510    tbcategorias tbcategorias_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tbcategorias
    ADD CONSTRAINT tbcategorias_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tbcategorias DROP CONSTRAINT tbcategorias_pkey;
       public            postgres    false    215            0           2606    16512    tbclientes tbclientes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tbclientes
    ADD CONSTRAINT tbclientes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tbclientes DROP CONSTRAINT tbclientes_pkey;
       public            postgres    false    216            2           2606    16514 &   tbcompaniaenvios tbcompaniaenvios_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbcompaniaenvios
    ADD CONSTRAINT tbcompaniaenvios_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tbcompaniaenvios DROP CONSTRAINT tbcompaniaenvios_pkey;
       public            postgres    false    217            4           2606    16516 '   tbdetallespedidos tbdetallepedidos_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.tbdetallespedidos
    ADD CONSTRAINT tbdetallepedidos_pkey PRIMARY KEY (idpedido, idproducto);
 Q   ALTER TABLE ONLY public.tbdetallespedidos DROP CONSTRAINT tbdetallepedidos_pkey;
       public            postgres    false    218    218            6           2606    16518    tbempleados tbempleados_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tbempleados
    ADD CONSTRAINT tbempleados_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tbempleados DROP CONSTRAINT tbempleados_pkey;
       public            postgres    false    219            8           2606    16520    tbpedidos tbpedidos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tbpedidos
    ADD CONSTRAINT tbpedidos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tbpedidos DROP CONSTRAINT tbpedidos_pkey;
       public            postgres    false    220            :           2606    16522    tbproductos tbproductos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tbproductos
    ADD CONSTRAINT tbproductos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tbproductos DROP CONSTRAINT tbproductos_pkey;
       public            postgres    false    221            <           2606    16524     tbproveedores tbproveedores_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tbproveedores
    ADD CONSTRAINT tbproveedores_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tbproveedores DROP CONSTRAINT tbproveedores_pkey;
       public            postgres    false    222            �   o   x�̱�0E������D�HS7yC$����?ٮ�p�a+Y�����Em�|�~�V������y�٤���|�|�(V{Lt����7,�֏WZ�I���X���i�$�      �   A	  x�]W���:]K_�]V���p0�gCs�3a����x��XΏ�93?6��{�E:�KR���[םzWVtJQ]������k��.ҳ�|-;�鋳Au�ޱ/��ت�|P�uպ�yw�����^K�#}
b�V���E[��Dk��
�n�b�%���F�Jy�2E��dC?~(}J�u��n�z����-}0�W�me�Q��>z���~���nT"�'Q�J�j}��Y�[�y�^�g��x>���'z\�|�.AtWu�u��K�P+����c`�f�m��t��U!��K[�Ӥ���	��m��ݞ�4�G��X���{9��2+��H�j�-pF�͖�H�OA,���MX�ֻw��h [*󮢞���Ӎ�UK�*�ޔ���Ue2(Ru�f�f�y�_u'llPO4?Dן�Z����2��^�bGq�:��w���;���l�d����Eo��i%������Q�u���C�������b�?�'���ω�gD��v��eP�St��JT��t�D]��bʺ��aԀca�;�K� �~�Ep{�찬v?hs��+i$n#@�d�dQ�CU��ny�B|���}`ߎ�pWg��h��+�Շ������2��7�� ���� ��"j��Ԛ���*�֊�����N��+����&F����_!,�d��pw����N�$��8 ���k6<�n��� ��y`}tPTn,k����ʟ��@��L�]Y1zd�����,/�E�s#q$�A��2�,�
���^;��ٞ��F$�� �M`�o�O�/�(9���f����ȃ@? ٫W���G�c���]��7u5�9� ��O��함�Q����&Þ.Fwy�9c�_`(���^q���3�ۭyb�?/O �¥���Y���+/$��J
��]��=Z��(L�`ztz'zG􆌠X}Tw*j"m�C�K#�+��Y���&uïڒh}�Cb"�Ͷ�8=Ց[#DC��j�)� �XѬ���5E�������{��,�M��3h���L��w4�A�#���z��r�E$��I�Z=��f�5 XJ0�[T�Z�G��j��;>�Y���ކP^X�>��J�ʖ��ˋ6��礏��7���ӝͳu��y�u���h�KQA�g��GݏhP�9�� F''Z��S<��,P�I(��]�EG��l�-(�,\?�7�Q,�'�k��Q��S��;��4��G6o��*� ��9R=
#Jt�x�1���8j$~��ij��}����D)��n��P8j����a�Y���i�����*��Ƈd��	�I_��8V�ȕP�Һ��r����p=	�.)��0�R5��{u�-�Y��C��K`$Dh��Ns�Qa��ٷ5_x%)��F̝�eK��\Dgo�M�h��m�A޳�ߦ��4]a#@ 슘�M�WPZ��*(�u��XBKP�Y[Q>���*@�m�UoSIug���dO���9������tm��JR��~�(~�7�Ƽl�i�b�]O�P�~���iMë����	��P�D��َ�RV��3�2�r;�W�.t��)7%�%T��'yA	qlr�J;	�Y�MK���_DfA+b�"׺ɠu��*DM'Љ�֏���P���y���xĚ�"ǚ�M�0�'���Y�/n�rG��ٷ�+^������Gt�i����!�ɰ�\�;F�2v���蠋��[|uLBЮC:�S��@�����{+h'Q�y!y�Iް���h��� F3^���YO��tI�QC���*�|-O�~Gm�q�f#��Փ���B�w\?���ðu� �֏����U!1��<���݌���sK�|@�قՏgl]����'eb�P#��Bd�Q?��s����M�X���tn�@K>r� ���v�I�'� Y4	vQc>�q����ws0�2K�e����=��*,�D�@)
XS���Ix���d��o��G�/�ZqX;��/�֊
�>�-�q�������}�? ���[�\���۲�
�ՐW�,Y��!:
5E��|[E÷h^20aYs/<B8��z�HoC۶�T��)��g���$�9�Pb��YIQ��#�3JV?�I�`�GGQ������Q ��1/W�v`�g�&�'*�b,�n1�B<n��Q,��@l�����U�=M��m��\n��SN*�~�f�����a3�$�-����{eF���^ �kuI���Bs7�H|��8�W#�g���NQݞ���0L�����T��:�ͺ��;1͓簁�X�a��[�,p�No//�Ÿ����+(�k��Z¹�e�Qv�j#�e��}Ë�F��U��,����%��g��� �I[�      �   [   x�3�.HMM�Tp�((J-.��050�T055յ�06�2���,IMQHL�NLOE�76���2�tKMI-J�Q��,(��KG6�hB� �yQ      �      x�m]I�$;��\L�P�����u� ������,��"�m�>�_�k�����5�O���������db	q��W���]��K��7�X����E<��f����e�_�`6�E�G����]㯿�����׭!�o����셇���Rc�?��ޘ}��T��[���e���h�9^�	���*�6��w���ol{Ęu�&����^K��'P��#⦿�6-��kc1�R(��A�K��������W^�ڟ�ÃC�Ϧ��� |^�ݹ!^�c���C��U���n%����.����F��a����|���	L�P<}$tVa=��d�"��Yy��C�f0Ҝl�O~n���%`��*��f���k#�e}��=�}M�7��.u�/�i����c=��C���u`8�Tf�X���;�p&P(�w}��m������`���˭����Bw��9�.�O���ޛ�<"�Q��%�[&ď�jP�Sg���1	�B7�Cߑ�ʍg������:�%�l%l`_2	���������u�>V��ZQ%�1>ڮ�}�1d����t#�7�-g�5k�."��9]�gG��=}�b��v#������X��ϛݧ����V���v��0�@���g�5_��mN����Pv��	��@}d��d}���"�@�4�����3�D�Ǹjp&����ŮP���-&�ҍ�-��SoF=߽�U��ؚ&��5#�&��g�ys�nD����*��n-C������l=��cP'�P8L���4��3��0�$�:~Ӆl ��.�t��P_ Ln��9�2w��"�#�t���L�Hki�N�y6Z�{�����We�޿�(b5�︼�Jʤ���FJ��E�����H�8AD����t�P������ڭ�	b�h��=����wu�&A}gs�����!Wڌ����:i/; |8Ј�vs&Xj�4�VU�x����}k=mM��K�g{\�S���@����N������L�6��݈��0��%��BO&\��_e�1YѮS8	F�R5���0�
O�x�]�L#L����`�u#�n?_m�q����olޚL'<"4�2-6\%��	���4왖>DrL��i�ӥ� ���p��}�eDv��?Vˌ�nJ���_j��tc��3�<�n�|���z� BQ�#�F��B B�H=b`� v=��<i�t�� y{C�B<Aؘ�mD�Ùp�X���2��6��c���a�����\_hB�]��;�yL���l��j \S-u�gqNf��8K��q��Y�	V�'�I~������*�y�Y�,�6���=��D�E�^LM����c�1�jے��A����	�N��A�]��.?إ�&�R	
�p��%��dQ��:h��ݓ�\#ʢ]7�!�l���\+�H��a�CŖ��ǰ�q����R[��	�+^�Ra5��BI�50��M'v�޷j}&��Z�
�A5;o�p�I����Z���%D�2��dpLE��eЭ��#z�q=���a>�N(-�%V�4{�^�
l!W�9ĸL0>�"�-e�p@ԑu�uD��DK���Lv��ZD���
.�J�h�v�.:�n�5{��pK��tL���/�h�(�i6�j���>.�;��@
�1��22AI�<㪖�(�E�����M�<��vz׸3UG�>��g�p������;�3X0��(6;c|��pL(�&Le�8L �چs��	3�%t�D�P�bQ9�=��3>6�M6���Ma������Y⍌�G|��]u�MQ.�-�'v5#��	��B�~�U<��Ę%9�0���գ���[�x���:��IØ�z�ɘ��Y�3YDQL��u��vղ��������n�̘��m�iDi�B�P�ر cR�A*t0�X	n6�� j(�������S&L�o`RLJ:�k�I���3�8/��)��z`"�Y�Dv�� ^��1"R1A�p/ax(3k@�	4T[����D:��,x�p�y	�c꓋+�.3�Ɓ=
�A�B�o�����.{`ˡ��>����n|Bdkx�K���y�=v�cxD|t�8���u�<�L2Sb��� |`!���ab����6"̢*��S۱�pA�R��@�u&˟c.&�:Io(˼r�[�v-�o�z8ؘd|2�f#ґ�-JX �!�-!�pa�]�9�A"��C�3�J� I3ܳ�ǌ�B����Z�娀�b3a��.���>����g��0QS&ۡ~��7o�v"̐��BD�4]{�6�	�׬>���L�}>c��IH���L�#�}���`DH��k�0m��X�@����3%���pv3������\�aO�S��Q��Qwș-�	&��?�/b{��($g�d㈉�Βnr����Ϥc�fL�5��<2�J���w�!o-rUG�	_T��i7�{s��2��Q�i�7�[�:��a��`��0.�S\׹�;J�h�uk�}�t��@���Z��N֧N�Ns/u>��&>c��)g�N��(����~�t�:@�}a���̄0����k���v��|�B��DQ�;�J�N}j%��0QO�'[%)�˸�@1'�LPD������+R-5�X��I�<��G��¢=ˁ0�k&?&�������Iq֠��_�ҧd���@���aj-�~b�Ҫp�t>j��y� іcLJ�a\�t^��<9�w���.� Jb�<���3Rp�	�Z������1S��53����#p{�\:~v=�c"�ƘŮ������<T#���$��B��K��Oa�ґ��:c�Wm�Ґ��i��Ր�)��A���y�'.+�Iy3"'��U�wŪ�G׌K�x�]"ד!��L0�xM+��L����e^���6��+��at<b^=W�2��'��:���s��sRbJ����IVL�IK7[��Mь������&^�(R�AVM�e«h x�]��,���k��OO�!qL�ɤ-��#���H	q�4e����j�(��8�T���n,W�)V��O����Ic(k/�L(jh=&xn]j�0�ll`n��Ն��~�8��#�}n3u���o���߸ ���ȓ`��M0g<�e�a=.���u�h÷lq=�\sL$8C��Lb���lh�8\�G�\��X_���=��hR� ���oq{�����`,>�Vr�]��
d�����:ـ�Ȩ�8������t�l�!�:*����q�م�I�ta��:�w�{%�--{����d�����\�*<��_�`Z���0QYT�>�ˍ��6q;�~a@&�����?A��w#x�[�d��d�6:��t��E}�����i�tL����;F�����
9��T��F�ϕ��c��?/����3�w��$��	�c4���`[7���Ē@Dlh��2DF3�!�<�k 2lo�ׄ� ���@��2�6Xi�qz��K�yA��c�3��l�2���&W�ɜ-tfP�k�G�u-c����kc3Ӯ`���CLd��c_3X��ܱ_k��SwkX��!6W��f�n��Z`�Vi�&3�,�V,Z�o�2�n���&p�5����&�g�-C�77��T�uhO����H7���5���e����a۟�F{�0�*K՗j�6��p���j+΂�0�UB>6Z�qsG�*GkJ���a���t�>qC�:�����}vP�<�c�3��$7�,}�����Q�Å];ƫ[;"�kOT54��7�ڍb>���E�vl��3��ۤ����7��0��,��o;��a�U!%�N.�~.8R%�������'ͦ��Lc���	�5Tv���@إK��flDX[ ��3a���K�g��;�HƄ/�aD�$�����n��W���W>�(ԁ�ũz�N�ț\K^��i\`l1^`����g�f�����bl ��!k`̲��H1�NZYZ�r��fn[�Z Ů�A��91x�O��	��W�p� ���&�<\�q��6�2�ӷ����/Ϳ=f��=P"Ƥ۸j�F�;6�Kfꮺ���1~5�Dj�ZeX�]�Qɮ奏a�q���G��    P��\ ��to]����ћ�yٿf6���+�ڿ8�n�A�(A����� ��޿U7s&����d����M���8t@�<�?�@&Rs�n.��	W|�[n]+s|ʻ�59ͻ����mӔ8�FC�+�/.��T�O�V޲ljD��^��63���C�X}|��f��� ��,����`�e�8�=��
��fm�K��!͋�l>	
����e¤�q�s,`(�͍GðF�u��=�ݦ�Fe${
:�p���a��N�B�Jl��5#|w�`�%���nf�t����w2Y;߱�}4���Aʌ+)%�
��M-�`�aM��/���4)d�v,c>|R`6z�H�61���j�3�b��3�R#�mFdKfs�B5_,�;B1.`�ٴ�T�\��A[�$su�s`7�����n�_ُ�5>]�t�+%��>��~�5�cFb3������c�=g5c��a{AKX)��4.*�ձm��0����&t�ٞa�j��gu��%>�&L��%�����+}"t��'�|H�(�^�P-9��s `�(���. ۆK�W��D*�r{[�e���p�I[��Ԙ\ ��i�`�Q��<�'��}��/a/���^>�B��b"��	Ɩ�`�bq��.�)ɴ�;o:B�(t���h��)�>A�fnO�+=��SD�������ω��.Z�`r��)m�ڮ�w@��`DlA�%�5WB`6���O��Cah;6E�D��5�j�V����,�~b��;�}��4n��tc��Ҵ��O�_
�ݥM���� ��oJN� ��46����;���Tu�)�ؒ�񘨋Jn�D|d�V5�i�\�	�U/��V�8������d�$�'�"t�.��:�'4�4�}�}�;>��O�~�fr`{����Ή�Ǟ�з6+%����Ş"��ۊc�`�i�1�v�gL쥙�']�a=߀e�IA�l\G�qwݫ��I#ܕ����O`�
��3lH��R]u7�8�.�GȊO�\
��'a�LGm{�
�wn� �A?�-@����	�U�"���(.��֧_�'Y}���G6@�0�#���*�s(GA�vcU}#B����A�AjOX��`��G3"G�pWT_9$|M'���D������ئW��L� ӈ05�H8Èt:NmT�D�=��'e��t�~��};���D�F�d��xб�{�b�S۾a,`\.�q�(ܜ�$0ប�z�B)j1����QK�Z3��L�("ɩYr����x������x�K��rd��'iV�͊R&��+1�C�O�z@�D�~S��Ph�9}�:-���p2h��O3Źe�D*�(�>귨�~�7L�B#>�tj$[GK�z��D��i�q3���И�ƑT:�cT��	��k����gd����3�O"h�+0�s��Y�fVY���4n�m�����@x���D��7)B���;St_8˔I�M5�Q �8�q���P{�+�4w>`X�()�@\#�L��b��]�0����"�����	ay%O32�0��l��a�J�xD����v���PS��j)����z���V��O#�Ӛ���Y}uZa�.{�JYN*�k}���S?� .�{�v	��"7����4W�)*�z�EG��Hy�s��86��I�rd{R��͐	3���c������.{���<霉2����d6�^���k�`���d�J�
{�hq.�V�M�L�ff\Mj��j
��>%�L9`�@�-i�O܁v��`ӝ�j�}?q��N�(��9��M��UT��_D l�Ϗm�ipܵ�0�6pN���������a���"�>��B"�t?�ݏ%w"���=��I'ϛ��q��N�Ӥg�?����Ybg�S�qI ��h�� osR��r8�c*��l	c��:2|$v�IV� a[=ʼ�{���8���XF�2T+�V�Zt{>fX�����&�Q�
��:�&�O�
39�A7���e�-(%R�H�����!�g/�f�-��(���3���V�����ּ�j���띱�F�Ip+YЌ�؜_>�X`��,8y��W�B���	·,{�d �_�9c�c{���~ū�
�ر0;B3��Z�*@#�fN�_=hg�3���w ��C:yh�^�9<vr$�;e?��:��03.@ӈ�A�6�ݝ�C+�e=
N���-�s@�6����9%b�)��L��c�w���LD!��9���/��B��}:�Wl��kr0��~z������,x�a�.cR�%㲁�>�Ǆ�q��u�L	8��6k�e|M47�bK2��'��/�h�7�j�v�0]a臟B�G��������b���J�ֈӁm��ao�1&2x�[�+&��F2SR������P_>J�$��$������������#�n��Ѵ'>���2����Ig3�=z��u��&��39{8ڐ�Lԃ�3Cin���zf�1&��;_�u�}�Z0a2b�\%b³9��sb���>=���ʗ3�^���$��(i,L�t�qΙ�k��pC���L��Ii�~�[d���a�'�-�,e��(i�9ur�8T��b��v`�;&p��*y3�z�t����^�d�f m�j�����B�b�ƺ�>�'��]z�q;�6pV5UV�*y8��г蓈%L9�<F�{�=H࿧0�YajvC|��
d��]�%�yv�5���Egט,c?]^ ꆻc��J�=�g���Ͱj�=K�6c�su&v6#�17���E�B��Gn�z�:�����	1�3���ܢj�-In�S�ê��W˧_��'b�ּ ��C��o9N@��OƉ09��PJ�4��k�,=�;M:�A�nOxF�>�k���j�\���Q�F�x�r��8]ωl�j3��/pR�TpJ-[FX:�/O%"�&Rzf]['�t ά�7G?m�:��bF�|���m�,���'��QT]�sj�'�pN��w-�7������W��O���^��;rx���f8�h{#�˘j>׷�~����.�Jʖh���tw����G�����C?Sn���K_[�R�>��\�2nю�Ww��k%jzs*��I�&�B�|�u��)�Y��_>�^`bQf�����3�7���{���Т����K=�Q2c#!8e�+�j`����޸?���we3����¸&���7�`����͔���*wMn��|a����A�o���-	a�%���/���|41G�'7D�(�i��~�%���@���>Ы�a�d��>�M2���`ϲ�"�n��0@��J�ӗ���B����.0%Y1.!��)_a����OI4a�cf7��o`K_#��v�c��aT!��$�H�\+D�4��k`bP1v�z5��ӛ	&�b����οe㿑#���j�s�>0$D��]N��9 &l��
N(3,WL��wA�~ֱ,Q�&�R��#��+�!�0'�b�a���(��d��q3e{�~ṃ��,�r��9`JF��_rOV=���
�G��l��Y�^�yB�\#R`ApJ����Z�qoN������,�I�j�w��%��F�ew��%'��/���:y+�E�3z .w��J�eZMd�9�Y����J5�A��	�|R�o����\5�|�",4����+
q���4��^�p���J��+��rّSq� ����'w�AD=ڼ{���7�g�g�a�\�D0zS�O艉|�sw����n���/��K���v��/ոc�|\��5e%�u���+�����?K%���9�q>�c\�/�g�=>��8�R�<�61l�l�Ё�O)�ҁ0��'�83��<�r�|O�X��Ų>����K���eܓt�2&��tb�e�+�ۘ|��	�Jё]>R�8��79�hr�\K����*BT�s�i�6ڵ���f"_��7'	U��
o`?ɵ�\��H	�2�7�H����T|��$��t�@���rO�^*��c�/:2Nǰ7����ȡr���ʽ��#2.�V������rV��� e  ��4��~Y ��F�C��}sX�s�A� �-��H!E�Y[a~��Y��!Dھ����'�p�^���x�JA�%�-��N��t�@�|_��U��[dC��z@؞)e�_RN�&�p�v"_�xD�y8���s���?1�m{�i9(��ʂs���H_��y�p	���ߵ����f�!��d�:íܶy���Dq:Y"}R���Շ�y��fp�H�H5n�]F7�핒n���'R���~�;Sv�ó��� �s�J�8Hb���B�<�ﵗ�I�d���&p 5�#�N��$�nݜ�"8�a�0��X�0E ����2�_��{�=�C�B�����'@�#��F��g<��r�����.�v0�3
Q�l�| /8]-��`���R����fʧs��J
���	�QU�3K���Ϡ'��-D�u�	�a?H��? sz�#r���&�Α���Y���T?��2v�+3x#�#T��Q�J�L�
S˸E�g�R�*�}��]`��V/��N�Up�ȹK�C�����2`�
N'ˈ�f'D:�S���m�����h���e�HXU�����D��IB�`
a�?,�~;��&p������A���6�9}���/](g�m:"9IK��y	e���g���'V9'"}ʛ�藐�ت�=�=�2)��o"���.������������җ����Z�H��i������x󃞠q �#8��L�Cx�G�P�j�p��p�UV;�jw���i;�lƧ�����r޺���/���`|N`��Ӊ��)_S��F�{m�gT��Ma��2�>CGe[�t��)�e�g�|4����#������?����/�x�[      �   z  x��ұn�0�����I�96v�u�®;u����Cg�A޾��vh������Ӱ�CI��g��+��iGy�<R�9L�lx�h�+��T��Z��p���l����Q���Z+���0p�O�>�����p�c����1������H�'�+ֿ���9#ZXс8�|1�x6��5�l�D���0���Ft�������O�G|n��o����{���W��3f،�
n��ot2}�J�M�L���si�9����v�sb��+־�b�)�H|������x����kc��u�A|���=[i�Y�Z���X��p�C�7��u���%����'�Ok煇e	����C]�Lg��(�����~��L�����      �      x��]�n]9r}����	6��,˶в�Hr7&�cbt�AO7�5_�_H~,d�R��y��9���$�ź��vm������6��������ݶ��ϻ���f6��w߾�����}��'��i{}���i�v��_վ�O�������{�}�p�x�YG�'���7�7�~�Ƿ�	���o_��@��ͪ�ݯ_������ϟ��Ⰹ�0g���#����߿��bM��+k?�Ejel�)����ӧ �R<l䯘�y����:�۞�o_>o	)2�	��w��~���������_CT�o�>�?��lbQ��S5[����������u��=?�|�1�W����������׶Ci��{|�šywP���������_
���������~��_�LX�G���|���*��[Y3������5O8"U2�	����o_����������'L#X�i���dF�&{$��ۻ����j>Ě�L"���_�a(�����Ӧq��ϵ��B08H>3����`.�'�� є�g���a{�|�[��ښY�|h��������秗g���ͬ����3����Ӈ��_�x��z������v8�@���7^.>����������Ֆ�,��P��-�X.�����?l�gCr&��*4^l@�Y?޽nr�:�?Y�M�#��ඏ7�d��N�Ϝp�ۗ��g}���ya�?�]mY����O������D[�j)B�w��_`�!=��I�i{���Q@̀�]B�q����G�L�@R=���f{���e�[��dKYo��������PL-P�ͼ]c,`��|8uY���
���<��J>+���y�\�P��H�B<������[X��}���peLۛ�7w?nbei�y>�_�}���ĂO�v����=N�����	&����נ��P������[�`:2R��[�4�.$V+��
a�MjY��)�ʠ6,�VrM�h�b�	�S;M$O��L%��Y׃���H��T�C�v0��2�ДY�~����	�u<��q�r���(�
N��a3=�A���a��Iڣ�*P&w>V�O��M&�O7�o�^���
�e���f9W���ʕ��6y=�����ʻ׃�7��Ooz�)+��.+��Y0���{|�	(��U�o�.�����Ǜ��MPw�&�T�?5.~`��4�f�g���d¼~�{sk�Lq��N'�	���ǧG�<|�LO0Ϟ��-���d�Lz�/<Z�}�����`�s(Z`�@Q�3H(Ć�%e�޿<ܼnb��v������[z���sR9n�4����a�k�����-N�]'I	{XEj玧�3�a2$Գ��|��-|i�oU!���6�9��
m\��iޙ=>�e����[�����������p�@�$�vKN �]抗��n���;�N�V+�˜Q��i��d��i�y|�3&��=�|&sӻ���o6��1�w.�a��˯����/�Q2U��n�����Z,<3��LA,�	�܈��Q��o�o>��'���LSFo��1[���c�)����/߿Tḱ��������Ub���b����R��i��б֨�������~G�R(�I��5�N��?GY�P��M��ύ�M[d��D���0�m��?�_�j��feSyd! �KU��S�%���ǧ7H�5��t��߾��/�V�%��L�!<��۬�<��H����SLD)�G�mQ���S�2�3'in�T�(5+U�q	��	tMhp����V�nWj,�5�n>���"<���o@ΔH6� �7���/��nb�]��9�Glq����j�������F�������^��#��UC��d)U�9]�>���U�;�}���}�eըPj���b`�4/�A��Cq�Z�%�����u���P)�&W	k�V���P�f����~�ڼ=
XFWsE��>;1Ɏ�8t@�s治�^������\Rr�y�
�X��<h�ʠ�k(�Q��`R���e��"� S4�kQ�IH�l~�}��}���3�A�K�ȣ��������t'�X:��+>���kvk�ؚ>�C�Qޅ�ԇ�Ǜw���q	��R�����|��XeQ��w����O����n!���2N�v|C�\�_ճF&���&���ģ�7'���iL3u�!cy�䂨<8�:ٵ����_op�K09�Y����/��B5�Xmu�_�F�Y������2���	ހ���V	�	�? ]M�� ��·*w���b���qdUB<�Uqo[���Yc�;�d�/��� �o��PY1�>H�b!%�g�H4�:���X�N�S'Jg+����<)��cZG��3���X^�Mf�c�7�(�DG��5�rMv�^�|��3T�.��d��_~������c�O����dE�����G�1��	�:0�F�u�=��CAci2�5�DMv=��1W�����ˤ�]�qv���E	�,���Ď0�zM4��^gƭ"�}c�.Y%���d�0��<ʔ 2E��#Ԅ<h]Bn����Vh�%�G�Y�Vi����«`����_�ŧ��#n�<n]������&�:�I��9&e�CD�)�g�.� ��E^v'0���HPb��@��Z�3gX��dC~�lַ��Ooq�~�>S�w6���� �x� ��_w����kه^a� �tz!d������v�mJ�;6S�����R�	+��%W��߿~�-3[A����Y�U47�4�d�J5d��Ԕ�3�-�%)���Ŭ�@��Y-C#V��p�(�I0����/}jڐ�W	�V���Az<O�Wͼ	�I�je�e����E�d�[��̻��ā�r���B�T����N�A��Lf�-qy.���K�(rU���V�G��EДZ`/��$3l&yj,?2������-ԔFQB�3-�k��VP-�Gf� �͊"7RAiA1J!!K�U;A��9(FVzxV�r���3���{;@(�(�J��q A�7����f?(���F�9�������lt3��D� ���6��r�La`ORk`SX�+����A+罛�6�6�O��A�>Fm�i6�o1��� �(��0rb�q�b�"X�h�-[u��<P��"�oG�����Wqvp����7�3���R���Zղ�d�\�#��d[�(�8!�� 6���(�{<_�"@f��x%�i9[�����4�lH�E��<�c�ڊ}��K.�M�n�V������B�E��Y�Ei��t8�,�cE"�<n�|�T,F�T��vjR�
���U[jǉ��؎Θ�۾�59��0�Bf�P�����M_-���W���d&+�w�4�Ͳ�f�zʢ��Ҙ�r�a�k�guG����P�'
��2�jj2OsE�u�1�E�� g��͚=Ӫ6��6N��p*��4��W�w��u���4 �"��NLR2�D1��[���	V�S\ p��j#	E�]�.p�5���N��޷RH�3p)��8�Npu]�5�"��v�j�7�"�qXd��tԒ]v\0�:�!�t��9�U#��ڠZ����-��=H��[x/�*^J�Cِͺ�V�(�3��2Uߩ���DtG�J�lZ�$���x$�P%6�4�x�-8���G���"�uv�R���4Ҹ3��E9@��	��R�YvH�þHS۸�`�5s+�om��Y�V�A]�R>�Qg����a[�)��'crQ�h���S&f�a�^ʲ��m'�\�u�{tK���U�/x&v�<g��d��'th�1}�6U���1�8.�3+jMRE[���z (b�T<�	���ހtP�xJ��i�I5��k�8bIOa58W�=�*#6�q�d&�
T�e_�1�(.��N���=C:ͦ����θ�t8y�|���|��_�+��W��㠡����(l�hT�C�_�Ҵ���F7r���)��vY��}�؀�r����v��o2�_�tK�}\��{��F>�(xlˆ�PVn7x@j(�3�+Ɛ��E]���ȇ��!P�(��C�_U3�ۻ��8Fd�r�%    �B���`[3�l���WH����In�=�=��:��}�&N��G�,H]J���rJM���oP��qy3j�<��0oC���@;eZUTt����mu����S�Ў5���c<ĽS�nPj%����.�]�W�b=7 <�������}|z~}�i/�����|©����`E�@E��ϙG�f@��TM�5t�w�
�����;2 �"L��w�non��3���L��L(1�������T��qy��� '��<JFd;y"���1uO�JgOk��.�
��J��(v����=�cq;����P��E�p:4�^(8�&Ei�����'5@��cEV�"��2Y��{aW�*��
�M�2Y��12d1��F�lq��f�NT+�,���C8��8�)s&V1f�����x.Iu��6�X�q{�%Z���3�^P��}_�8��F��a@.��L�Z�O��`�7yp&6�������K9S��^����kѵ^e����K-�O�y���祶�Чp׌*@�l��y�<�|�e����~t;�����)<�h�����@�|���9�0s)Ѐ��jq��e{��v��W���텇��������K��<~�� �O�i�qqʈ~*H�SS�H��L.�C�ts]�`-&6J�r��=����B�2%��%gp�
kɳ�M�)���8x�ts��[-��4Bp�3axֹ�3�#N\�p����)��+�B��)��#�Eo����+q|xU9L���
�ڝ����\�C�D%��X`�rB��Qi�M��	�t(�
r<TR;/���PP��-��w��X�'@BS�	<F��I,�3؎ȼMr�B��5,�$z��G.o`��(���Q��M��g���󲃚*�V'd�6�V�u��P���&�\��>6莀G���#\�u��z}����l��ֆG+W��r��*�Y��*�'[k�s�òh(�ƹ�6�t��i`��-���&�c�\���j"u��p������U�<ؚ8N!�: p6�A�E�"���-A>D�$��\859�4Oz��K��+Ax��tV%��!�V��,�V�jł}�I����5"�R���߲�u���SP$��5
�[�3A��GI���J����L]�'���/Q�咚�� l�V�Tڂ	+!���Qg:{���d��4h��c*�&J�,�T�D��Cktoз���k[R�D��s�����j���b,Ӡ�k-J�\
x%��'B�����q�;�Q}�\�gfg�^�E�d���V�k�&�!���a
>��L�O���U��}�K��+��"�hh�W�����{�ሄ�c�	�������h��G�^	2ulDl�ǉO��{"h��"�u��=��ڪ�hQ��%~� ��X�R���	��g`o�oAژ���W=�,;��Q�z�U�ʠ���ڃ�z��T^?CX�:k>��)���>���R�C*<^�|�̅���B��	��}�E`>�Ū��� 9_m���C������V��⬀NL�4�~Q��Wi2�A&�I{��3T�-S�q�
��� �����N�|�ȗ���P�Yb�"��w��I��XB����I�|_?�݊q��"�Ҋ�KOCj�eĮ�O8$ZV
P��3#ˌ豄U���:L�\`�|�ڤ}���̋�^��[	M�f�|�/��Ш �I3�5	6P^	M�H!��غ���
o�� F8��jC,������=Rk	&��������@�%a���y3�w@m%a=PY�h���?�;T���o�(h�����fcŤ)����̓q��۝HM���l���U��}�x��C�
�~×�ȹO5��VV>�7�~��k��P-)Hr�v��t\�(J�llB�q�&[+�����	�;B?G�.�5�Ḕ��JKb Ո1^���d����:S��9kz5	;'Q�'}�G�������jy�&ٓP-�g���m�t� �P��ט#k�Ԩ���ʛ傻�g��X�UuvYŔ��"�˚x����Bͱw~��.���l�^���'}�	�ɹ�x7�Md}<�U�مλ4�ٽ���Xw�m�=�(��X?~��S����
��	�<��u
�o�����3װ�u5�i	r�:�Z$D���
�����`)Rj�Y��޵��Z�ꑺj0�o�fX�f��2H~����'a!\��D5���R�5�[Q���-=qD��"Xל��:a��lB���Cuf�$eDP�~Ɖ����8��i�E	�.M�|	f��X����L��ڲvr9.�ɯ�g�#�F1'��� 7�H;r���ؖ+�b�uɇ^4x��'d-g do!�6�
�^̩�_z�1�}�Ҍ:G�F�h>�`���8s�>�Q5� ��<F
�������'*�Qs4&`4-#�ڡ�J\N�'����S�����A�k`5�3���}�ثE���1r�T��1Lv�%lM"%,���}j�Q�e	U��L���=[	�I�\��?�P�sE\J��ZIɜ�i��*��-ʚ�t�����N�1�y)R���	³����c���� �J�^T홢�A�{$�X<�F[��B���}Pӣ�`G*Z_�?HQ~l�	q��JQ��e��0�Jv�<����fj�5pm��{/�6�I���XD�îd�<�Z��Ҁc���#�)�Z��������8BۏF����!(�����X�J?�����_J�����v�7:�݀N�B[+%�F�+�$xh�6��!$��O�}����Q^�U����"+3HM�����;+w��|jo]D��l��+t�B���@ͯQN��r�B��_?!��0ɂXU� �/�Dm���?�=.a�jV���]����תJtM5��{����Qt3�4?��ߠ�t�/���"�T�!S�W��R� #��˺�O�.ߠ |�dтV����B[��ا����
 �{_�n��g�>�W�8�e񖋷��?��wP�ʵyn�,́YZP).ηJq�0I �c������G�f����i�B�&ޭ �,+Z�k|�/��4y\AQZ�{��}�`��o��#K�����|f��k'���@so��M~����I*\B�:S^�j&{?w�Q��o��P��6M��a���9��z�=~ ��t?|UO���s��������|k�۪ �^��tw���dGh���j�A��⡤� ��S)a\��̫u�%'�r�(�m���Փ�S44�v�"?Oz� y�?��m����X��Ş.�3u<����@��Az��)��q m�7�/#k�̶'��[�A��ޒ���{�d���7t�Q������/�H=�j��T�B.�y�6�n��3��V���Shk�w��i�%���L�����;d������k�hha$�z�u���~�R�k� ��V��H�+����Ap�]�!ZhӒ�}��,�� ��
~o�,���b��D-I9���E��5Z7�RZU��e�˟��J�7-!X�ioJ�5l������"j,�����z�؍��C��� x/�����؇��X� �;Aפ�ح~C���T���Gp�c�{�߫�5P!t@�q�(V�����hCX-����h�܋�/��r�V��Zv�e,�׆`������Vfd�3���N؃@��������� ���Th5�cUb��̙M�ީ���f���eBl]K�%�0r5H�1,�k�p�s m�����|�3��敞��!��ʆ!*Yr?l�>���Z6�va|�,f��ַp磑U�*�؅�s�®�!vUyK(�%!@�;�k����$Wo%-̗�K�q�����
ҫr��
aT�+\�8�O=K��V]q$ӅO�v�;�"�N=٤Z�Fҥ E�qR1��ٍ5�O�QsmH� �5�(-����r�\�x���k����]�����Bꭜ`�,���f�o�О%�M�M1#���x�l���e�f�%���5l����Ē�wJ��6ԈZ�w-�hO���~iz��s   ̶O-�b�a�Ԡbە���1[>u��=@C-N�g�Z(|6�xzXvuQ.����l�E�����1�М{[s�,F�ޟ��d�3_�Ob�����'�HT�V�)�ZE�0��w���P���߹���Mv���`T�έ��'D�8�>Vkq�O��iz�Q9,�
^���3��t-O-ҫQl�)�!T����]KI>�{q�`X��)�7�=5E_�҅e��B��ƈghs�k�2���9r��az����'t���}�����[R8�gG�\��y�5��b˔xô�YU���ܢ8����|��+X~G�Hc���GBդ���REݻO'$�A(����>�,��^�𿪉�f�#f�}��Қ�8+K� ��o�2���M}��;���	�Z��b٘�n=l$<�+�hl[��&_���"e�A)<�%w�Ն`�G�>���
�:��wg�_�#!+���.?�:Y MjԺ���'S���gTB�]o�JG1��k������������1�#�dO]��t����h�c{�G��@�%�ȕֶx�#P�Q�8��K,�څG	�+Z߈�q;�ݴ�^�*�#�Qw���J���Z|i��]n����D+��<U�9��G}u���nnt
�%̲�PoR`k��t��q��p[k��2u������,�Z��p���욛��
�^~�ꎰ|Ų\��	Π�E��^D��Y�%})��Ez������E���b���OX�q�����{�׻�j���^a6s�E�2��}i{����'�l���,^\�<������b�m	.�:A���������k���13��$z��Z�����D�^�>�°&�Ƕt%|ī!R���T	$/�I>����=P.�$������8��{������)UJ��Q�S���n��l?�R-��I,��/��Ǘ����u�����/RA�c,��h�AL��}B�1��.8L~�E,�� �����I:xm�aU�`�L�]�J��>�K7gA���+0�ި�i{օ�m�������z�.�k]�"��i4
��Oh�	���m�5��'��L+M���'b͗��T��s	{� ���Q���|-�i�R�ֵ����j����7h��8�YRA�.�W�1n8Ƥ1�}\��͒��=0��l��� G�X�zV�q��͵o����<&ߖ.9�`�]g-V� �KOO��.����Z��~��g5��l�G�zw
׭ɨ��ȴ�GյѩՅ�˴iW�lt����~O�нpA����E��!����~�����d��p�+Q/b�N��u���^_����iF����,��A��ZU�}��T*�p�lϯ�`b��Z�i�O:Z�3��M��M{�'�O��+0�B)�[U���u��쀐2I��a��)�������?��}���#94
NgʢJpϧ^:>B�$)q;�����ϖL�ux?����`�aiȫkX*�3R��,柟>��e�b��':':�����Mu�#��T�Y^8!Ze�$N�*�x�RmՇ�`I��ro9�i�U��B��%��Dr׆/�Glėt�%\�܁r��/:Vl��в���%�&)�ƶ��t�9�V0��[$�jJ᭑�C��-�d@5Θ�7\m���<ܽ��)�=;GV�NXJp�&�U�کTwr�X��c�m�:�d>�,�B�VÊk�Ө���a��څ���L�l�c	0�|�3ӡ��C�#��t�:�)�30P��3��C�%�Ead�r�:A�5��+#���X�(і�w�ƹM�+O�L���rXV�v?���r���*�`~�-Jڮ���؊����q�֞AӪ�!��iIu�Z)j
x��X��>�����W� �����$�p��B�,;��6�e���(sMh*|O����ŢP�����L� *�����j���t��a.�lONO�5�	$�KZ��e�
O��><����d$8$�^�x�Y���ŲLB8�Z:"
,SɰPX�_Y��"�E���}`������4����॒��KX7�u��b! ����d�\R�Z�K^a�㌞��>��#�)}v	[�[��SI�S��'.�E�i��4e5Z�,#��쩹}	��=���\ۆ���&�����ot���ԇ��T#��^�w������u�ghU��PRvU���X��U�S>�h$�*9i%
�R)Q�,�����XӰ��R8N(�`[Y��[æ��B��N��8���d|{����vJ��-�RX$�fQ�A�dJ��Ea�-X��@u�)�Y�[/b�C���t!q�T�HD5�都��A5{^9̠$����/`ɼ�В5E3��]�R�[$	S����*��������������A��Y�O���դ~J}ݡ����Y-{JOZ?Ʃ���(��W��S+���&Q��,����_g<���z��|�hj��`P��%�(���[u�Ut�{���H�L��K���������U-�3kQ[+t�K)�)y&��A-K)��!�:�YFv'JH�[�u�
�6����)��M���i�g�Ծ�jO��g0S�je�1��?!^�9�D�.��9{w뫨:����O�+iw���d��m:B��PqT�c��+�E�pm?�0`��s��"���œ��\}E=�b���O�Y����q���-6o��=/ZE�c5@���\J����e�
V�KE�gKy�(��n��ܔ�I'�v�ۂ�*�2�N�MF��YX��~�n��f���ɋ#�E�Z��9��E��c-w+�{'��f�꤫�B����Alb�+�j��]��e��C[#�kt�YĘ�v�M�2�ǹ�)��D��lEeh��#T(`r��6fޯ�K�{�t�Z�a�)a���vS�_� ����,���r��Hp@���|P�N��46�3��Z�^��L��Z��i�%/��L16�/�v�OEP�B�w���7^�?��椏�k��n9[}��"�W��){��",6<�D?���B�y-�wS9/|Éhq@u��^�X�/�tE���/�hd�'�|�[�$��I�K�>��"��ݧ�>���+�$��2��2�p�t���v)�~�+$0U��h�"��{������Q���S>4�CbѰ���l�f�)�=�����K뱉��'�vm�6���R�:A0U[/L"���9޶�
��aHsm�;�v��S�¢�a��<�Mb����%f�	7��)5zq����̗'����Elc&�Ш(����R1���}l�I���7�(A�R�%N��{.�J�D	�Ԫ��������S�^Z������ ��Y���E/��ى�����/��k�A>v���:�4�J��jkgh����Ҹ4U��g����s-F^�:6偅)b�0`ĭu+K�Y��|���TRV�7]�]�$+e��t��NPxm�A����;���+_(�i�\4cĀ%�J'і$�������ը��P�H�f�=vר��F*!��|T�&X�e��A�Ue¨(�ؗNJ��Z��+O\�=
���H�[*��-�K���,.n3�7y~��+$��W�i(_�Q�����0T!��9�*�� U�^Ǟt���������~�������O�o��Gsd�}�W�,��(�r�8 �5�\��9�ꎵ0ޕ�vb�@5;ֹiX��m{@�"��
!3��u�oD��e�uj����>�^l(�.1���#�;JB*��p�by��>���1��K��Ò���V�W+j�[CڎM6NE��څ[����GS��%����K2�<�L
�����k6��lr�U{02�����ӟ��̬)      �   �  x�uW�r�6}�?���m5�t�$��ig:}�(��B
@����gP��vr���9{�:ekm��E����QJ�*��g&�ϊ�	Ks�Nl��^�T�LV<cO�5'-�ZXݪ�{��ɄU	éx�(qDDƥd�M��V�z�X�r�J�%�~�j�ei�e�֓:����ӶS���bi�2�$�;$�@D�e��T��ygJl.�/��A,�*X�Zԑ��[��F�+9j��v��A�{sVx4C�,]��Jjp��7Gl����"��C�Z\�VvP�l׬LY���J*Q+��܈�����m��1�5"2�<42����� �R�~ݚ�7>�G����h~ ˿���縌�9{�;�]c�ݤ,��Q�b�E��Ј�!��E�QZ���ã�9*\q�hˀ)0��]�z��.���[ϵ�'�ٶ]���w�B��Ok�6��i{��<x��5rCO�!����Y��<�|? ߦW
��^���Y��G����w�
J����g3=[c[3� e�M� ����;vgA��gi���\�����t��B ���Xe��@F���U�T1�^��fj?��YuV["eM}(�9�()yV�ߑ�X����^=�5�h�}�Ъ��$����`����-�2����S�	��!9�%[[}��t5�M�z#�L��įCK�T%]�Œj^VJ$�!�������$�K�[y	��V<���˄΋A�V����a)��Kf�bt���,��$E�X5��wjJ��T�kz�O���P~D�2�()������0l!s> �'�@i�?F�$]�|�%M�Ʉ�띁�! �U�n�zX�����hK�AD%�qT%Q#����i���f��p�wuc��|E�0ޒ{Tg�7C�{���� <V���.p�����jI�el��(��e�m4	1���bNd�B��oT�?�Y��+�����8��	���5{:|�-0&SB�H����$f��6Љҋ̊��B�b��Gw<���*�LB��|�"�Iy��Sw�n�`��O?(�����`;���S�,�wҀ�͑�P��$6P�A-kv�rM�~NPׁ�Ag�c�%}�E��4nT���ҿ�"�^-D�W��D�#�JF�O�-�qE5//��l�����0KjN�Jjͫ�*�~�7Нn�S�4�l^xU\J�H�O�N�R�f���7��09����:Y���7-~ك�G�	�R��}"��_�[��4xj�z��!���{ ���x0�}&C��P��8j�{5�$$�ɥoЗi�+��	}����SC��;z�/���d��QÀi}%0�[E{�c����l�>O~z>�;_��I?�ϝ��|2¥d+��_� ]q|�A��HN�Gk�j��:��I.�N<����JЦe�:D�����⡺����E>�	)ao���bp���Z���xm�:s��Вb��[zz]��85vKn�t��׳A�M�w�Rxq~m�rɧ�v�����k|�������]�J�,�I7P�/ӗi����s����-U�!�������(4(\� �����8���䗙zR�ǤF|^%����*A��u��?�Z������3�BlN`Bz?��\]�.L	�*S���X�> k�_ &W��`��MC��e��d/�9�C�|h�i�$,E,�+6��>-9��y� ��W��������+��d���|T|y�Ӊl��D "�Y�
)5R���'h�ǎ9Gn�e
��Y��w�Zh�r��D� p� G��Я��E�f���+�j�<]`m&��;�#�82�Zue0��E����Q<@����3����E�!ՅA�jj�`G��S�O�����q7m7�in�嗼�&^�����;,��Ld[�m2�o����ֽ�(���f��R��Xil�v���G$�}7�1L`J�R~�u ��z�9���"�      �   �  x��V�r�8]�_���U|�ZJ�#�#�n+��t�"�%D�@��r~l��l(OŎ�nW�&%�>�=�\$���x������ca����1{�lF�4n[����plntkɱ߯�Im���l;M��Eq��'J�5}�7V�Ў_�����H���;�ܐR��ig��&�Nj���!ӞZDt�#���]:�'�1�C�8>&�k$���
��������WfGΓhQ�Zj���oz��Q?�O�µc��Į�e���eIvLVTY�����B�d��qɯ�Z8z��N�A/���|�����?�W���!d�$Q���/"��kG��E�o�OP�7Z|��g�R��V��0���X/i4�us��1M��D��n/B!���k�6�yU�"�J�}��'���l�y����n�؊z+�x�%�U]UQ�n�A��`|��� *��S��V����g�x�z٤�))��-��H�<$]�I0���<Y�E*g��c^�l1����v�?��B���-�L�\XǇ�!�dM/#����u��By,F���e$�$F�{�`��Y����?�����:��I��s@�!�ᷢS��`�T��Qr</�8Jv������M ��VW��t��/Ro�Ke?�1%���C�����h�4N ��΋9Rv�:���"�vn��ք7w��"�d�-j�S �����%[=0S(����w������iUQ��kc�����c�~��rkLX)| �=G�l�f�FE:Hʶ���" {T�.��t�c�y�кJ0���7v'�k�q��%w#;R#v���;�|�cw!�4���"x��g�����Ў�_�0�)	D�,����<
ow�Q���q��a4%����1�O-}a����\�W�P�h��n��[�0�)��ܽ��"~���8K���u[��F}?(D�,$f W�_ط����n��=�J}���^VQRC����	��iR:x�ǖBO��?���i�O�|+�[*�+d9�l�lTg�8�u���s��
��%	���k�h�άV��E_�?�����_1��N��3���-U&��,Esi����C�����Ç�֚�$/�4l�o�� �p�Y����(Mؼ��Uhٵ����5�gC�wP8��gu�'q�)�M`�b�hC�{�I[<i�|�5O/����J�X��V��2ŀr���O����}���!}دįHn�XH/��[�vM#��3�=����@��R��a��:"�㢌Ҝ�NZ�3��r���%�[?Jz�~}��g��/�VJZ�������������76P��څ�5�qXM��p��I8q8�`$���n%3���q?�]+��Yh)`�ڼp�YyU�E�V`^#��xYt�C�`I��fN?!F����uR��
����̈́��Z��A�)؟���w')j��1�zT��q=�1�q��!�����b��
3W|f:E�M�-=�_�X�o��O�X���(��-�     