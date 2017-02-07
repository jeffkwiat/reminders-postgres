--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: jeffkwiat
--

CREATE TABLE addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    street_1 text,
    street_2 text,
    city text,
    state text,
    zip text,
    country text
);


ALTER TABLE addresses OWNER TO jeffkwiat;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffkwiat
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO jeffkwiat;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffkwiat
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: addresses_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffkwiat
--

CREATE SEQUENCE addresses_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_user_id_seq OWNER TO jeffkwiat;

--
-- Name: addresses_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffkwiat
--

ALTER SEQUENCE addresses_user_id_seq OWNED BY addresses.user_id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: jeffkwiat
--

CREATE TABLE phone_numbers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    country_code text,
    area_code text,
    exchange_number text,
    line_number text
);


ALTER TABLE phone_numbers OWNER TO jeffkwiat;

--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffkwiat
--

CREATE SEQUENCE phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phone_numbers_id_seq OWNER TO jeffkwiat;

--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffkwiat
--

ALTER SEQUENCE phone_numbers_id_seq OWNED BY phone_numbers.id;


--
-- Name: phone_numbers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffkwiat
--

CREATE SEQUENCE phone_numbers_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phone_numbers_user_id_seq OWNER TO jeffkwiat;

--
-- Name: phone_numbers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffkwiat
--

ALTER SEQUENCE phone_numbers_user_id_seq OWNED BY phone_numbers.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jeffkwiat
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name text,
    first_name text,
    last_name text
);


ALTER TABLE users OWNER TO jeffkwiat;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffkwiat
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jeffkwiat;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffkwiat
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: addresses user_id; Type: DEFAULT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY addresses ALTER COLUMN user_id SET DEFAULT nextval('addresses_user_id_seq'::regclass);


--
-- Name: phone_numbers id; Type: DEFAULT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY phone_numbers ALTER COLUMN id SET DEFAULT nextval('phone_numbers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: jeffkwiat
--

COPY addresses (id, user_id, street_1, street_2, city, state, zip, country) FROM stdin;
1	1	4904 Clarke Street	\N	Oakland	CA	94609	USA
2	1	245 North Point Street	\N	San Francisco	CA	94107	USA
3	2	1086 Howard Street	\N	San Francisco	CA	94103	USA
4	3	123 Main Street	Apt. 2	Kansas City	KS	64108	USA
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffkwiat
--

SELECT pg_catalog.setval('addresses_id_seq', 4, true);


--
-- Name: addresses_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffkwiat
--

SELECT pg_catalog.setval('addresses_user_id_seq', 1, false);


--
-- Data for Name: phone_numbers; Type: TABLE DATA; Schema: public; Owner: jeffkwiat
--

COPY phone_numbers (id, user_id, country_code, area_code, exchange_number, line_number) FROM stdin;
1	1	1	980	226	8766
2	3	1	999	888	7777
3	1	1	808	987	7271
4	2	1	802	321	3273
5	3	1	123	234	4567
\.


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffkwiat
--

SELECT pg_catalog.setval('phone_numbers_id_seq', 5, true);


--
-- Name: phone_numbers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffkwiat
--

SELECT pg_catalog.setval('phone_numbers_user_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jeffkwiat
--

COPY users (id, user_name, first_name, last_name) FROM stdin;
1	jeffkwiat	Jeff	Kwiat
2	courtneyguertin	Courtney	Guertin
3	johndoe	John	Doe
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffkwiat
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffkwiat
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: jeffkwiat
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jeffkwiat;
GRANT ALL ON SCHEMA public TO jeffkwiat;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

