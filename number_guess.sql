--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_of_guesses integer,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2, 1);
INSERT INTO public.games VALUES (2, 7, 1);
INSERT INTO public.games VALUES (3, 679, 18);
INSERT INTO public.games VALUES (4, 688, 18);
INSERT INTO public.games VALUES (5, 340, 19);
INSERT INTO public.games VALUES (6, 361, 19);
INSERT INTO public.games VALUES (7, 537, 18);
INSERT INTO public.games VALUES (8, 140, 18);
INSERT INTO public.games VALUES (9, 184, 20);
INSERT INTO public.games VALUES (10, 198, 20);
INSERT INTO public.games VALUES (11, 908, 21);
INSERT INTO public.games VALUES (12, 619, 21);
INSERT INTO public.games VALUES (13, 477, 20);
INSERT INTO public.games VALUES (14, 466, 20);
INSERT INTO public.games VALUES (15, 914, 22);
INSERT INTO public.games VALUES (16, 608, 22);
INSERT INTO public.games VALUES (17, 935, 23);
INSERT INTO public.games VALUES (18, 691, 23);
INSERT INTO public.games VALUES (19, 544, 22);
INSERT INTO public.games VALUES (20, 400, 22);
INSERT INTO public.games VALUES (21, 810, 24);
INSERT INTO public.games VALUES (22, 152, 24);
INSERT INTO public.games VALUES (23, 672, 26);
INSERT INTO public.games VALUES (24, 72, 26);
INSERT INTO public.games VALUES (25, 353, 24);
INSERT INTO public.games VALUES (26, 680, 24);
INSERT INTO public.games VALUES (27, 568, 32);
INSERT INTO public.games VALUES (28, 980, 32);
INSERT INTO public.games VALUES (29, 280, 33);
INSERT INTO public.games VALUES (30, 872, 33);
INSERT INTO public.games VALUES (31, 110, 32);
INSERT INTO public.games VALUES (32, 536, 32);
INSERT INTO public.games VALUES (33, 192, 34);
INSERT INTO public.games VALUES (34, 227, 34);
INSERT INTO public.games VALUES (35, 283, 35);
INSERT INTO public.games VALUES (36, 148, 35);
INSERT INTO public.games VALUES (37, 171, 34);
INSERT INTO public.games VALUES (38, 839, 34);
INSERT INTO public.games VALUES (39, 298, 36);
INSERT INTO public.games VALUES (40, 170, 36);
INSERT INTO public.games VALUES (41, 601, 37);
INSERT INTO public.games VALUES (42, 821, 37);
INSERT INTO public.games VALUES (43, 576, 36);
INSERT INTO public.games VALUES (44, 507, 36);
INSERT INTO public.games VALUES (45, 1000, 38);
INSERT INTO public.games VALUES (46, 12, 38);
INSERT INTO public.games VALUES (47, 113, 39);
INSERT INTO public.games VALUES (48, 946, 39);
INSERT INTO public.games VALUES (49, 399, 38);
INSERT INTO public.games VALUES (50, 697, 38);
INSERT INTO public.games VALUES (51, 222, 40);
INSERT INTO public.games VALUES (52, 505, 40);
INSERT INTO public.games VALUES (53, 727, 41);
INSERT INTO public.games VALUES (54, 524, 41);
INSERT INTO public.games VALUES (55, 723, 40);
INSERT INTO public.games VALUES (56, 654, 40);
INSERT INTO public.games VALUES (57, 16, 1);
INSERT INTO public.games VALUES (58, 645, 42);
INSERT INTO public.games VALUES (59, 918, 42);
INSERT INTO public.games VALUES (60, 336, 43);
INSERT INTO public.games VALUES (61, 308, 43);
INSERT INTO public.games VALUES (62, 527, 42);
INSERT INTO public.games VALUES (63, 149, 42);
INSERT INTO public.games VALUES (64, 8, 1);
INSERT INTO public.games VALUES (65, 10, 44);
INSERT INTO public.games VALUES (66, 11, 44);
INSERT INTO public.games VALUES (67, 335, 45);
INSERT INTO public.games VALUES (68, 477, 45);
INSERT INTO public.games VALUES (69, 656, 46);
INSERT INTO public.games VALUES (70, 919, 46);
INSERT INTO public.games VALUES (71, 207, 45);
INSERT INTO public.games VALUES (72, 944, 45);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Ildi');
INSERT INTO public.users VALUES (2, 'user_1671572663753');
INSERT INTO public.users VALUES (3, 'user_1671572663752');
INSERT INTO public.users VALUES (4, 'user_1671573335073');
INSERT INTO public.users VALUES (5, 'user_1671573335072');
INSERT INTO public.users VALUES (6, 'user_1671573455773');
INSERT INTO public.users VALUES (7, 'user_1671573455772');
INSERT INTO public.users VALUES (8, 'user_1671573515327');
INSERT INTO public.users VALUES (9, 'user_1671573515326');
INSERT INTO public.users VALUES (10, 'user_1671573536117');
INSERT INTO public.users VALUES (11, 'user_1671573536116');
INSERT INTO public.users VALUES (12, 'user_1671573562664');
INSERT INTO public.users VALUES (13, 'user_1671573562663');
INSERT INTO public.users VALUES (14, 'user_1671573867191');
INSERT INTO public.users VALUES (15, 'user_1671573867190');
INSERT INTO public.users VALUES (16, 'user_1671573885677');
INSERT INTO public.users VALUES (17, 'user_1671573885676');
INSERT INTO public.users VALUES (18, 'user_1671575541933');
INSERT INTO public.users VALUES (19, 'user_1671575541932');
INSERT INTO public.users VALUES (20, 'user_1671575602534');
INSERT INTO public.users VALUES (21, 'user_1671575602533');
INSERT INTO public.users VALUES (22, 'user_1671575624891');
INSERT INTO public.users VALUES (23, 'user_1671575624890');
INSERT INTO public.users VALUES (24, 'user_1671576076985');
INSERT INTO public.users VALUES (26, 'user_1671576076984');
INSERT INTO public.users VALUES (32, 'user_1671576797419');
INSERT INTO public.users VALUES (33, 'user_1671576797418');
INSERT INTO public.users VALUES (34, 'user_1671577317110');
INSERT INTO public.users VALUES (35, 'user_1671577317109');
INSERT INTO public.users VALUES (36, 'user_1671577452531');
INSERT INTO public.users VALUES (37, 'user_1671577452530');
INSERT INTO public.users VALUES (38, 'user_1671577495219');
INSERT INTO public.users VALUES (39, 'user_1671577495218');
INSERT INTO public.users VALUES (40, 'user_1671577545675');
INSERT INTO public.users VALUES (41, 'user_1671577545674');
INSERT INTO public.users VALUES (42, 'user_1671577927545');
INSERT INTO public.users VALUES (43, 'user_1671577927544');
INSERT INTO public.users VALUES (44, 'Lia');
INSERT INTO public.users VALUES (45, 'user_1671578312085');
INSERT INTO public.users VALUES (46, 'user_1671578312084');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 72, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 46, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

