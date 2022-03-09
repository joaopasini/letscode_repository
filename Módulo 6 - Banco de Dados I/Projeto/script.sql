PGDMP                         z            livraria    14.2    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16827    livraria    DATABASE     S   CREATE DATABASE livraria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE livraria;
                postgres    false            �            1259    16828    cliente    TABLE     >  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome_cli character varying(40) NOT NULL,
    email character varying(40) NOT NULL,
    cpf character(11) NOT NULL,
    endereco character varying(50) NOT NULL,
    cep character(8),
    uf character(2),
    telefone character(13),
    ativo bit(1)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16838    editora    TABLE     �   CREATE TABLE public.editora (
    id_editora integer NOT NULL,
    nome_edi character varying(40) NOT NULL,
    gerente character varying(40) NOT NULL,
    e_mail character varying(40) NOT NULL,
    telefone character(13),
    estoque integer NOT NULL
);
    DROP TABLE public.editora;
       public         heap    postgres    false            �            1259    16853    estoque    TABLE     �   CREATE TABLE public.estoque (
    id_estoque integer NOT NULL,
    titulo character varying(40) NOT NULL,
    quantidade integer NOT NULL,
    editora character varying(40) NOT NULL,
    isbn character(13) NOT NULL,
    id_editora integer NOT NULL
);
    DROP TABLE public.estoque;
       public         heap    postgres    false            �            1259    16863    livro    TABLE     J  CREATE TABLE public.livro (
    id_livro integer NOT NULL,
    titulo character varying(40) NOT NULL,
    categoria character varying(40) NOT NULL,
    isbn character(13) NOT NULL,
    autor character varying(40) NOT NULL,
    editora character varying(20) NOT NULL,
    ano_publi character(4),
    id_estoque integer NOT NULL
);
    DROP TABLE public.livro;
       public         heap    postgres    false                      0    16828    cliente 
   TABLE DATA           g   COPY public.cliente (id_cliente, nome_cli, email, cpf, endereco, cep, uf, telefone, ativo) FROM stdin;
    public          postgres    false    209   �                 0    16838    editora 
   TABLE DATA           [   COPY public.editora (id_editora, nome_edi, gerente, e_mail, telefone, estoque) FROM stdin;
    public          postgres    false    210   �                 0    16853    estoque 
   TABLE DATA           \   COPY public.estoque (id_estoque, titulo, quantidade, editora, isbn, id_editora) FROM stdin;
    public          postgres    false    211   �       	          0    16863    livro 
   TABLE DATA           i   COPY public.livro (id_livro, titulo, categoria, isbn, autor, editora, ano_publi, id_estoque) FROM stdin;
    public          postgres    false    212   �       r           2606    16832    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    209            t           2606    16842    editora editora_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_pkey PRIMARY KEY (id_editora);
 >   ALTER TABLE ONLY public.editora DROP CONSTRAINT editora_pkey;
       public            postgres    false    210            v           2606    16857    estoque estoque_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id_estoque);
 >   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_pkey;
       public            postgres    false    211            x           2606    16867    livro livro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_livro);
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    212            y           2606    16858    estoque estoque_id_editora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_id_editora_fkey FOREIGN KEY (id_editora) REFERENCES public.editora(id_editora);
 I   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_id_editora_fkey;
       public          postgres    false    3444    210    211            z           2606    16868    livro livro_id_estoque_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_id_estoque_fkey FOREIGN KEY (id_estoque) REFERENCES public.estoque(id_estoque);
 E   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_id_estoque_fkey;
       public          postgres    false    3446    211    212                  x������ � �            x������ � �            x������ � �      	      x������ � �     