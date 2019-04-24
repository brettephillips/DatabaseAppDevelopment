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
\.


--
-- Name: deck_card_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_card_card_id_seq', 372, true);


--
-- Name: deck_deck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.deck_deck_id_seq', 32, true);


--
-- Name: rating_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.rating_rating_id_seq', 19, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


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

