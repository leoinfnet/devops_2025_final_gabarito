--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: acme; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA acme;


ALTER SCHEMA acme OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cerveja; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.cerveja (
                              estilo_id bigint,
                              id bigint NOT NULL,
                              marca_id bigint,
                              nome character varying(255)
);


ALTER TABLE acme.cerveja OWNER TO postgres;

--
-- Name: cerveja_curtidas; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.cerveja_curtidas (
                                       cerveja_id bigint NOT NULL,
                                       curtidas_id bigint NOT NULL
);


ALTER TABLE acme.cerveja_curtidas OWNER TO postgres;

--
-- Name: cerveja_id_seq; Type: SEQUENCE; Schema: acme; Owner: postgres
--

CREATE SEQUENCE acme.cerveja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE acme.cerveja_id_seq OWNER TO postgres;

--
-- Name: cerveja_id_seq; Type: SEQUENCE OWNED BY; Schema: acme; Owner: postgres
--

ALTER SEQUENCE acme.cerveja_id_seq OWNED BY acme.cerveja.id;


--
-- Name: cerveja_lupulos; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.cerveja_lupulos (
                                      cerveja_id bigint NOT NULL,
                                      lupulos_id bigint NOT NULL
);


ALTER TABLE acme.cerveja_lupulos OWNER TO postgres;

--
-- Name: estilo; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.estilo (
                             id bigint NOT NULL,
                             nome character varying(255)
);


ALTER TABLE acme.estilo OWNER TO postgres;

--
-- Name: estilo_id_seq; Type: SEQUENCE; Schema: acme; Owner: postgres
--

CREATE SEQUENCE acme.estilo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE acme.estilo_id_seq OWNER TO postgres;

--
-- Name: estilo_id_seq; Type: SEQUENCE OWNED BY; Schema: acme; Owner: postgres
--

ALTER SEQUENCE acme.estilo_id_seq OWNED BY acme.estilo.id;


--
-- Name: lupulo; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.lupulo (
                             id bigint NOT NULL,
                             descricao character varying(5000),
                             nome character varying(255)
);


ALTER TABLE acme.lupulo OWNER TO postgres;

--
-- Name: lupulo_cervejas; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.lupulo_cervejas (
                                      cervejas_id bigint NOT NULL,
                                      lupulo_id bigint NOT NULL
);


ALTER TABLE acme.lupulo_cervejas OWNER TO postgres;

--
-- Name: lupulo_id_seq; Type: SEQUENCE; Schema: acme; Owner: postgres
--

CREATE SEQUENCE acme.lupulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE acme.lupulo_id_seq OWNER TO postgres;

--
-- Name: lupulo_id_seq; Type: SEQUENCE OWNED BY; Schema: acme; Owner: postgres
--

ALTER SEQUENCE acme.lupulo_id_seq OWNED BY acme.lupulo.id;


--
-- Name: marcas; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.marcas (
                             data_fundacao date,
                             id bigint NOT NULL,
                             pais character varying(30) NOT NULL,
                             email character varying(255),
                             nome character varying(255) NOT NULL
);


ALTER TABLE acme.marcas OWNER TO postgres;

--
-- Name: marcas_id_seq; Type: SEQUENCE; Schema: acme; Owner: postgres
--

CREATE SEQUENCE acme.marcas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE acme.marcas_id_seq OWNER TO postgres;

--
-- Name: marcas_id_seq; Type: SEQUENCE OWNED BY; Schema: acme; Owner: postgres
--

ALTER SEQUENCE acme.marcas_id_seq OWNED BY acme.marcas.id;


--
-- Name: role; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.role (
                           id bigint NOT NULL,
                           nome character varying(255)
);


ALTER TABLE acme.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: acme; Owner: postgres
--

CREATE SEQUENCE acme.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE acme.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: acme; Owner: postgres
--

ALTER SEQUENCE acme.role_id_seq OWNED BY acme.role.id;


--
-- Name: usuario; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.usuario (
                              status integer,
                              id bigint NOT NULL,
                              email character varying(255),
                              nome character varying(255),
                              password character varying(255)
);


ALTER TABLE acme.usuario OWNER TO postgres;

--
-- Name: usuario_cervejas_curtidas; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.usuario_cervejas_curtidas (
                                                cervejas_curtidas_id bigint NOT NULL,
                                                usuario_id bigint NOT NULL
);


ALTER TABLE acme.usuario_cervejas_curtidas OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: acme; Owner: postgres
--

CREATE SEQUENCE acme.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE acme.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: acme; Owner: postgres
--

ALTER SEQUENCE acme.usuario_id_seq OWNED BY acme.usuario.id;


--
-- Name: usuario_roles; Type: TABLE; Schema: acme; Owner: postgres
--

