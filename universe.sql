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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25),
    age_in_millions_of_years integer NOT NULL,
    description text,
    category character varying(15)
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
    name character varying(25),
    planet_id integer NOT NULL,
    diameter_km numeric(5,1),
    discovery_year integer,
    orbital_period_days numeric(7,3)
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
    name character varying(25),
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_days integer
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
    name character varying(25),
    galaxy_id integer NOT NULL,
    spectral_type character varying(12),
    temperature_kelvin integer,
    distance_ly numeric(5,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_cluster (
    star_cluster_id integer NOT NULL,
    name character varying(25),
    galaxy_id integer NOT NULL,
    cluster_type character varying(15),
    num_stars integer,
    is_visible_to_naked_eye boolean
);


ALTER TABLE public.star_cluster OWNER TO freecodecamp;

--
-- Name: star_cluster_star_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_cluster_star_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_cluster_star_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: star_cluster_star_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_cluster_star_cluster_id_seq OWNED BY public.star_cluster.star_cluster_id;


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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_cluster star_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster ALTER COLUMN star_cluster_id SET DEFAULT nextval('public.star_cluster_star_cluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10000, 'has a D25 isophotal diameter of about 46.56 kiloparsecs (152,000 light-years)', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13200, 'has a D25 isophotal diameter of about 26.8 kiloparsecs (87400 light-years)', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 13000, 'The SMC is visible from the entire Southern Hemisphere and can be fully glimpsed low above the southern horizon from latitudes south of about 15° north', 'Irregular');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 13000, 'The first confirmed recorded observation was in 1503–1504 by Amerigo Vespucci in a letter about his third voyage', 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 400, 'Was discovered in 1773', 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13000, 'has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its outer disk', 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475.0, 1600, 27.320);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.2, 1877, 0.319);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.4, 1877, 1.263);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.0, 1610, 1.769);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122.0, 1610, 3.551);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268.0, 1610, 7.155);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821.0, 1610, 16.689);
INSERT INTO public.moon VALUES (8, 'Himalia', 3, 140.0, 1904, 250.600);
INSERT INTO public.moon VALUES (9, 'Elara', 3, 80.0, 1905, 259.600);
INSERT INTO public.moon VALUES (10, 'Pasiphae', 3, 40.0, 1908, 735.000);
INSERT INTO public.moon VALUES (11, 'Titan', 9, 5150.0, 1655, 15.950);
INSERT INTO public.moon VALUES (12, 'Rhea', 9, 1528.0, 1672, 4.518);
INSERT INTO public.moon VALUES (13, 'Iapetus', 9, 1470.0, 1671, 79.330);
INSERT INTO public.moon VALUES (14, 'Dione', 9, 1118.0, 1684, 2.737);
INSERT INTO public.moon VALUES (15, 'Titania', 10, 1578.0, 1787, 8.706);
INSERT INTO public.moon VALUES (16, 'Oberon', 10, 1523.0, 1787, 13.463);
INSERT INTO public.moon VALUES (17, 'Umbriel', 10, 1169.0, 1851, 4.144);
INSERT INTO public.moon VALUES (18, 'Triton', 11, 2707.0, 1846, 5.877);
INSERT INTO public.moon VALUES (19, 'Proteus', 11, 420.0, 1989, 1.122);
INSERT INTO public.moon VALUES (20, 'Nereid', 11, 340.0, 1949, 360.140);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', true, true, 4, 1, 365);
INSERT INTO public.planet VALUES ('Mars', true, false, 4, 2, 687);
INSERT INTO public.planet VALUES ('Jupiter', true, false, 4, 3, 4333);
INSERT INTO public.planet VALUES ('Venus', true, false, 4, 4, 225);
INSERT INTO public.planet VALUES ('Mercury', true, false, 4, 5, 88);
INSERT INTO public.planet VALUES ('Proxima b', true, false, 4, 6, 11);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', true, false, 3, 7, 6);
INSERT INTO public.planet VALUES ('Kepler-22b', false, false, 5, 8, 290);
INSERT INTO public.planet VALUES ('Saturn', true, false, 4, 9, 10759);
INSERT INTO public.planet VALUES ('Uranus', true, false, 4, 10, 30687);
INSERT INTO public.planet VALUES ('Neptune', true, false, 4, 11, 60190);
INSERT INTO public.planet VALUES ('TRAPPIST-1f', true, false, 3, 12, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 2, 'M1-2', 3600, 642.00);
INSERT INTO public.star VALUES (2, 'Rigel', 2, 'B8Ia', 12100, 863.00);
INSERT INTO public.star VALUES (3, 'Vega', 2, 'A0V', 9600, 25.00);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 'M5.5Ve', 3040, 4.24);
INSERT INTO public.star VALUES (5, 'Sirius', 2, 'A1V', 9940, 8.60);
INSERT INTO public.star VALUES (6, 'Arcturus', 2, 'K0III', 4286, 36.70);
INSERT INTO public.star VALUES (7, 'Aldebaran', 2, 'K5III', 3910, 65.00);
INSERT INTO public.star VALUES (8, 'Spica', 2, 'B1III-IV', 22000, 250.00);


--
-- Data for Name: star_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_cluster VALUES (1, 'Beehive Cluster', 2, 'open', 1000, true);
INSERT INTO public.star_cluster VALUES (2, 'Pleiades', 2, 'open', 7000, true);
INSERT INTO public.star_cluster VALUES (3, 'Jewel Box', 2, 'open', 100, true);
INSERT INTO public.star_cluster VALUES (4, 'Hyades', 2, 'open', 200, true);
INSERT INTO public.star_cluster VALUES (5, 'NGC 1818', 3, 'globular', 150000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_cluster_star_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_cluster_star_cluster_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: star_cluster star_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster
    ADD CONSTRAINT star_cluster_pkey PRIMARY KEY (star_cluster_id);


--
-- Name: star_cluster star_cluster_star_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster
    ADD CONSTRAINT star_cluster_star_cluster_id_key UNIQUE (star_cluster_id);


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
-- Name: star_cluster star_cluster_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_cluster
    ADD CONSTRAINT star_cluster_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

