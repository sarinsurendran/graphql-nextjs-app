PGDMP     *                    {            graphql-nextjs-db-api #   14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)    15.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    172171    graphql-nextjs-db-api    DATABASE        CREATE DATABASE "graphql-nextjs-db-api" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
 '   DROP DATABASE "graphql-nextjs-db-api";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    172182    Address    TABLE     �   CREATE TABLE public."Address" (
    id integer NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    country text NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public."Address";
       public         heap    postgres    false    4            �            1259    172181    Address_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Address_id_seq";
       public          postgres    false    4    212                       0    0    Address_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Address_id_seq" OWNED BY public."Address".id;
          public          postgres    false    211            �            1259    172173    User    TABLE     s   CREATE TABLE public."User" (
    id integer NOT NULL,
    "firstName" text,
    "lastName" text,
    email text
);
    DROP TABLE public."User";
       public         heap    postgres    false    4            �            1259    172172    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    210    4                       0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    209            g           2604    172185 
   Address id    DEFAULT     l   ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public."Address_id_seq"'::regclass);
 ;   ALTER TABLE public."Address" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            f           2604    172176    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �          0    172182    Address 
   TABLE DATA           F   COPY public."Address" (id, city, state, country, user_id) FROM stdin;
    public          postgres    false    212   �       �          0    172173    User 
   TABLE DATA           D   COPY public."User" (id, "firstName", "lastName", email) FROM stdin;
    public          postgres    false    210   �                  0    0    Address_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Address_id_seq"', 5, true);
          public          postgres    false    211                       0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 3, true);
          public          postgres    false    209            l           2606    172189    Address Address_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Address" DROP CONSTRAINT "Address_pkey";
       public            postgres    false    212            j           2606    172180    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    210            h           1259    172190    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    210            m           2606    172191    Address Address_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Address" DROP CONSTRAINT "Address_user_id_fkey";
       public          postgres    false    210    212    3178            �   C   x�3��N��+-��N-J�I���K�L�4�2���O�Ȅ	{B�M8��s�8����B�h&@č�b���� x��      �   O   x�3�,N,���,.-J�K)J̃��s3s���s���"���Y(J@Hj�9���8�+�҉ �CebF~>X6F��� �X$     