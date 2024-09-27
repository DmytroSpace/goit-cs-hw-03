PGDMP                       |        
   taskmaster    17.0    17.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388 
   taskmaster    DATABASE     ~   CREATE DATABASE taskmaster WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'German_Germany.1252';
    DROP DATABASE taskmaster;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16399    status    TABLE     X   CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(50)
);
    DROP TABLE public.status;
       public         heap r       postgres    false    4            �            1259    16398    status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public               postgres    false    4    218            �           0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;
          public               postgres    false    217            �            1259    16420    tasks    TABLE     �   CREATE TABLE public.tasks (
    id integer NOT NULL,
    title character varying(100),
    description text,
    status_id integer,
    user_id integer
);
    DROP TABLE public.tasks;
       public         heap r       postgres    false    4            �            1259    16419    tasks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public               postgres    false    4    222            �           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public               postgres    false    221            �            1259    16411    users    TABLE     ~   CREATE TABLE public.users (
    id integer NOT NULL,
    fullname character varying(100),
    email character varying(100)
);
    DROP TABLE public.users;
       public         heap r       postgres    false    4            �            1259    16410    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    220    4            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    219            +           2604    16402 	   status id    DEFAULT     f   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            -           2604    16423    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            ,           2604    16414    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �          0    16399    status 
   TABLE DATA           *   COPY public.status (id, name) FROM stdin;
    public               postgres    false    218   �       �          0    16420    tasks 
   TABLE DATA           K   COPY public.tasks (id, title, description, status_id, user_id) FROM stdin;
    public               postgres    false    222           �          0    16411    users 
   TABLE DATA           4   COPY public.users (id, fullname, email) FROM stdin;
    public               postgres    false    220   b'       �           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 12, true);
          public               postgres    false    217            �           0    0    tasks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tasks_id_seq', 21, true);
          public               postgres    false    221            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public               postgres    false    219            /           2606    16406    status status_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.status DROP CONSTRAINT status_name_key;
       public                 postgres    false    218            1           2606    16404    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public                 postgres    false    218            7           2606    16427    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public                 postgres    false    222            3           2606    16418    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    220            5           2606    16416    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    220            8           2606    16428    tasks tasks_status_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status(id);
 D   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_status_id_fkey;
       public               postgres    false    222    218    4657            9           2606    16433    tasks tasks_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_user_id_fkey;
       public               postgres    false    220    4661    222            �   -   x�3��K-�2���S((�O/J-.�2�L��-�I-IM����� ֐
�      �   D  x�UWے�6}�|����,��kBT��V��E�۶2���2����#ϰ����}n�{l>��%�.��2��Q-:��m��{��;�%���6���Ҫ/1�#&��d�t�J�l��]
j�V|�RƧ�z'����+n����_�N��z��,�m����y��I��N�*��%��Eom�vҨo�<E��<�w����0���+gO��v
��"�2x��r��>��%)=�7��U�%� �EI��#��|��3^�)��y�<=<m>�(v�j5��D�|֙&"eĕ��@��ky8��q��d����\�0�	��.y
<��h�ć2N eqֵ�s���.�Ae
Γ5]Z7�9�M)G ;n����Ja�5�?M��	�=�yx�|��D���%qN�dy�8t�"p4
�8HX��,3�@��$|i!��$k���`J���G�����s�=X�300a^��p���xT��7�4j+]�]-[G��|g�j�;��$�
�����6��WAD�>F 6;�0����K�d "}}P V�h.v�#0�נOAFU�������6Xa�[��`�޲�u=8���סr�$��n`���#���OP�W1�co!s�T�!�/G�Q�Re������w;k��|����e�h���jv���+��Mh'��*���}ԏE��$�=��{#�{��H�Ͷ����+��t�kf3�zu���+j*����ë�=�
�\����a��VDиP;�Ja%N��\��1�����n�|�VR �L2����Pa����RU�l�B��b#��2��/���k����{p��lՊԆeY�Z��N��J���� ��h �&}��������3D�����
�����H�q������ a�6s�c��N�}A���y��6˲7��P3�Gɷ���x1� �}ؕ��fg^@m�a𛆪@uU���࠭�����ƈpBv��MT��Mh|#K���V�L4hC�>��`�@�N����1��((�Rt�	K�L!8�5de�f�|�Bڀ���E�X��)^�c�=�w��is����A��7!~�g�r0'5�'�}DP�����5RQ�5*�q���u|r8>k^�T� ه��gp0�!�T��^�-5��X���ܩY���Pn@	zq
�R+���&�3�F����s�.���l�,$�����̭ۙ��
��4Z��Y$;[y~8>o~�;<���&/[������Ӗ�Ix�z�^Gc��X�-��Qy[�͹Z�Uo·K����P�a������+#B�Xmg+��J�Gۼ�G��D=^qA�]C��]X潭Y�ƨ�����/�k_���5��?L�$���א��]��̀ɢ��XRa��M��������f���lބMM���N�^u��I�g�>���PM{�}��˲ǀ�B�g3]A?LDBq�0�
:!m�+E5�����.q��Ol\#<�@e��n� 3p�Ŭ���~�I��e�B�5(Ϝ�X-�M��}��3��G���.����ܦ i�_��� 1�.��..#��XsD��u��嚰NH�ݏ�쪭�Y`(����䪩��s]�E #�8~�0 s]w�w��*�I�F�+a��� K����`udv`���p�%�Ka��]��<�����9�-���3a��y�5�������{n��^Ǝo8ָ�5[��Ü��B�
�� �.�����N�C�	|��+��6�	 �B3�u�sae/7��zu	$Y7�Ϝ���?k�H�v	�*������ҏ�Q��� `@�C��+g?vquA~uxh���l
��      �     x�]��NA��;O1O����CD��^��2[g:-�,">������=�zN�f��?���m	�TT&�)}c�2Ujѝ�KNB~�f= �[��q/'P�uX�`ۨ�gU&��&�~�0�n��̿�*I�h51���n-����k*%\���k�G���B��T���S�D_�2u{b?ZZ��Ii(1�Ƞ�]�cGv%��m e�������/0l�e�Be���\Y���+Ku���q�9�*�W�۸��9�ǒ     