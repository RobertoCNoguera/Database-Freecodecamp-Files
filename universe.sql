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
-- Name: funfacts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.funfacts (
    planetfacts text NOT NULL,
    planet_id integer NOT NULL,
    source text NOT NULL,
    name character varying(20),
    funfacts_id integer NOT NULL
);


ALTER TABLE public.funfacts OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(10) NOT NULL,
    galaxy_id integer NOT NULL,
    spiral boolean,
    active_bh boolean,
    more_info text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    color character varying(20),
    spherical boolean
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
    name character varying(10) NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    mass_earths numeric(10,4) NOT NULL,
    radius_mi integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    light_years_away integer NOT NULL,
    solar_radius integer NOT NULL,
    name character varying(25) NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: funfacts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.funfacts VALUES ('Earth inhavits the Goldilocks Zone for life to exist', 1, 'NASA.gov', NULL, 1);
INSERT INTO public.funfacts VALUES ('Mars currently has 7 rovers exploring its surface', 2, 'Republicworld.com', NULL, 2);
INSERT INTO public.funfacts VALUES ('Venus contain a thick atmosphere of CO2 and sulfuric acid clouds', 3, 'Nasa.gov', NULL, 3);
INSERT INTO public.funfacts VALUES ('Jupiter is a gas giant that is home to one of the largest storms in the solar system the "red spot"', 5, 'Nasa.gov', NULL, 4);
INSERT INTO public.funfacts VALUES ('Saturn North Pole contains a storm that is hexagonal in shape', 6, 'Harvard.edu', NULL, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('NGC 4622', 4, true, true, NULL);
INSERT INTO public.galaxy VALUES ('Messier 82', 5, false, true, NULL);
INSERT INTO public.galaxy VALUES ('M33', 6, true, false, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, true, true, 'Andromeda also know as Messier 31, M31, or NGC 224');
INSERT INTO public.galaxy VALUES ('Milky Way', 1, true, true, 'Earth and humans reside in the Milk Way galaxy.');
INSERT INTO public.galaxy VALUES ('Sombrero', 3, false, true, 'Sombrero Galaxy also known as Messier 104, M104, or NGC 4594');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'Gray', true);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'Brown', false);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 'Yellowish', false);
INSERT INTO public.moon VALUES (4, 5, 'Europa', 'Red & White', true);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 'Black & Brown', true);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'White', true);
INSERT INTO public.moon VALUES (7, 5, 'Metis', 'N/A', false);
INSERT INTO public.moon VALUES (8, 5, 'Thebe', 'N/A', false);
INSERT INTO public.moon VALUES (9, 5, 'Carpo', 'Yellow', false);
INSERT INTO public.moon VALUES (10, 5, 'Megaclite', 'N/A', true);
INSERT INTO public.moon VALUES (11, 5, 'Praxidike', 'Red & White', false);
INSERT INTO public.moon VALUES (12, 5, 'Chaldene', 'Brown', false);
INSERT INTO public.moon VALUES (13, 5, 'Io', 'Red & Yellow', true);
INSERT INTO public.moon VALUES (14, 6, 'Titan', 'Yellow', true);
INSERT INTO public.moon VALUES (15, 6, 'Enceladus', 'White', true);
INSERT INTO public.moon VALUES (16, 6, 'Dione', 'White', true);
INSERT INTO public.moon VALUES (17, 6, 'Rhea', 'White', true);
INSERT INTO public.moon VALUES (18, 6, 'Daphnis', 'N/A', false);
INSERT INTO public.moon VALUES (19, 7, 'Proteus', 'Grey', false);
INSERT INTO public.moon VALUES (20, 8, 'Titania', 'Light Brown', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 1.0000, 3958);
INSERT INTO public.planet VALUES ('Mars', 1, 2, 0.1070, 2110);
INSERT INTO public.planet VALUES ('Venus', 1, 3, 0.8150, 3760);
INSERT INTO public.planet VALUES ('Mercury', 1, 4, 0.0550, 1516);
INSERT INTO public.planet VALUES ('Jupiter', 1, 5, 317.8280, 43441);
INSERT INTO public.planet VALUES ('Saturn', 1, 6, 95.1600, 36184);
INSERT INTO public.planet VALUES ('Neptune', 1, 7, 17.1500, 15299);
INSERT INTO public.planet VALUES ('Uranus', 1, 8, 14.5400, 15759);
INSERT INTO public.planet VALUES ('HD 131399', 2, 9, 1.9500, 5976);
INSERT INTO public.planet VALUES ('Tadmor', 8, 10, 2987.0000, NULL);
INSERT INTO public.planet VALUES ('Pluto', 1, 11, 0.0020, 737);
INSERT INTO public.planet VALUES ('Planet X', 1, 12, 25.0000, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 0, 1, 'Sun');
INSERT INTO public.star VALUES (2, 1, 550, 883, 'Antares');
INSERT INTO public.star VALUES (3, 1, 643, 887, 'Betelgeuse');
INSERT INTO public.star VALUES (4, 1, 7800, 1009, 'KW Sagittarii');
INSERT INTO public.star VALUES (5, 1, 4900, 1050, 'VV Cephei A');
INSERT INTO public.star VALUES (6, 1, 6000, 1260, 'Mu Cephei');
INSERT INTO public.star VALUES (7, 1, 9000, 1520, 'V354 Cephei');
INSERT INTO public.star VALUES (8, 1, 3500, 1535, 'RW Cephei');
INSERT INTO public.star VALUES (9, 1, 3900, 1420, 'VY Canis Majoris');
INSERT INTO public.star VALUES (10, 1, 5219, 1700, 'UY Scuti');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: funfacts funfacts_funfacts_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_funfacts_id_key UNIQUE (funfacts_id);


--
-- Name: funfacts funfacts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_pkey PRIMARY KEY (funfacts_id);


--
-- Name: funfacts funfacts_planetfacts_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_planetfacts_key UNIQUE (planetfacts);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_light_years_away_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_light_years_away_key UNIQUE (light_years_away);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: funfacts funfacts_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