CREATE TABLE acme.usuario_roles (
                                    roles_id bigint NOT NULL,
                                    usuario_id bigint NOT NULL
);


ALTER TABLE acme.usuario_roles OWNER TO postgres;

--
-- Name: cerveja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cerveja (
                                estilo_id bigint,
                                id bigint NOT NULL,
                                marca_id bigint,
                                nome character varying(255)
);


ALTER TABLE public.cerveja OWNER TO postgres;

--
-- Name: cerveja_curtidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cerveja_curtidas (
                                         cerveja_id bigint NOT NULL,
                                         curtidas_id bigint NOT NULL
);


ALTER TABLE public.cerveja_curtidas OWNER TO postgres;

--
-- Name: cerveja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cerveja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cerveja_id_seq OWNER TO postgres;

--
-- Name: cerveja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cerveja_id_seq OWNED BY public.cerveja.id;


--
-- Name: cerveja_lupulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cerveja_lupulos (
                                        cerveja_id bigint NOT NULL,
                                        lupulos_id bigint NOT NULL
);


ALTER TABLE public.cerveja_lupulos OWNER TO postgres;

--
-- Name: estilo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estilo (
                               id bigint NOT NULL,
                               nome character varying(255)
);


ALTER TABLE public.estilo OWNER TO postgres;

--
-- Name: estilo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estilo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estilo_id_seq OWNER TO postgres;

--
-- Name: estilo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estilo_id_seq OWNED BY public.estilo.id;


--
-- Name: lupulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lupulo (
                               id bigint NOT NULL,
                               descricao character varying(5000),
                               nome character varying(255)
);


ALTER TABLE public.lupulo OWNER TO postgres;

--
-- Name: lupulo_cervejas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lupulo_cervejas (
                                        cervejas_id bigint NOT NULL,
                                        lupulo_id bigint NOT NULL
);


ALTER TABLE public.lupulo_cervejas OWNER TO postgres;

--
-- Name: lupulo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lupulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lupulo_id_seq OWNER TO postgres;

--
-- Name: lupulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lupulo_id_seq OWNED BY public.lupulo.id;


--
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marcas (
                               data_fundacao date,
                               id bigint NOT NULL,
                               pais character varying(30) NOT NULL,
                               email character varying(255),
                               nome character varying(255) NOT NULL
);


ALTER TABLE public.marcas OWNER TO postgres;

--
-- Name: marcas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marcas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marcas_id_seq OWNER TO postgres;

--
-- Name: marcas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marcas_id_seq OWNED BY public.marcas.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
                             id bigint NOT NULL,
                             nome character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
                                status integer,
                                id bigint NOT NULL,
                                email character varying(255),
                                nome character varying(255),
                                password character varying(255)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_cervejas_curtidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_cervejas_curtidas (
                                                  cervejas_curtidas_id bigint NOT NULL,
                                                  usuario_id bigint NOT NULL
);


ALTER TABLE public.usuario_cervejas_curtidas OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: usuario_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_roles (
                                      roles_id bigint NOT NULL,
                                      usuario_id bigint NOT NULL
);


ALTER TABLE public.usuario_roles OWNER TO postgres;

--
-- Name: cerveja id; Type: DEFAULT; Schema: acme; Owner: postgres
--

ALTER TABLE ONLY acme.cerveja ALTER COLUMN id SET DEFAULT nextval('acme.cerveja_id_seq'::regclass);


--
-- Name: estilo id; Type: DEFAULT; Schema: acme; Owner: postgres
--

ALTER TABLE ONLY acme.estilo ALTER COLUMN id SET DEFAULT nextval('acme.estilo_id_seq'::regclass);


--
-- Name: lupulo id; Type: DEFAULT; Schema: acme; Owner: postgres
--

ALTER TABLE ONLY acme.lupulo ALTER COLUMN id SET DEFAULT nextval('acme.lupulo_id_seq'::regclass);


--
-- Name: marcas id; Type: DEFAULT; Schema: acme; Owner: postgres
--

