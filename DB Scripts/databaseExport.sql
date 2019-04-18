DROP DATABASE IF EXISTS mtg;
CREATE DATABASE mtg;

\c mtg;

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
203	29	1157	Drudge Skeletons	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1157&type=card
209	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
210	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
211	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
212	29	442138	Skeletonize	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=442138&type=card
213	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
214	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
215	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
216	29	175119	Skeletal Kathari	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175119&type=card
217	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
218	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
219	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
220	29	220515	Reassembling Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=220515&type=card
221	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
222	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
223	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
224	29	175097	Viashino Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175097&type=card
225	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
226	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
227	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
228	29	389674	Skeletal Scrying	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=389674&type=card
229	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
230	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
231	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
232	29	446962	Triskelavus	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=446962&type=card
233	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
234	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
235	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
236	29	201809	Skeletal Vampire	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=201809&type=card
237	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
238	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
239	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
240	29	222743	Serrated Biskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222743&type=card
241	29	222715	Triskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222715&type=card
242	29	222715	Triskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222715&type=card
243	29	222715	Triskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222715&type=card
244	29	222715	Triskelion	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222715&type=card
245	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
246	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
247	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
248	29	368986	Rot Farm Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=368986&type=card
249	29	205306	Skeleton Shard	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=205306&type=card
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
261	29	394621	Marang River Skeleton	http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=394621&type=card
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
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: student
--

COPY public.users (user_id, username, password) FROM stdin;
2	dan	$2b$12$36EKImw626h4xG/DHEU4QeTklFoXWB.RMXv9SBEvYPE4UrlUX0Equ
3	Alex	$2b$12$itK2aMPdXT20hMCyJNcqo.nimwNbQy6dn64JNWXO4xi4pnfVPurJa
8	test	$2b$12$dgJN3Hxu7FrBCzePRvdKGO.xwRb7SkE2B.K/erE4xDDslYPn1Pf6i
13	billy	$2b$12$FA6HClAal0W9JqRHUU5BCe/9tQCyPDV1.5jK8QAfEbD.xyUte1wo2
\.


--
-- Name: deck_card_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_card_card_id_seq', 273, true);


--
-- Name: deck_deck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_deck_id_seq', 29, true);


--
-- Name: rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.rating_rating_id_seq', 6, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


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

