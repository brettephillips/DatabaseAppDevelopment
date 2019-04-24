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
    score real NOT NULL
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
26	Test	2
28	Blue Power	8
29	Awesome Black Deck	13
30	Mono-Blue Aggro	14
32	Green Nature Power	14
33	ESPER CONTROL DECK	15
\.


--
-- Data for Name: deck_card; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.deck_card (card_id, deck_id, api_id, card_name, image_url) FROM stdin;
64	19	129477	Ballista Squad	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129477&type=card
70	19	338472	Greater Mossdog	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=338472&type=card
72	1	152059	Parapet Watchers	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=152059&type=card
75	19	4184	Icatian Store	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4184&type=card
77	1	4184	Icatian Store	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4184&type=card
78	1	4184	Icatian Store	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4184&type=card
79	1	4184	Icatian Store	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4184&type=card
88	1	2141	Zombie Master	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2141&type=card
89	19	2141	Zombie Master	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2141&type=card
91	19	130550	Ancestor's Chosen	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card
95	19	129572	Glorious Anthem	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129572&type=card
96	1	130554	Cho-Manno, Revolutionary	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130554&type=card
100	19	130554	Cho-Manno, Revolutionary	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130554&type=card
104	19	130554	Cho-Manno, Revolutionary	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130554&type=card
105	1	130528	Condemn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130528&type=card
106	19	130528	Condemn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130528&type=card
112	19	74237	Our Market Research Shows That Players Like Really Long Card Names So We Made this Card to Have the Absolute Longest Card Name Ever Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74237&type=card
114	1	74237	Our Market Research Shows That Players Like Really Long Card Names So We Made this Card to Have the Absolute Longest Card Name Ever Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74237&type=card
115	1	394088	Watcher of the Roost	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=394088&type=card
116	26	394088	Watcher of the Roost	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=394088&type=card
117	1	398427	Pyromancer's Goggles	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=398427&type=card
120	19	129710	Angelic Chorus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129710&type=card
121	19	129710	Angelic Chorus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129710&type=card
123	19	129710	Angelic Chorus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129710&type=card
124	1	26638	Killer Whale	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=26638&type=card
125	1	26638	Killer Whale	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=26638&type=card
126	1	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
127	1	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
128	1	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
129	1	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
131	19	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
132	19	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
134	19	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
135	19	135216	Dross Crocodile	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135216&type=card
136	1	129743	Spineless Thug	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129743&type=card
137	1	129743	Spineless Thug	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129743&type=card
138	1	129743	Spineless Thug	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129743&type=card
139	1	129743	Spineless Thug	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129743&type=card
140	1	129743	Spineless Thug	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129743&type=card
141	1	129743	Spineless Thug	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129743&type=card
151	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
152	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
153	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
154	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
155	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
156	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
157	1	2279	Giant Strength	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2279&type=card
158	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
159	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
160	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
161	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
162	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
163	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
164	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
165	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
166	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
167	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
168	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
169	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
170	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
171	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
172	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
173	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
174	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
175	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
176	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
177	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
178	1	704	Invisibility	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=704&type=card
179	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
180	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
181	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
182	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
183	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
184	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
185	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
186	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
187	1	2189	Sunken City	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2189&type=card
188	1	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
189	1	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
190	1	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
191	1	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
192	19	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
193	19	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
194	26	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
195	19	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
196	19	83433	Hollow Dogs	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=83433&type=card
197	29	129529	Drudge Skeletons	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129529&type=card
200	29	129529	Drudge Skeletons	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129529&type=card
202	29	1157	Drudge Skeletons	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1157&type=card
209	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
210	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
211	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
213	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
214	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
215	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
216	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
218	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
219	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
220	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
221	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
222	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
223	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
224	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
225	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
226	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
228	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
229	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
231	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
232	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
233	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
234	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
235	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
236	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
238	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
239	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
240	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
241	29	222715	Triskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222715&type=card
245	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
246	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
247	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
248	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
250	29	205306	Skeleton Shard	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=205306&type=card
251	29	205306	Skeleton Shard	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=205306&type=card
252	29	205306	Skeleton Shard	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=205306&type=card
253	29	2737	Skeleton Ship	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2737&type=card
254	29	2737	Skeleton Ship	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2737&type=card
255	29	2737	Skeleton Ship	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2737&type=card
256	29	2737	Skeleton Ship	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=2737&type=card
257	29	45311	Drudge Skeletons	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=45311&type=card
258	29	45311	Drudge Skeletons	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=45311&type=card
259	29	394621	Marang River Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=394621&type=card
260	29	394621	Marang River Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=394621&type=card
262	29	394621	Marang River Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=394621&type=card
263	29	690	Zombie Master	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=690&type=card
264	29	690	Zombie Master	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=690&type=card
265	29	3890	Zombie Master	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3890&type=card
266	29	3890	Zombie Master	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3890&type=card
267	29	16627	Scathe Zombies	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=16627&type=card
268	29	16627	Scathe Zombies	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=16627&type=card
269	29	16627	Scathe Zombies	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=16627&type=card
270	29	31763	Bog Wreckage	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=31763&type=card
271	29	31763	Bog Wreckage	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=31763&type=card
272	29	31763	Bog Wreckage	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=31763&type=card
273	29	31763	Bog Wreckage	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=31763&type=card
274	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
275	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
276	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
277	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
294	30	442944	Merfolk Trickster	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442944&type=card
295	30	442944	Merfolk Trickster	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442944&type=card
296	30	442944	Merfolk Trickster	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442944&type=card
297	30	442944	Merfolk Trickster	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442944&type=card
298	30	450257	Mist-Cloaked Herald	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=450257&type=card
299	30	450257	Mist-Cloaked Herald	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=450257&type=card
300	30	450257	Mist-Cloaked Herald	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=450257&type=card
301	30	450257	Mist-Cloaked Herald	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=450257&type=card
302	30	435232	Siren Stormtamer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435232&type=card
303	30	435232	Siren Stormtamer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435232&type=card
304	30	435232	Siren Stormtamer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435232&type=card
305	30	435232	Siren Stormtamer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435232&type=card
306	30	442956	Tempest Djinn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442956&type=card
307	30	442956	Tempest Djinn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442956&type=card
308	30	442956	Tempest Djinn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442956&type=card
309	30	442956	Tempest Djinn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442956&type=card
310	30	439717	Warkite Marauder	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439717&type=card
311	30	439717	Warkite Marauder	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439717&type=card
312	30	439717	Warkite Marauder	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439717&type=card
313	30	439717	Warkite Marauder	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439717&type=card
314	30	442934	Blink of an Eye	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442934&type=card
315	30	435205	Dive Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435205&type=card
316	30	435205	Dive Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435205&type=card
317	30	435205	Dive Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435205&type=card
318	30	435205	Dive Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435205&type=card
319	30	429876	Spell Pierce	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=429876&type=card
320	30	429876	Spell Pierce	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=429876&type=card
321	30	429876	Spell Pierce	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=429876&type=card
322	30	442963	Wizard's Retort	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442963&type=card
323	30	442963	Wizard's Retort	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442963&type=card
324	30	442963	Wizard's Retort	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442963&type=card
325	30	442963	Wizard's Retort	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442963&type=card
326	30	439692	Curious Obsession	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439692&type=card
327	30	439692	Curious Obsession	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439692&type=card
328	30	439692	Curious Obsession	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439692&type=card
329	30	439692	Curious Obsession	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439692&type=card
330	30	22988	Opt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22988&type=card
331	30	22988	Opt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22988&type=card
332	30	22988	Opt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22988&type=card
333	30	22988	Opt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22988&type=card
334	30	435200	Chart a Course	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435200&type=card
335	30	435200	Chart a Course	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435200&type=card
336	30	435201	Daring Saboteur	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435201&type=card
337	30	442938	Deep Freeze	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442938&type=card
338	30	442938	Deep Freeze	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442938&type=card
339	30	435207	Entrancing Melody	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435207&type=card
340	30	435207	Entrancing Melody	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435207&type=card
341	30	435207	Entrancing Melody	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435207&type=card
342	30	426754	Essence Scatter	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=426754&type=card
343	30	435212	Jace, Cunning Castaway	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435212&type=card
344	30	442889	Karn, Scion of Urza	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442889&type=card
345	30	416874	Negate	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=416874&type=card
346	30	416874	Negate	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=416874&type=card
347	30	452798	Nightveil Sprite	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452798&type=card
348	30	435407	Sorcerous Spyglass	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435407&type=card
349	32	129655	Natural Spring	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129655&type=card
350	32	129655	Natural Spring	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129655&type=card
351	32	129655	Natural Spring	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129655&type=card
353	32	158747	Dawnglow Infusion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=158747&type=card
354	32	158747	Dawnglow Infusion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=158747&type=card
355	32	158747	Dawnglow Infusion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=158747&type=card
356	32	158747	Dawnglow Infusion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=158747&type=card
357	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
358	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
359	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
360	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
361	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
362	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
363	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
364	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
365	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
366	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
367	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
368	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
369	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
370	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
371	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
372	30	129606	Island	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129606&type=card
373	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
374	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
375	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
376	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
377	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
378	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
379	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
380	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
381	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
382	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
383	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
384	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
385	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
386	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
387	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
388	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
389	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
390	32	129560	Forest	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129560&type=card
391	32	130483	Abundance	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130483&type=card
392	32	130483	Abundance	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130483&type=card
393	32	130483	Abundance	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130483&type=card
394	32	130483	Abundance	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130483&type=card
395	32	130521	Commune with Nature	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130521&type=card
396	32	130521	Commune with Nature	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130521&type=card
397	32	130521	Commune with Nature	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130521&type=card
398	32	130521	Commune with Nature	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130521&type=card
399	32	135266	Elven Riders	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135266&type=card
400	32	135266	Elven Riders	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135266&type=card
401	32	135266	Elven Riders	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135266&type=card
402	32	135266	Elven Riders	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135266&type=card
403	32	129512	Creeping Mold	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129512&type=card
404	32	129512	Creeping Mold	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129512&type=card
405	32	129512	Creeping Mold	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129512&type=card
406	32	129512	Creeping Mold	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129512&type=card
407	32	135185	Canopy Spider	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135185&type=card
408	32	135185	Canopy Spider	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135185&type=card
409	32	135185	Canopy Spider	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135185&type=card
410	32	135185	Canopy Spider	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135185&type=card
411	32	135226	Lure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135226&type=card
412	32	135226	Lure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135226&type=card
413	32	135226	Lure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135226&type=card
414	32	135226	Lure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=135226&type=card
415	32	129511	Kavu Climber	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129511&type=card
416	32	129511	Kavu Climber	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129511&type=card
417	32	129511	Kavu Climber	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129511&type=card
418	32	129511	Kavu Climber	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129511&type=card
419	32	51161	Tornado Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=51161&type=card
420	32	51161	Tornado Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=51161&type=card
421	32	51161	Tornado Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=51161&type=card
422	32	51161	Tornado Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=51161&type=card
423	32	45448	Thorn Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=45448&type=card
424	32	45448	Thorn Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=45448&type=card
425	32	45448	Thorn Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=45448&type=card
426	32	45448	Thorn Elemental	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=45448&type=card
427	32	185053	Bloodbraid Elf	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=185053&type=card
428	32	185053	Bloodbraid Elf	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=185053&type=card
429	32	185053	Bloodbraid Elf	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=185053&type=card
430	32	185053	Bloodbraid Elf	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=185053&type=card
431	32	423786	Peema Aether-Seer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=423786&type=card
432	32	423786	Peema Aether-Seer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=423786&type=card
433	32	423786	Peema Aether-Seer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=423786&type=card
434	32	423786	Peema Aether-Seer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=423786&type=card
435	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
436	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
437	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
438	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
439	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
440	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
441	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
442	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
443	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
444	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
445	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
446	29	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
447	33	23155	Absorb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=23155&type=card
448	33	23155	Absorb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=23155&type=card
449	33	23155	Absorb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=23155&type=card
450	33	442969	Cast Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442969&type=card
451	33	442969	Cast Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442969&type=card
452	33	442969	Cast Down	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442969&type=card
453	33	452782	Chemister's Insight	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452782&type=card
454	33	452782	Chemister's Insight	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452782&type=card
455	33	452782	Chemister's Insight	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452782&type=card
456	33	420829	Mortify	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=420829&type=card
457	33	420829	Mortify	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=420829&type=card
458	33	420829	Mortify	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=420829&type=card
459	33	423707	Negate	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=423707&type=card
460	33	423707	Negate	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=423707&type=card
461	33	435283	Vraska's Contempt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435283&type=card
462	33	435283	Vraska's Contempt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435283&type=card
463	33	435283	Vraska's Contempt	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435283&type=card
464	33	457214	Cry of the Carnarium	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=457214&type=card
465	33	457214	Cry of the Carnarium	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=457214&type=card
466	33	457331	Kaya's Wrath	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=457331&type=card
467	33	457331	Kaya's Wrath	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=457331&type=card
468	33	457331	Kaya's Wrath	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=457331&type=card
469	33	452956	Thought Erasure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452956&type=card
470	33	452956	Thought Erasure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452956&type=card
471	33	452956	Thought Erasure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452956&type=card
472	33	452956	Thought Erasure	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=452956&type=card
473	33	435226	Search for Azcanta	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435226&type=card
474	33	435226	Search for Azcanta	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435226&type=card
475	33	442978	The Eldest Reborn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442978&type=card
476	33	442889	Karn, Scion of Urza	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442889&type=card
477	33	443095	Teferi, Hero of Dominaria	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=443095&type=card
478	33	443095	Teferi, Hero of Dominaria	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=443095&type=card
479	33	443095	Teferi, Hero of Dominaria	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=443095&type=card
480	33	443095	Teferi, Hero of Dominaria	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=443095&type=card
481	33	430633	Drowned Catacomb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430633&type=card
482	33	430633	Drowned Catacomb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430633&type=card
483	33	430633	Drowned Catacomb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430633&type=card
484	33	430633	Drowned Catacomb	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430633&type=card
485	33	190562	Glacial Fortress	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=190562&type=card
486	33	190562	Glacial Fortress	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=190562&type=card
487	33	190562	Glacial Fortress	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=190562&type=card
488	33	190562	Glacial Fortress	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=190562&type=card
489	33	405099	Godless Shrine	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405099&type=card
490	33	405099	Godless Shrine	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405099&type=card
491	33	405099	Godless Shrine	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405099&type=card
492	33	405099	Godless Shrine	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405099&type=card
493	33	405100	Hallowed Fountain	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405100&type=card
494	33	405100	Hallowed Fountain	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405100&type=card
495	33	405100	Hallowed Fountain	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405100&type=card
496	33	405100	Hallowed Fountain	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=405100&type=card
497	33	241979	Isolated Chapel	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=241979&type=card
498	33	241979	Isolated Chapel	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=241979&type=card
499	33	241979	Isolated Chapel	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=241979&type=card
500	33	241979	Isolated Chapel	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=241979&type=card
501	33	129681	Plains	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129681&type=card
502	33	129754	Swamp	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=129754&type=card
503	33	366335	Watery Grave	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=366335&type=card
504	33	366335	Watery Grave	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=366335&type=card
505	33	366335	Watery Grave	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=366335&type=card
506	33	366335	Watery Grave	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=366335&type=card
507	33	442978	The Eldest Reborn	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442978&type=card
508	33	197004	Duress	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=197004&type=card
509	33	197004	Duress	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=197004&type=card
510	33	435379	Hostage Taker	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435379&type=card
511	33	435379	Hostage Taker	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435379&type=card
512	33	435379	Hostage Taker	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=435379&type=card
513	33	442914	Lyra Dawnbringer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442914&type=card
514	33	442914	Lyra Dawnbringer	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442914&type=card
515	33	439736	Moment of Craving	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439736&type=card
516	33	439736	Moment of Craving	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=439736&type=card
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.rating (rating_id, deck_id, score) FROM stdin;
1	1	5
2	1	3
3	1	4
4	1	5
5	1	4
6	1	4
7	29	3.4000001
8	30	3.4000001
9	29	1.70000005
10	1	1.29999995
11	1	1.20000005
12	1	1.39999998
13	30	4.80000019
14	30	5
15	30	5
16	30	4.9000001
17	30	2.4000001
18	30	5
19	30	4.80000019
20	33	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.users (user_id, username, password) FROM stdin;
2	dan	$2b$12$36EKImw626h4xG/DHEU4QeTklFoXWB.RMXv9SBEvYPE4UrlUX0Equ
3	Alex	$2b$12$itK2aMPdXT20hMCyJNcqo.nimwNbQy6dn64JNWXO4xi4pnfVPurJa
8	test	$2b$12$dgJN3Hxu7FrBCzePRvdKGO.xwRb7SkE2B.K/erE4xDDslYPn1Pf6i
13	billy	$2b$12$FA6HClAal0W9JqRHUU5BCe/9tQCyPDV1.5jK8QAfEbD.xyUte1wo2
14	john12	$2b$12$bb1tO6wnfMB78Yn.ZI/WL.nBXBA7tr.oDUQKjMvHbjfhPCROO3dlS
15	mtg_master	$2b$12$0vYNuQFs44zcLTCrfI5BfONkfRdcokQ1WNiS1jWgg6X8ZtsNOcI4m
\.


--
-- Name: deck_card_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_card_card_id_seq', 516, true);


--
-- Name: deck_deck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_deck_id_seq', 33, true);


--
-- Name: rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.rating_rating_id_seq', 20, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


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

