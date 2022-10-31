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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    description text,
    diameter integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    junction_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_junction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_junction_id_seq OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_junction_id_seq OWNED BY public.junction.junction_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    weight_in_t numeric(6,2),
    description text,
    diameter integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    weight_in_t numeric(6,2),
    description text,
    diameter integer,
    is_it_livable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    weight_in_t integer,
    description text,
    diameter integer,
    is_it_sun boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: junction junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction ALTER COLUMN junction_id SET DEFAULT nextval('public.junction_junction_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 20, 'It is supposed to be the closest galaxy to ours.', 1000);
INSERT INTO public.galaxy VALUES (2, 'This', 15, 'It is our galaxy.', 800);
INSERT INTO public.galaxy VALUES (3, 'Another', 5, 'galaxy.', 5800);
INSERT INTO public.galaxy VALUES (4, 'Another23', 5, 'galaxy.', 500);
INSERT INTO public.galaxy VALUES (5, 'Ashi3', 75, 'galaxy.', 500);
INSERT INTO public.galaxy VALUES (6, 'yoshi', 175, 'galaxy.', 5900);


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (1, 'WTH', 2);
INSERT INTO public.junction VALUES (2, 'WTF', 3);
INSERT INTO public.junction VALUES (3, 'BH', 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (12, 'Moon', 12, NULL, NULL, 1560);
INSERT INTO public.moon VALUES (13, 'Titan', 9, NULL, NULL, 199752);
INSERT INTO public.moon VALUES (14, 'Mario', 10, NULL, NULL, 5487223);
INSERT INTO public.moon VALUES (15, 'Luigi', 11, NULL, NULL, 64521);
INSERT INTO public.moon VALUES (16, 'Daisy', 13, NULL, NULL, 64515);
INSERT INTO public.moon VALUES (17, 'Pentagon', 14, NULL, NULL, 454512);
INSERT INTO public.moon VALUES (18, 'Oneus', 14, NULL, NULL, 5665662);
INSERT INTO public.moon VALUES (19, 'Thor', 9, NULL, NULL, 65656);
INSERT INTO public.moon VALUES (20, 'Tony', 8, NULL, NULL, 65956);
INSERT INTO public.moon VALUES (21, 'Full', 21, NULL, NULL, 1560);
INSERT INTO public.moon VALUES (22, 'Attack', 17, NULL, NULL, 199752);
INSERT INTO public.moon VALUES (23, 'Crock', 18, NULL, NULL, 5487223);
INSERT INTO public.moon VALUES (24, 'Peach', 19, NULL, NULL, 64521);
INSERT INTO public.moon VALUES (25, 'Bebe', 20, NULL, NULL, 64515);
INSERT INTO public.moon VALUES (26, 'Dawn', 16, NULL, NULL, 454512);
INSERT INTO public.moon VALUES (27, 'Oneone', 16, NULL, NULL, 5665662);
INSERT INTO public.moon VALUES (28, 'Loki', 21, NULL, NULL, 65656);
INSERT INTO public.moon VALUES (29, 'Stark', 12, NULL, NULL, 65956);
INSERT INTO public.moon VALUES (30, '24Hours', 15, NULL, NULL, 1560);
INSERT INTO public.moon VALUES (31, 'Eren', 18, NULL, NULL, 199752);
INSERT INTO public.moon VALUES (32, 'Crock2', 20, NULL, NULL, 5487223);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Earth', 1, 800.00, NULL, NULL, true);
INSERT INTO public.planet VALUES (9, 'Jupiter', 1, 1900.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (10, 'Andromedian1', 2, 800.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (11, 'Some', 2, 500.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (12, 'Any Song', 3, 7950.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (13, 'Turul', 3, 5462.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (14, 'Aliens', 3, 5476.00, NULL, NULL, true);
INSERT INTO public.planet VALUES (15, 'Pluto', 1, 800.00, NULL, NULL, true);
INSERT INTO public.planet VALUES (16, 'Saturnus', 1, 1900.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (17, 'Earthian', 2, 800.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (18, 'Any', 2, 500.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (19, 'Tico', 3, 7950.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (20, 'Skipper', 3, 5462.00, NULL, NULL, false);
INSERT INTO public.planet VALUES (21, 'Avatar', 3, 5476.00, NULL, NULL, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, NULL, NULL, NULL, true);
INSERT INTO public.star VALUES (2, 'Sona', 1, NULL, NULL, NULL, false);
INSERT INTO public.star VALUES (3, 'Yona', 2, NULL, NULL, NULL, false);
INSERT INTO public.star VALUES (5, 'Yora', 2, NULL, NULL, NULL, false);
INSERT INTO public.star VALUES (6, 'Yasuo', 3, NULL, NULL, NULL, false);
INSERT INTO public.star VALUES (7, 'Riven', 5, NULL, NULL, NULL, true);
INSERT INTO public.star VALUES (8, 'Lucifer', 6, NULL, NULL, NULL, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junction_junction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_junction_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction junction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_name_key UNIQUE (name);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: junction junction_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

