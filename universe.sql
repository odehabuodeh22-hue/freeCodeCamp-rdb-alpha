--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_types character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(40) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(60) NOT NULL,
    agency character varying(40) NOT NULL,
    launch_year integer,
    is_crewed boolean
);


ALTER TABLE public.space_mission OWNER TO postgres;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO postgres;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'Our home galaxy', 13600, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest large galaxy to the Milky Way', 10000, 2.54, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third largest member of the Local Group', 10000, 2.73, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Interacting grand-design spiral', 400, 23.00, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 'Bright nucleus and prominent dust lane', 9000, 29.30, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 'Satellite galaxy of the Milky Way', 13000, 0.16, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, true, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'Larger, inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Smaller, outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 'Most volcanically active body in the solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, 'Icy crust over a subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 'Heavily cratered ancient surface');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, false, 'Reddish, irregular inner moon');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, true, 'Thick atmosphere and methane lakes');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, 'Ice geysers at the south pole');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, true, 'Has a giant crater, Herschel');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, true, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, true, 'Two-toned surface');
INSERT INTO public.moon VALUES (14, 'Titania', 7, 1577, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 1523, true, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 471, true, 'Extremely varied terrain');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 1158, true, 'Bright, young surface');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1169, true, 'Dark, heavily cratered moon');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 2707, true, 'Retrograde orbit, likely a captured Kuiper belt object');
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 340, false, 'Highly eccentric orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 16);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', false, true, 0);
INSERT INTO public.planet VALUES (10, 'Proxima d', 4, 'Terrestrial', false, true, 0);
INSERT INTO public.planet VALUES (11, 'Sirius Alpha', 2, 'Hypothetical', false, true, 0);
INSERT INTO public.planet VALUES (12, 'Betelgeuse I', 3, 'Hypothetical', false, true, 0);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', 'NASA', 1969, true);
INSERT INTO public.space_mission VALUES (2, 'Voyager 1', 'NASA', 1977, false);
INSERT INTO public.space_mission VALUES (3, 'Hubble Space Telescope', 'NASA', 1990, false);
INSERT INTO public.space_mission VALUES (4, 'Vostok 1', 'Soviet Space Program', 1961, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 0.00, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 8.60, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8, 548.00, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4850, 4.24, true);
INSERT INTO public.star VALUES (5, 'V1 Andromeda', 2, 100, 2540000.00, true);
INSERT INTO public.star VALUES (6, 'R136a1', 6, 1, 163000.00, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

