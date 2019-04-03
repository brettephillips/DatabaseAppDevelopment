--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: deck; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.deck (
    deck_id integer NOT NULL,
    name text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.deck OWNER TO student;

--
-- Name: deck_card; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.deck_card (
    card_id integer NOT NULL,
    deck_id integer NOT NULL,
    api_id integer NOT NULL,
    card_name text NOT NULL,
    image_url text NOT NULL
);


ALTER TABLE public.deck_card OWNER TO student;

--
-- Name: deck_card_card_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.deck_card_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deck_card_card_id_seq OWNER TO student;

--
-- Name: deck_card_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.deck_card_card_id_seq OWNED BY public.deck_card.card_id;


--
-- Name: deck_deck_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.deck_deck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deck_deck_id_seq OWNER TO student;

--
-- Name: deck_deck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.deck_deck_id_seq OWNED BY public.deck.deck_id;


--
-- Name: rating; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.rating (
    rating_id integer NOT NULL,
    deck_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.rating OWNER TO student;

--
-- Name: rating_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.rating_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_rating_id_seq OWNER TO student;

--
-- Name: rating_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.rating_rating_id_seq OWNED BY public.rating.rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO student;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO student;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: deck deck_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.deck ALTER COLUMN deck_id SET DEFAULT nextval('public.deck_deck_id_seq'::regclass);


--
-- Name: deck_card card_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.deck_card ALTER COLUMN card_id SET DEFAULT nextval('public.deck_card_card_id_seq'::regclass);


--
-- Name: rating rating_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.rating ALTER COLUMN rating_id SET DEFAULT nextval('public.rating_rating_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: deck; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.deck (deck_id, name, user_id) FROM stdin;
1	My First Deck	2
19	Test21	2
\.


--
-- Data for Name: deck_card; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.deck_card (card_id, deck_id, api_id, card_name, image_url) FROM stdin;
55	1	130550	Ancestor's Chosen	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card
58	1	130550	Ancestor's Chosen	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card
59	1	130550	Ancestor's Chosen	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card
64	19	129477	Ballista Squad	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card
65	19	129477	Ballista Squad	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card
66	19	129477	Ballista Squad	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card
68	19	129477	Ballista Squad	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card
69	19	129477	Ballista Squad	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.rating (rating_id, deck_id, score) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.users (user_id, username, password) FROM stdin;
2	dan	$2b$12$36EKImw626h4xG/DHEU4QeTklFoXWB.RMXv9SBEvYPE4UrlUX0Equ
3	Alex	$2b$12$itK2aMPdXT20hMCyJNcqo.nimwNbQy6dn64JNWXO4xi4pnfVPurJa
8	test	$2b$12$dgJN3Hxu7FrBCzePRvdKGO.xwRb7SkE2B.K/erE4xDDslYPn1Pf6i
1	test3	\\x24326224313224576830546a47584a546f426847364f393773794150654b65306756394867416f2e34464952705a4a6f2e334a505943786a6e554771
\.


--
-- Name: deck_card_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_card_card_id_seq', 69, true);


--
-- Name: deck_deck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_deck_id_seq', 19, true);


--
-- Name: rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.rating_rating_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: deck deck_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.deck
    ADD CONSTRAINT deck_pkey PRIMARY KEY (deck_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: deck_card deck_card_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.deck_card
    ADD CONSTRAINT deck_card_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.deck(deck_id);


--
-- Name: deck deck_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.deck
    ADD CONSTRAINT deck_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: rating rating_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.deck(deck_id);


--
-- PostgreSQL database dump complete
--