ALTER TABLE ONLY acme.marcas ALTER COLUMN id SET DEFAULT nextval('acme.marcas_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: acme; Owner: postgres
--

ALTER TABLE ONLY acme.role ALTER COLUMN id SET DEFAULT nextval('acme.role_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: acme; Owner: postgres
--

ALTER TABLE ONLY acme.usuario ALTER COLUMN id SET DEFAULT nextval('acme.usuario_id_seq'::regclass);


--
-- Name: cerveja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja ALTER COLUMN id SET DEFAULT nextval('public.cerveja_id_seq'::regclass);


--
-- Name: estilo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilo ALTER COLUMN id SET DEFAULT nextval('public.estilo_id_seq'::regclass);


--
-- Name: lupulo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lupulo ALTER COLUMN id SET DEFAULT nextval('public.lupulo_id_seq'::regclass);


--
-- Name: marcas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas ALTER COLUMN id SET DEFAULT nextval('public.marcas_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: cerveja; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.cerveja (estilo_id, id, marca_id, nome) FROM stdin;
\.


--
-- Data for Name: cerveja_curtidas; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.cerveja_curtidas (cerveja_id, curtidas_id) FROM stdin;
\.


--
-- Data for Name: cerveja_lupulos; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.cerveja_lupulos (cerveja_id, lupulos_id) FROM stdin;
\.


--
-- Data for Name: estilo; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.estilo (id, nome) FROM stdin;
\.


--
-- Data for Name: lupulo; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.lupulo (id, descricao, nome) FROM stdin;
\.


--
-- Data for Name: lupulo_cervejas; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.lupulo_cervejas (cervejas_id, lupulo_id) FROM stdin;
\.


--
-- Data for Name: marcas; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.marcas (data_fundacao, id, pais, email, nome) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.role (id, nome) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.usuario (status, id, email, nome, password) FROM stdin;
\.


--
-- Data for Name: usuario_cervejas_curtidas; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.usuario_cervejas_curtidas (cervejas_curtidas_id, usuario_id) FROM stdin;
\.


--
-- Data for Name: usuario_roles; Type: TABLE DATA; Schema: acme; Owner: postgres
--

COPY acme.usuario_roles (roles_id, usuario_id) FROM stdin;
\.


--
-- Data for Name: cerveja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cerveja (estilo_id, id, marca_id, nome) FROM stdin;
2	1	1	Bourbon County Stout
3	2	1	Founders Kentucky Breakfast
2	3	2	Delirium Noctorum
1	4	2	Chzevar
\.


--
-- Data for Name: cerveja_curtidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cerveja_curtidas (cerveja_id, curtidas_id) FROM stdin;
\.


--
-- Data for Name: cerveja_lupulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cerveja_lupulos (cerveja_id, lupulos_id) FROM stdin;
1	1
1	3
1	5
2	3
\.


--
-- Data for Name: estilo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estilo (id, nome) FROM stdin;
1	Pilsner
2	Stout
3	Porter
\.


--
-- Data for Name: lupulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lupulo (id, descricao, nome) FROM stdin;
1	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Ahtanum
2	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Amarillo
3	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Bitter Gold
4	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Horizon
5	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	335 - British Ale II
6	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	1469 - West Yorkshire Ale
7	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Chelan
8	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Sorachi Ace
9	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Yakima Gol
10	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	2633 - Octoberfest Lager Blend
11	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	TriplePearl
12	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Perle
13	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Saaz
14	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Citra
15	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Olympic
16	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec enim diam vulputate ut. Nisi quis eleifend quam adipiscing vitae. Neque convallis a cras semper auctor neque vitae. Sit amet aliquam id diam maecenas ultricies mi eget. Lacus vestibulum sed arcu non odio euismod lacinia at quis. Adipiscing bibendum est ultricies integer quis auctor elit sed. Orci phasellus egestas tellus rutrum tellus. Turpis egestas integer eget aliquet nibh praesent tristique. Mattis rhoncus urna neque viverra justo nec.	Chinook
\.


--
-- Data for Name: lupulo_cervejas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lupulo_cervejas (cervejas_id, lupulo_id) FROM stdin;
\.


--
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marcas (data_fundacao, id, pais, email, nome) FROM stdin;
1886-02-15	1	Alemanha	paulaner@cervejas.de	Paulaner
1753-02-15	2	Belgica	delirium@cervejas.be	Delirium
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, nome) FROM stdin;
1	ADMIN
2	USER
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (status, id, email, nome, password) FROM stdin;
1	1	administrador@acme.com	Patolino	123456
2	2	exfuncionario@acme.com	Eufrasino	123456
\.


--
-- Data for Name: usuario_cervejas_curtidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_cervejas_curtidas (cervejas_curtidas_id, usuario_id) FROM stdin;
\.


--
-- Data for Name: usuario_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_roles (roles_id, usuario_id) FROM stdin;
1	1
2	1
2	2
\.


--
-- Name: cerveja_id_seq; Type: SEQUENCE SET; Schema: acme; Owner: postgres
--

SELECT pg_catalog.setval('acme.cerveja_id_seq', 1, false);


--
-- Name: estilo_id_seq; Type: SEQUENCE SET; Schema: acme; Owner: postgres
--

SELECT pg_catalog.setval('acme.estilo_id_seq', 1, false);


--
-- Name: lupulo_id_seq; Type: SEQUENCE SET; Schema: acme; Owner: postgres
--

SELECT pg_catalog.setval('acme.lupulo_id_seq', 1, false);


--
-- Name: marcas_id_seq; Type: SEQUENCE SET; Schema: acme; Owner: postgres
--

SELECT pg_catalog.setval('acme.marcas_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: acme; Owner: postgres
--

SELECT pg_catalog.setval('acme.role_id_seq', 1, false);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: acme; Owner: postgres
--

SELECT pg_catalog.setval('acme.usuario_id_seq', 1, false);


--
-- Name: cerveja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cerveja_id_seq', 4, true);


--
-- Name: estilo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estilo_id_seq', 3, true);


--
-- Name: lupulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lupulo_id_seq', 16, true);


--
-- Name: marcas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marcas_id_seq', 2, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 2, true);


--
-- Name: cerveja_curtidas cerveja_curtidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja_curtidas
    ADD CONSTRAINT cerveja_curtidas_pkey PRIMARY KEY (cerveja_id, curtidas_id);


--
-- Name: cerveja cerveja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja
    ADD CONSTRAINT cerveja_pkey PRIMARY KEY (id);


--
-- Name: estilo estilo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilo
    ADD CONSTRAINT estilo_pkey PRIMARY KEY (id);


--
-- Name: lupulo lupulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lupulo
    ADD CONSTRAINT lupulo_pkey PRIMARY KEY (id);


--
-- Name: marcas marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: usuario_cervejas_curtidas usuario_cervejas_curtidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_cervejas_curtidas
    ADD CONSTRAINT usuario_cervejas_curtidas_pkey PRIMARY KEY (cervejas_curtidas_id, usuario_id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario_roles usuario_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_pkey PRIMARY KEY (roles_id, usuario_id);


--
-- Name: usuario_cervejas_curtidas fk50wg43d6bg88w2hwmcqyigi3p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_cervejas_curtidas
    ADD CONSTRAINT fk50wg43d6bg88w2hwmcqyigi3p FOREIGN KEY (cervejas_curtidas_id) REFERENCES public.cerveja(id);


--
-- Name: cerveja_curtidas fkd4i102rl8qcybfjqma33um4tf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja_curtidas
    ADD CONSTRAINT fkd4i102rl8qcybfjqma33um4tf FOREIGN KEY (cerveja_id) REFERENCES public.cerveja(id);


--
-- Name: cerveja_lupulos fkdhnqxdtm8ubpq39wtmgyquehk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja_lupulos
    ADD CONSTRAINT fkdhnqxdtm8ubpq39wtmgyquehk FOREIGN KEY (cerveja_id) REFERENCES public.cerveja(id);


--
-- Name: lupulo_cervejas fkelfj1nmj2u3t3u387cvkegclt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lupulo_cervejas
    ADD CONSTRAINT fkelfj1nmj2u3t3u387cvkegclt FOREIGN KEY (cervejas_id) REFERENCES public.cerveja(id);


--
-- Name: cerveja_lupulos fki8lngqoy6wy9tthi0089y4mye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja_lupulos
    ADD CONSTRAINT fki8lngqoy6wy9tthi0089y4mye FOREIGN KEY (lupulos_id) REFERENCES public.lupulo(id);


--
-- Name: cerveja fkiit974t1gqr90qrlidnp1lnqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja
    ADD CONSTRAINT fkiit974t1gqr90qrlidnp1lnqn FOREIGN KEY (estilo_id) REFERENCES public.estilo(id);


--
-- Name: usuario_cervejas_curtidas fkl3grdcctknlgsskhs56xw8lfc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_cervejas_curtidas
    ADD CONSTRAINT fkl3grdcctknlgsskhs56xw8lfc FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: cerveja_curtidas fkpf6cjc8yngje9wyben3eqjgfx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja_curtidas
    ADD CONSTRAINT fkpf6cjc8yngje9wyben3eqjgfx FOREIGN KEY (curtidas_id) REFERENCES public.usuario(id);


--
-- Name: usuario_roles fkqblnumndby0ftm4c7sg6uso6p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT fkqblnumndby0ftm4c7sg6uso6p FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: lupulo_cervejas fkqqigr1e53ll9hvh3ebd12g895; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lupulo_cervejas
    ADD CONSTRAINT fkqqigr1e53ll9hvh3ebd12g895 FOREIGN KEY (lupulo_id) REFERENCES public.lupulo(id);


--
-- Name: usuario_roles fkr5p0u8r15jjo6u7xr1928hsld; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT fkr5p0u8r15jjo6u7xr1928hsld FOREIGN KEY (roles_id) REFERENCES public.role(id);


--
-- Name: cerveja fkrri9jgyd2kxpr1vvcbw2od8l5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cerveja
    ADD CONSTRAINT fkrri9jgyd2kxpr1vvcbw2od8l5 FOREIGN KEY (marca_id) REFERENCES public.marcas(id);


--
-- PostgreSQL database dump complete
--

